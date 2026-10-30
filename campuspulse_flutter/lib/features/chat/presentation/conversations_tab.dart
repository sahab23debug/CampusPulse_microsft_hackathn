import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/campus_avatar.dart';
import '../controllers/chat_controller.dart';
import '../domain/chat_models.dart';

/// Active Real-Time Conversations Tab with Person Search
class ConversationsTab extends ConsumerStatefulWidget {
  const ConversationsTab({super.key});

  @override
  ConsumerState<ConversationsTab> createState() => _ConversationsTabState();
}

class _ConversationsTabState extends ConsumerState<ConversationsTab> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatControllerProvider);
    final conversations = chatState.filteredConversations;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Person Search Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: _searchController,
            onChanged: (val) {
              ref.read(chatControllerProvider.notifier).setChatSearchQuery(val);
            },
            decoration: InputDecoration(
              hintText: 'Search chats by person name, college, or message...',
              hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(chatControllerProvider.notifier).setChatSearchQuery('');
                      },
                    )
                  : null,
              filled: true,
              fillColor: isDark ? AppColors.darkCard : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: isDark ? AppColors.darkBorder : Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: isDark ? AppColors.darkBorder : Colors.grey.shade300),
              ),
            ),
          ),
        ),

        // Conversations List
        Expanded(
          child: conversations.isEmpty
              ? _buildEmptyState(chatState.chatSearchQuery)
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: conversations.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final conv = conversations[index];
                    return _buildConversationTile(context, conv, isDark);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildConversationTile(BuildContext context, ChatConversation conv, bool isDark) {
    final timeStr = DateFormat('hh:mm a').format(conv.lastMessageTime);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          leading: Stack(
            children: [
              CampusAvatar(
                radius: 24,
                name: conv.peerName,
                imageUrl: conv.peerAvatar,
              ),
              if (conv.isOnline)
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                conv.peerName,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              Text(
                timeStr,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(
                '${conv.peerCollege} • ${conv.peerBranch}',
                style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              Text(
                conv.isTyping ? 'Typing a reply...' : conv.lastMessageText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: conv.isTyping ? FontStyle.italic : FontStyle.normal,
                  color: conv.isTyping ? AppColors.primary : (isDark ? Colors.white70 : AppColors.textSecondaryLight),
                  fontWeight: conv.isTyping ? FontWeight.w700 : FontWeight.normal,
                ),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${conv.matchPercentage}%',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.primary),
            ),
          ),
          onTap: () {
            context.push('/chat/${conv.id}');
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(String query) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              query.isEmpty ? Icons.chat_bubble_outline_rounded : Icons.search_off_rounded,
              size: 56,
              color: AppColors.textSecondaryLight,
            ),
            const SizedBox(height: 16),
            Text(
              query.isEmpty ? 'No Active Chats Yet' : 'No Specific Person Found',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              query.isEmpty
                  ? 'Accept connection requests or swipe profiles in Discover to start chatting.'
                  : 'No conversations found for "$query".',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
            ),
          ],
        ),
      ),
    );
  }
}
