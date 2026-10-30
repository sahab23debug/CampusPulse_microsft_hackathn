import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/file_saver/file_saver.dart';
import '../../domain/study_resource.dart';
import '../../controllers/study_hub_controller.dart';
import '../resource_detail_sheet.dart';

/// Detailed Resource Card showing full badges, follow counts, and tags
class DetailedResourceCard extends ConsumerWidget {
  final StudyResource resource;

  const DetailedResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(studyHubProvider);
    final isBookmarked = state.bookmarkedIds.contains(resource.id);
    final isFollowed = state.followedIds.contains(resource.id);

    return InkWell(
      onTap: () => showResourceDetailSheet(context, resource),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Type Icon + Subject + Rating
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: resource.typeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    resource.typeIcon,
                    color: resource.typeColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resource.subject,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${resource.typeLabel} • ${resource.formattedFileSize} • ${resource.pageCount} pgs',
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.textSecondaryLight,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: AppColors.attendanceWarning, size: 18),
                    const SizedBox(width: 2),
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
            const SizedBox(height: 10),

            // Title
            Text(
              resource.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),

            // Brief Description
            Text(
              resource.description,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white70 : AppColors.textSecondaryLight,
                height: 1.35,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),

            // Tags
            if (resource.tags.isNotEmpty) ...[
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: resource.tags.take(3).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '#$tag',
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
            ],

            // Uploader Info with SGPA badge
            Row(
              children: [
                Text(
                  resource.uploaderName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.attendanceSafe.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SGPA ${resource.uploaderSgpa} (Sem ${resource.uploaderSemester})',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.attendanceSafe,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '• verified',
                        style: TextStyle(
                          fontSize: 9,
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Stats and Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${resource.downloadsCount} downloads • ${resource.followedCount} students',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondaryLight,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? AppColors.secondary : AppColors.textSecondaryLight,
                        size: 20,
                      ),
                      onPressed: () => ref.read(studyHubProvider.notifier).toggleBookmark(resource.id),
                    ),
                    IconButton(
                      tooltip: 'Download Document',
                      icon: const Icon(Icons.download_rounded, color: AppColors.primary, size: 20),
                      onPressed: () {
                        ref.read(studyHubProvider.notifier).recordDownload(resource.id);
                        CampusFileSaver.downloadPhoto(
                          'https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/test/fixtures/white.png',
                          resource.fileName,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('⬇️ Downloading "${resource.fileName}"...'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      },
                    ),
                    OutlinedButton.icon(
                      onPressed: () => ref.read(studyHubProvider.notifier).toggleFollow(resource.id),
                      icon: Icon(
                        isFollowed ? Icons.check_circle : Icons.add_circle_outline,
                        size: 14,
                        color: isFollowed ? AppColors.attendanceSafe : AppColors.primary,
                      ),
                      label: Text(
                        isFollowed ? 'Followed' : 'Follow',
                        style: TextStyle(
                          color: isFollowed ? AppColors.attendanceSafe : AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: isFollowed ? AppColors.attendanceSafe : AppColors.primary,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        minimumSize: const Size(0, 32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
