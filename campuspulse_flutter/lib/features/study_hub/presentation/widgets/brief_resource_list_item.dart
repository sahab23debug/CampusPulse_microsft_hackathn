import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/file_saver/file_saver.dart';
import '../../domain/study_resource.dart';
import '../../controllers/study_hub_controller.dart';
import '../resource_detail_sheet.dart';

/// Compact, high-density Brief Listing item for quick catalog scanning
class BriefResourceListItem extends ConsumerWidget {
  final StudyResource resource;

  const BriefResourceListItem({super.key, required this.resource});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(studyHubProvider);
    final isBookmarked = state.bookmarkedIds.contains(resource.id);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showResourceDetailSheet(context, resource),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Type Pill + Subject + Rating + Bookmark
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: resource.typeColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(resource.typeIcon, size: 12, color: resource.typeColor),
                        const SizedBox(width: 4),
                        Text(
                          resource.typeLabel,
                          style: TextStyle(
                            color: resource.typeColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${resource.subject} • Sem ${resource.semester}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.attendanceWarning, size: 15),
                      const SizedBox(width: 2),
                      Text(
                        '${resource.rating}',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                          size: 18,
                          color: isBookmarked ? AppColors.secondary : AppColors.textSecondaryLight,
                        ),
                        onPressed: () => ref.read(studyHubProvider.notifier).toggleBookmark(resource.id),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Title
              Text(
                resource.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Brief Description / Resource Summary
              Text(
                resource.description,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.white70 : AppColors.textSecondaryLight,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Bottom Spec Line & Quick Download Action
              Row(
                children: [
                  Icon(Icons.insert_drive_file_outlined, size: 13, color: Colors.grey.shade500),
                  const SizedBox(width: 3),
                  Text(
                    '${resource.formattedFileSize} • ${resource.pageCount} pgs',
                    style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight, fontFamily: 'monospace'),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.person_outline, size: 13, color: AppColors.textSecondaryLight),
                  const SizedBox(width: 3),
                  Flexible(
                    child: Text(
                      resource.uploaderName,
                      style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  // Quick Download button
                  InkWell(
                    onTap: () {
                      ref.read(studyHubProvider.notifier).recordDownload(resource.id);
                      CampusFileSaver.downloadPhoto(
                        'https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/test/fixtures/white.png',
                        resource.fileName,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('⬇️ Downloading "${resource.fileName}"...'),
                          backgroundColor: AppColors.primary,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.download_rounded, size: 14, color: AppColors.primary),
                          SizedBox(width: 3),
                          Text(
                            'Download',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
