import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/sam_controller.dart';
import '../domain/sam_engine.dart';
import '../../auth/controllers/auth_controller.dart';

/// Full-screen conversational AI Copilot interface with Live Geo-Cam & Media Question Solving
class SamCopilotScreen extends ConsumerStatefulWidget {
  final String? initialMediaUrl;
  final String? initialLandmark;

  const SamCopilotScreen({
    super.key,
    this.initialMediaUrl,
    this.initialLandmark,
  });

  @override
  ConsumerState<SamCopilotScreen> createState() => _SamCopilotScreenState();
}

class _SamCopilotScreenState extends ConsumerState<SamCopilotScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  String? _attachedMediaUrl;
  String? _attachedMediaCaption;
  String? _attachedLandmark;

  @override
  void initState() {
    super.initState();
    if (widget.initialMediaUrl != null) {
      _attachedMediaUrl = widget.initialMediaUrl;
      _attachedLandmark = widget.initialLandmark ?? 'Campus Live Camera';
      _attachedMediaCaption = 'Captured via Geo-Cam ($_attachedLandmark)';
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend([String? presetText]) {
    final text = presetText ?? _textController.text;
    if (text.trim().isEmpty && _attachedMediaUrl == null) return;

    ref.read(samControllerProvider.notifier).sendMessage(
      text,
      mediaUrl: _attachedMediaUrl,
      mediaCaption: _attachedMediaCaption,
      geoLandmark: _attachedLandmark,
    );

    _textController.clear();
    setState(() {
      _attachedMediaUrl = null;
      _attachedMediaCaption = null;
      _attachedLandmark = null;
    });
    _scrollToBottom();
  }

  void _showMediaPickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.add_a_photo_rounded, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text('Upload or Snap Question', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Sam AI will extract formulas, analyze problem statements, and explain solutions step-by-step.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: 16),

              // Option 1: Open Live Geo-Cam
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt_rounded, color: AppColors.primary),
                ),
                title: const Text('Open Live Campus Geo-Cam', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                subtitle: const Text('Take a photo of whiteboard, textbook or lab experiment with GPS tag', style: TextStyle(fontSize: 12)),
                onTap: () {
                  Navigator.pop(ctx);
                  context.push('/camera');
                },
              ),
              const Divider(),

              // Preset Academic Question Samples
              const Text('Or Select Sample Question to Solve:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),

              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.accent.withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.functions_rounded, color: AppColors.accent),
                ),
                title: const Text('DAA Recurrence Relation Problem', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                subtitle: const Text('T(n) = 2T(n/2) + O(n) Master Theorem derivation', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  setState(() {
                    _attachedMediaUrl = 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=800';
                    _attachedLandmark = 'Lecture Hall Complex Central Lawn';
                    _attachedMediaCaption = 'DAA Recurrence Question (Exam 2026)';
                  });
                },
              ),

              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.secondary.withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.table_view_rounded, color: AppColors.secondary),
                ),
                title: const Text('DBMS Normalization & Functional Dependency', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                subtitle: const Text('Find Candidate Keys & highest Normal Form (2NF/3NF/BCNF)', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  setState(() {
                    _attachedMediaUrl = 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=800';
                    _attachedLandmark = 'Central Library Knowledge Hub';
                    _attachedMediaCaption = 'DBMS Normal Form Problem';
                  });
                },
              ),

              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: const Color(0xFF6366F1).withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.memory_rounded, color: Color(0xFF6366F1)),
                ),
                title: const Text('Operating Systems Banker\'s Algorithm', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                subtitle: const Text('Calculate Safe Sequence for Allocation Matrix', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  setState(() {
                    _attachedMediaUrl = 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=800';
                    _attachedLandmark = 'Bharti School CS Lab 3';
                    _attachedMediaCaption = 'OS Deadlock Safe State Table';
                  });
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl, String? caption, String? landmark) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Container(
                        height: 250,
                        color: Colors.grey.shade900,
                        child: const Center(child: Icon(Icons.broken_image, color: Colors.white54, size: 48)),
                      ),
                    ),
                    if (caption != null || landmark != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.black87,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (landmark != null)
                              Row(
                                children: [
                                  const Icon(Icons.pin_drop_rounded, size: 14, color: AppColors.secondary),
                                  const SizedBox(width: 4),
                                  Text(landmark, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                ],
                              ),
                            if (caption != null)
                              Text(caption, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final samState = ref.watch(samControllerProvider);
    final user = ref.watch(authControllerProvider).currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ref.listen(samControllerProvider, (previous, next) {
      if (previous?.messages.length != next.messages.length || next.isTyping) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkCard : Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Sam AI Copilot',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.attendanceSafe,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Vision AI & ${user?.fullName ?? "Campus"} Assistant',
                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            tooltip: 'Campus Geo-Cam',
            onPressed: () => context.push('/camera'),
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Clear Chat',
            onPressed: () {
              ref.read(samControllerProvider.notifier).clearChat();
              setState(() {
                _attachedMediaUrl = null;
                _attachedMediaCaption = null;
                _attachedLandmark = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Conversation cleared. Sam is ready for new questions!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'About Sam AI',
            onPressed: () => _showAboutSamDialog(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Messages Feed
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                itemCount: samState.messages.length + (samState.isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == samState.messages.length && samState.isTyping) {
                    return _buildTypingIndicator(isDark);
                  }
                  final msg = samState.messages[index];
                  return _buildMessageBubble(msg, isDark);
                },
              ),
            ),

            // Quick Suggestions Carousel
            Container(
              height: 44,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: samState.quickSuggestions.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final suggestion = samState.quickSuggestions[index];
                  return ActionChip(
                    backgroundColor: isDark ? AppColors.darkCard : Colors.white,
                    side: BorderSide(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    label: Text(
                      suggestion,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                    onPressed: () {
                      if (suggestion.contains('Solve Question') || suggestion.contains('Geo-Cam')) {
                        _showMediaPickerSheet(context);
                      } else {
                        _handleSend(suggestion);
                      }
                    },
                  );
                },
              ),
            ),

            // Attached Media Preview Banner (if image is selected)
            if (_attachedMediaUrl != null) _buildAttachedMediaBanner(isDark),

            // Text & Media Input Box
            _buildInputArea(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachedMediaBanner(bool isDark) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              _attachedMediaUrl!,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 44,
                height: 44,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.document_scanner_rounded, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      _attachedMediaCaption ?? 'Question Photo Attached',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                if (_attachedLandmark != null)
                  Text(
                    '📍 ${_attachedLandmark!}',
                    style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded, size: 18),
            onPressed: () {
              setState(() {
                _attachedMediaUrl = null;
                _attachedMediaCaption = null;
                _attachedLandmark = null;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(SamMessage msg, bool isDark) {
    final timeStr = DateFormat('hh:mm a').format(msg.timestamp);

    if (msg.isUser) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 520),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(4),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (msg.mediaUrl != null) ...[
                          GestureDetector(
                            onTap: () => _showImageDialog(context, msg.mediaUrl!, msg.mediaCaption, msg.geoLandmark),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(
                                    msg.mediaUrl!,
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 100,
                                      color: Colors.black26,
                                      child: const Center(child: Icon(Icons.photo, color: Colors.white70)),
                                    ),
                                  ),
                                  if (msg.geoLandmark != null)
                                    Positioned(
                                      bottom: 6,
                                      left: 6,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.pin_drop_rounded, size: 10, color: AppColors.secondary),
                                            const SizedBox(width: 4),
                                            Text(
                                              msg.geoLandmark!,
                                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Text(
                          msg.text,
                          style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4, top: 4),
                    child: Text(
                      timeStr,
                      style: const TextStyle(fontSize: 10, color: AppColors.textSecondaryLight),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
          ],
        ),
      );
    }

    // Sam AI Reply Bubble
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2, right: 10),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
            ),
            child: const CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(Icons.auto_awesome, color: AppColors.primary, size: 16),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 520),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkCard : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorder : Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        msg.text,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.45,
                          color: isDark ? Colors.white : const Color(0xFF1E293B),
                        ),
                      ),
                      if (msg.actions.isNotEmpty) ...[
                        const SizedBox(height: 14),
                        const Divider(height: 1),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: msg.actions.map((act) {
                            return ElevatedButton.icon(
                              onPressed: () => context.push(act.route),
                              icon: Icon(act.icon, size: 16),
                              label: Text(act.label),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                                foregroundColor: AppColors.primary,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
                                ),
                                textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 4),
                  child: Text(
                    timeStr,
                    style: const TextStyle(fontSize: 10, color: AppColors.textSecondaryLight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 38),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
            ),
            const SizedBox(width: 10),
            Text(
              'Sam is analyzing the problem & writing solution...',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: isDark ? Colors.white70 : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Media / Live Camera Question Attachment Button
          IconButton(
            key: const Key('attach_media_button'),
            tooltip: 'Attach Question Photo / Live Geo-Cam',
            icon: Icon(
              _attachedMediaUrl != null ? Icons.photo_library_rounded : Icons.add_photo_alternate_rounded,
              color: _attachedMediaUrl != null ? AppColors.secondary : AppColors.primary,
              size: 24,
            ),
            onPressed: () => _showMediaPickerSheet(context),
          ),
          const SizedBox(width: 4),

          // Text Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBackground : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : Colors.transparent,
                ),
              ),
              child: TextField(
                key: const Key('sam_message_input'),
                controller: _textController,
                focusNode: _focusNode,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _handleSend(),
                decoration: InputDecoration(
                  hintText: _attachedMediaUrl != null
                      ? 'Ask Sam: "Explain this question step-by-step"...'
                      : 'Ask Sam or attach a question photo...',
                  hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefixIcon: const Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Send Button
          IconButton.filled(
            key: const Key('sam_send_button'),
            onPressed: () => _handleSend(),
            icon: const Icon(Icons.send_rounded, size: 20),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutSamDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.auto_awesome, color: AppColors.primary),
            SizedBox(width: 8),
            Text('About Sam AI Copilot'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sam is the native AI campus life copilot built exclusively for Kampuzz.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text('Capabilities:'),
            Text('• 📸 Vision question solving from photo & live Geo-Cam'),
            Text('• 💻 Coding & DSA interview preparation'),
            Text('• 📄 ATS-friendly CV & Resume architecture'),
            Text('• 🎓 Top industry certifications advisor'),
            Text('• 📅 Timetable & Schedule navigation'),
            Text('• ⚠️ Real-time Bunkoo-Meter calculations'),
            Text('• 📚 Study Hub & Handwritten notes indexing'),
            Text('• 🏆 Hackathons, fests, and deadlines'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }
}
