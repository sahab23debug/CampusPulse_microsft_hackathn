import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/file_saver/file_saver.dart';
import '../domain/study_resource.dart';
import '../controllers/study_hub_controller.dart';

/// Comprehensive Resource Detail & Document Viewer Sheet
class ResourceDetailSheet extends ConsumerWidget {
  final StudyResource resource;

  const ResourceDetailSheet({super.key, required this.resource});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(studyHubProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isBookmarked = state.bookmarkedIds.contains(resource.id);
    final isFollowed = state.followedIds.contains(resource.id);

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, scrollController) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(20),
        child: ListView(
          controller: scrollController,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 44,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Header: Category Icon + Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: resource.typeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(resource.typeIcon, color: resource.typeColor, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: resource.typeColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              resource.typeLabel.toUpperCase(),
                              style: TextStyle(
                                color: resource.typeColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Sem ${resource.semester} • ${resource.department}',
                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        resource.title,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, height: 1.3),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: isBookmarked ? AppColors.secondary : AppColors.textSecondaryLight,
                  ),
                  onPressed: () => ref.read(studyHubProvider.notifier).toggleBookmark(resource.id),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Subject Pill & Rating
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      resource.subject,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.attendanceWarning, size: 18),
                      const SizedBox(width: 3),
                      Text(
                        '${resource.rating}',
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                      ),
                      Text(
                        ' (${resource.ratingCount})',
                        style: const TextStyle(color: AppColors.textSecondaryLight, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Uploader Credentials Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      resource.uploaderName[0],
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.uploaderName,
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(
                          'Verified Student • SGPA ${resource.uploaderSgpa} (Sem ${resource.uploaderSemester})',
                          style: const TextStyle(color: AppColors.attendanceSafe, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => ref.read(studyHubProvider.notifier).toggleFollow(resource.id),
                    icon: Icon(
                      isFollowed ? Icons.check_circle_rounded : Icons.person_add_rounded,
                      size: 14,
                      color: isFollowed ? AppColors.attendanceSafe : AppColors.primary,
                    ),
                    label: Text(
                      isFollowed ? 'Followed' : 'Follow Notes',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: isFollowed ? AppColors.attendanceSafe : AppColors.primary,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // Brief Description & Topics
            const Text('Resource Summary & Content', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            const SizedBox(height: 6),
            Text(
              resource.description,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 14),

            // Tags / Key Topics
            if (resource.tags.isNotEmpty) ...[
              const Text('Key Topics Covered', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: resource.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
                    ),
                    child: Text(
                      '#$tag',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),
            ],

            // Document File Details Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(resource.typeIcon, color: resource.typeColor, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.fileName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${resource.formattedFileSize} • ${resource.pageCount} Pages • ${resource.downloadsCount} Downloads',
                          style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons: View in Viewer & Download
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(studyHubProvider.notifier).recordDownload(resource.id);
                      CampusFileSaver.downloadPhoto(
                        'https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/test/fixtures/white.png',
                        resource.fileName,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('⬇️ Download started for "${resource.fileName}"!'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    icon: const Icon(Icons.download_rounded),
                    label: const Text('Download Document'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('📖 Opening "${resource.title}" in Document Previewer...'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.open_in_new_rounded),
                    label: const Text('Quick Preview'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Discussion & Comments Section
            const Text('Student Discussion (2)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            const SizedBox(height: 10),
            _buildCommentBubble(
              context,
              'Priya Patel',
              'These notes saved my midterm exam! The B-Tree step-by-step is so clear.',
              '4 hrs ago',
            ),
            _buildCommentBubble(
              context,
              '${resource.uploaderName} (Uploader)',
              'Glad it helped! Added 2026 PYQ solutions in Appendix B.',
              '1 hr ago',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentBubble(BuildContext context, String author, String comment, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(author, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.primary)),
              Text(time, style: const TextStyle(fontSize: 10, color: AppColors.textSecondaryLight)),
            ],
          ),
          const SizedBox(height: 4),
          Text(comment, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

void showResourceDetailSheet(BuildContext context, StudyResource resource) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => ResourceDetailSheet(resource: resource),
  );
}
