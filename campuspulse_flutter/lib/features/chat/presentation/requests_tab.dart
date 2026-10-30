import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/campus_avatar.dart';
import '../controllers/chat_controller.dart';
import '../domain/chat_models.dart';

/// Requests Received Section with Person Search & Accept/Decline Actions
class RequestsTab extends ConsumerStatefulWidget {
  const RequestsTab({super.key});

  @override
  ConsumerState<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends ConsumerState<RequestsTab> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatControllerProvider);
    final requests = chatState.filteredRequests;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Person Search Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: _searchController,
            onChanged: (val) {
              ref.read(chatControllerProvider.notifier).setRequestSearchQuery(val);
            },
            decoration: InputDecoration(
              hintText: 'Search specific person by name, college, branch, or skill...',
              hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(chatControllerProvider.notifier).setRequestSearchQuery('');
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

        // Requests List
        Expanded(
          child: requests.isEmpty
              ? _buildEmptyState(chatState.requestSearchQuery)
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final req = requests[index];
                    return _buildRequestCard(context, ref, req, isDark);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildRequestCard(
    BuildContext context,
    WidgetRef ref,
    ConnectionRequest req,
    bool isDark,
  ) {
    final timeStr = DateFormat('MMM d, hh:mm a').format(req.timestamp);
    final isPending = req.status == RequestStatus.pending;
    final isAccepted = req.status == RequestStatus.accepted;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isAccepted
              ? AppColors.attendanceSafe.withValues(alpha: 0.5)
              : (isDark ? AppColors.darkBorder : Colors.grey.shade200),
          width: isAccepted ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar, Name, College, Match Pill
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CampusAvatar(
                radius: 24,
                name: req.senderName,
                imageUrl: req.senderAvatar,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            req.senderName,
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            '${req.matchPercentage}% MATCH',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${req.senderBranch} • Year ${req.senderYear}',
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                    ),
                    Text(
                      req.senderCollege,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Purpose Pill
          Row(
            children: [
              const Icon(Icons.rocket_launch_rounded, size: 14, color: AppColors.secondary),
              const SizedBox(width: 6),
              Text(
                'Goal: ${req.purpose}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.secondary),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Intro Note Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBackground : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.format_quote_rounded, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    req.introNote,
                    style: const TextStyle(fontSize: 13, height: 1.4, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Matching Skills Chips
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: req.matchedSkills.map((s) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  s,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),

          // Bottom Bar: Timestamp and Actions
          Row(
            children: [
              Text(timeStr, style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight)),
              const Spacer(),

              // Action Buttons
              if (isPending) ...[
                OutlinedButton(
                  onPressed: () {
                    ref.read(chatControllerProvider.notifier).declineRequest(req.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request from ${req.senderName} declined.')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 36),
                    foregroundColor: AppColors.attendanceDanger,
                    side: const BorderSide(color: AppColors.attendanceDanger),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Decline'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    final conv = ref.read(chatControllerProvider.notifier).acceptRequest(req.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('🎉 Connected with ${req.senderName}! Chat unlocked.'),
                        backgroundColor: AppColors.attendanceSafe,
                      ),
                    );
                    context.push('/chat/${conv.id}');
                  },
                  icon: const Icon(Icons.check_rounded, size: 16),
                  label: const Text('Accept & Chat'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 36),
                    backgroundColor: AppColors.attendanceSafe,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ] else if (isAccepted) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.attendanceSafe.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_rounded, size: 14, color: AppColors.attendanceSafe),
                      SizedBox(width: 4),
                      Text(
                        'Accepted',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.attendanceSafe),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    final conv = ref.read(chatControllerProvider.notifier).acceptRequest(req.id);
                    context.push('/chat/${conv.id}');
                  },
                  icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
                  label: const Text('Open Chat'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Declined', style: TextStyle(color: AppColors.textSecondaryLight, fontSize: 12)),
                ),
              ],
            ],
          ),
        ],
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
              query.isEmpty ? Icons.mark_email_read_outlined : Icons.person_search_rounded,
              size: 56,
              color: AppColors.textSecondaryLight,
            ),
            const SizedBox(height: 16),
            Text(
              query.isEmpty ? 'All Caught Up!' : 'No Specific Person Found',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              query.isEmpty
                  ? 'You don\'t have any pending requests. Explore Discover to connect with new teammates!'
                  : 'No connection requests matched "$query". Try searching by another skill or college.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
            ),
          ],
        ),
      ),
    );
  }
}
