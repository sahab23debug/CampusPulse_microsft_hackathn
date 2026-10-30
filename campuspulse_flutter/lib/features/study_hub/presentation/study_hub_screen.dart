import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/auth_user_menu.dart';
import '../controllers/study_hub_controller.dart';
import 'upload_resource_modal.dart';
import 'widgets/brief_resource_list_item.dart';
import 'widgets/detailed_resource_card.dart';

/// Kampuzz Study Hub: Document Upload, Brief Resource Listing & Full Cards Catalog
class StudyHubScreen extends ConsumerStatefulWidget {
  const StudyHubScreen({super.key});

  @override
  ConsumerState<StudyHubScreen> createState() => _StudyHubScreenState();
}

class _StudyHubScreenState extends ConsumerState<StudyHubScreen> {
  final _searchController = TextEditingController();
  bool _onlyShowBookmarked = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studyHubProvider);
    final notifier = ref.read(studyHubProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    var filtered = state.filteredResources;
    if (_onlyShowBookmarked) {
      filtered = filtered.where((r) => state.bookmarkedIds.contains(r.id)).toList();
    }

    final isBriefView = state.viewMode == StudyResourceViewMode.briefList;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 22),
            SizedBox(width: 8),
            Text('Study Hub', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          // View Mode Toggle (Brief List vs Cards)
          IconButton(
            tooltip: isBriefView ? 'Switch to Detailed Cards' : 'Switch to Brief Listing',
            icon: Icon(
              isBriefView ? Icons.view_agenda_rounded : Icons.format_list_bulleted_rounded,
              color: isBriefView ? AppColors.secondary : AppColors.primary,
            ),
            onPressed: () => notifier.toggleViewMode(),
          ),

          // Bookmark Filter Toggle
          IconButton(
            tooltip: _onlyShowBookmarked ? 'Show All Documents' : 'My Bookmarks',
            icon: Icon(
              _onlyShowBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              color: _onlyShowBookmarked ? AppColors.secondary : null,
            ),
            onPressed: () {
              setState(() => _onlyShowBookmarked = !_onlyShowBookmarked);
            },
          ),
          const AuthUserAvatarButton(),
        ],
      ),

      // Floating Action Button: Upload Academic Document
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('upload_document_fab'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.cloud_upload_rounded),
        label: const Text('Upload Document', style: TextStyle(fontWeight: FontWeight.w800)),
        onPressed: () => showUploadResourceModal(context),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                key: const Key('study_search_input'),
                controller: _searchController,
                onChanged: (val) => notifier.setSearchQuery(val),
                decoration: InputDecoration(
                  hintText: 'Search notes, PYQs, topics (e.g. SQL, DP, Paging)...',
                  hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                  prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary, size: 20),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            notifier.setSearchQuery('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Branch & Year Context Banner with Upload Quick Action
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_rounded, color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Computer Science • Year 3 (Sem 5) Course Resources',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  InkWell(
                    key: const Key('banner_upload_button'),
                    onTap: () => showUploadResourceModal(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_rounded, size: 14, color: Colors.white),
                          SizedBox(width: 3),
                          Text(
                            'Upload',
                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Type Filter Chips Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'PDF', 'Handwritten', 'PYQ', 'Formula Sheet', 'Lab Manual'].map((type) {
                  final isSelected = state.selectedType == type;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(type),
                      selectedColor: AppColors.primary.withValues(alpha: 0.15),
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                        fontSize: 12,
                      ),
                      onSelected: (_) => notifier.setTypeFilter(type),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),

            // Subject Filter & Sorting Bar with View Mode Indicator
            Row(
              children: [
                // Subject Dropdown
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkCard : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                      ),
                      child: DropdownButton<String>(
                        value: state.selectedSubject,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: state.availableSubjects.map((sub) {
                          return DropdownMenuItem<String>(
                            value: sub,
                            child: Text(sub, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) notifier.setSubjectFilter(val);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Sort Dropdown Menu
                PopupMenuButton<String>(
                  initialValue: state.sortBy,
                  onSelected: (val) => notifier.setSortBy(val),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkCard : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.sort_rounded, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          state.sortBy == 'rating'
                              ? 'Top Rated'
                              : state.sortBy == 'most_used'
                                  ? 'Most Downloaded'
                                  : 'Newest',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (ctx) => const [
                    PopupMenuItem(value: 'rating', child: Text('Top Rated')),
                    PopupMenuItem(value: 'most_used', child: Text('Most Downloaded')),
                    PopupMenuItem(value: 'newest', child: Text('Newest Uploads')),
                  ],
                ),
                const SizedBox(width: 6),

                // View Mode Quick Toggle Pill
                InkWell(
                  key: const Key('view_mode_toggle_pill'),
                  onTap: () => notifier.toggleViewMode(),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: isBriefView ? AppColors.secondary.withValues(alpha: 0.12) : AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isBriefView ? AppColors.secondary.withValues(alpha: 0.3) : AppColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isBriefView ? Icons.format_list_bulleted_rounded : Icons.view_agenda_rounded,
                          size: 16,
                          color: isBriefView ? AppColors.secondary : AppColors.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isBriefView ? 'Brief List' : 'Cards',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: isBriefView ? AppColors.secondary : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Result Header & Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filtered.length} verified ${filtered.length == 1 ? 'document' : 'documents'}'
                  '${_onlyShowBookmarked ? ' (Saved)' : ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                if (isBriefView)
                  const Text(
                    'Tap any item for full brief & viewer',
                    style: TextStyle(fontSize: 11, color: AppColors.primary, fontStyle: FontStyle.italic),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // Resources List (Brief Listing vs Detailed Cards)
            if (filtered.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Icon(Icons.folder_off_outlined, size: 52, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      const Text(
                        'No matching resources found',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Be the first to upload documents for this course!',
                        style: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => showUploadResourceModal(context),
                        icon: const Icon(Icons.cloud_upload_rounded),
                        label: const Text('Upload Document Now'),
                      ),
                    ],
                  ),
                ),
              )
            else if (isBriefView)
              // Compact Brief Listing View
              ListView.separated(
                key: const Key('brief_resources_list'),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return BriefResourceListItem(resource: filtered[index]);
                },
              )
            else
              // Detailed Cards View
              ListView.separated(
                key: const Key('detailed_resources_cards'),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return DetailedResourceCard(resource: filtered[index]);
                },
              ),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
