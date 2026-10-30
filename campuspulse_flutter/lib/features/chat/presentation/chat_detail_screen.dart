import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/campus_avatar.dart';
import '../controllers/chat_controller.dart';
import '../domain/chat_models.dart';

/// Real-time 1-on-1 Direct Messaging Screen
class ChatDetailScreen extends ConsumerStatefulWidget {
  final String conversationId;

  const ChatDetailScreen({
    super.key,
    required this.conversationId,
  });

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  final List<String> _quickChips = [
    '📍 Meet at LHC Foyer at 4 PM',
    '💻 Shared the GitHub repo link',
    '☕ Free for quick tea at SAC?',
    '📄 Let\'s review problem statement',
    '🚀 Code looks great, ready to test!',
  ];

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
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend([String? presetText]) {
    final text = presetText ?? _textController.text;
    if (text.trim().isEmpty) return;

    ref.read(chatControllerProvider.notifier).sendMessage(widget.conversationId, text);
    _textController.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatControllerProvider);
    final conversation = chatState.conversations.firstWhere(
      (c) => c.id == widget.conversationId,
      orElse: () => ChatConversation(
        id: widget.conversationId,
        peerName: 'Campus Peer',
        peerAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
        peerCollege: 'IIT Delhi',
        peerBranch: 'CSE',
        messages: const [],
      ),
    );

    final isDark = Theme.of(context).brightness == Brightness.dark;

    ref.listen(chatControllerProvider, (previous, next) {
      final prevConv = previous?.conversations.firstWhere((c) => c.id == widget.conversationId, orElse: () => conversation);
      final nextConv = next.conversations.firstWhere((c) => c.id == widget.conversationId, orElse: () => conversation);
      if (prevConv?.messages.length != nextConv.messages.length || nextConv.isTyping) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        title: Row(
          children: [
            Stack(
              children: [
                CampusAvatar(
                  radius: 20,
                  name: conversation.peerName,
                  imageUrl: conversation.peerAvatar,
                ),
                if (conversation.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.attendanceSafe,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        conversation.peerName,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${conversation.matchPercentage}% MATCH',
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    conversation.isOnline
                        ? 'Online • ${conversation.peerCollege}'
                        : 'Last seen recently • ${conversation.peerCollege}',
                    style: TextStyle(
                      fontSize: 11,
                      color: conversation.isOnline ? AppColors.attendanceSafe : AppColors.textSecondaryLight,
                      fontWeight: conversation.isOnline ? FontWeight.w700 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined),
            tooltip: 'Voice Call',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Starting voice call with ${conversation.peerName}...')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined),
            tooltip: 'Video Call',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Starting campus video call with ${conversation.peerName}...')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'View Profile',
            onPressed: () => _showPeerProfileModal(context, conversation),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Message Feed
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: conversation.messages.length + (conversation.isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == conversation.messages.length && conversation.isTyping) {
                    return _buildTypingIndicator(conversation.peerName, isDark);
                  }
                  final msg = conversation.messages[index];
                  return _buildMessageItem(msg, isDark);
                },
              ),
            ),

            // Quick Prompts Carousel
            Container(
              height: 42,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: _quickChips.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final chip = _quickChips[index];
                  return ActionChip(
                    backgroundColor: isDark ? AppColors.darkCard : Colors.white,
                    side: BorderSide(color: AppColors.primary.withValues(alpha: 0.2)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    label: Text(
                      chip,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                    onPressed: () => _handleSend(chip),
                  );
                },
              ),
            ),

            // Input Bar
            _buildInputArea(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage msg, bool isDark) {
    final timeStr = DateFormat('hh:mm a').format(msg.timestamp);

    if (msg.isMe) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2, right: 6),
              child: Row(
                children: [
                  Text(timeStr, style: const TextStyle(fontSize: 10, color: AppColors.textSecondaryLight)),
                  const SizedBox(width: 3),
                  const Icon(Icons.done_all_rounded, size: 14, color: Color(0xFF38BDF8)),
                ],
              ),
            ),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF6366F1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.18),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  msg.text,
                  style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 440),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2, left: 6),
            child: Text(timeStr, style: const TextStyle(fontSize: 10, color: AppColors.textSecondaryLight)),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(String peerName, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                ),
                const SizedBox(width: 8),
                Text(
                  '$peerName is typing...',
                  style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.textSecondaryLight),
                ),
              ],
            ),
          ),
        ],
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
          IconButton(
            icon: const Icon(Icons.attach_file_rounded, color: AppColors.textSecondaryLight),
            tooltip: 'Share code snippet or file',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('File attachment picker opened')),
              );
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBackground : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: isDark ? AppColors.darkBorder : Colors.transparent),
              ),
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _handleSend(),
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
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

  void _showPeerProfileModal(BuildContext context, ChatConversation conv) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CampusAvatar(radius: 40, name: conv.peerName, imageUrl: conv.peerAvatar),
              const SizedBox(height: 12),
              Text(conv.peerName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Text('${conv.peerCollege} • ${conv.peerBranch}', style: const TextStyle(color: AppColors.textSecondaryLight)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.attendanceSafe.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.attendanceSafe.withValues(alpha: 0.3)),
                ),
                child: Text('Verified Teammate Match: ${conv.matchPercentage}% Overlap',
                    style: const TextStyle(color: AppColors.attendanceSafe, fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(ctx),
                icon: const Icon(Icons.check),
                label: const Text('Back to Conversation'),
              ),
            ],
          ),
        );
      },
    );
  }
}
