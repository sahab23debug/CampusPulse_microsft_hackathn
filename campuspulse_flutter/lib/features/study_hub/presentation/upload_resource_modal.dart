import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../domain/study_resource.dart';
import '../controllers/study_hub_controller.dart';
import '../../auth/controllers/auth_controller.dart';

/// Modal dialog / bottom sheet allowing students to upload academic documents
class UploadResourceModal extends ConsumerStatefulWidget {
  const UploadResourceModal({super.key});

  @override
  ConsumerState<UploadResourceModal> createState() => _UploadResourceModalState();
}

class _UploadResourceModalState extends ConsumerState<UploadResourceModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _tagsController = TextEditingController();
  final _customSubjectController = TextEditingController();

  String _selectedSubject = 'Database Management Systems';
  bool _isCustomSubject = false;
  ResourceType _selectedType = ResourceType.pdf;
  int _selectedSemester = 5;

  // Attached file state
  String _attachedFileName = 'AI_Search_Heuristics_Unit2_Notes.pdf';
  int _attachedFileSizeBytes = 3670016; // ~3.5 MB
  int _attachedPageCount = 22;
  bool _isUploading = false;

  final List<String> _commonSubjects = [
    'Database Management Systems',
    'Operating Systems',
    'Design & Analysis of Algorithms',
    'Computer Networks',
    'Compiler Design',
    'Software Engineering',
    'Artificial Intelligence & Machine Learning',
    'Other / Custom Course',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _tagsController.dispose();
    _customSubjectController.dispose();
    super.dispose();
  }

  void _selectPresetFile(String name, int sizeBytes, int pages, ResourceType type) {
    setState(() {
      _attachedFileName = name;
      _attachedFileSizeBytes = sizeBytes;
      _attachedPageCount = pages;
      _selectedType = type;
    });
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1048576) {
      return '${(bytes / 1048576).toStringAsFixed(1)} MB';
    }
    return '${(bytes / 1024).toStringAsFixed(0)} KB';
  }

  Future<void> _handleUpload() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isUploading = true);

    // Short simulated upload progress for realistic feel
    await Future.delayed(const Duration(milliseconds: 600));

    final subject = _isCustomSubject
        ? (_customSubjectController.text.trim().isNotEmpty ? _customSubjectController.text.trim() : 'General Studies')
        : _selectedSubject;

    final tags = _tagsController.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    if (tags.isEmpty) {
      tags.addAll(['Notes', 'Unit Prep', 'Semester $selectedSemester']);
    }

    ref.read(studyHubProvider.notifier).uploadResource(
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          subject: subject,
          type: _selectedType,
          fileName: _attachedFileName,
          fileSizeBytes: _attachedFileSizeBytes,
          pageCount: _attachedPageCount,
          tags: tags,
          semester: _selectedSemester,
        );

    if (mounted) {
      setState(() => _isUploading = false);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Text('🎉 "${_titleController.text.trim()}" published to Kampuzz Study Hub!'),
              ),
            ],
          ),
          backgroundColor: AppColors.attendanceSafe,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  int get selectedSemester => _selectedSemester;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentUser = ref.watch(authControllerProvider).currentUser;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 16, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.upload_file_rounded, color: AppColors.primary, size: 24),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Study Document',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Share verified notes, PYQs, and cheat sheets with peers',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Scrollable Form Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Document File Attachment Dropzone
                    const Text('Attach File / Document', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkCard : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.file_present_rounded, color: AppColors.primary, size: 28),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _attachedFileName,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${_formatBytes(_attachedFileSizeBytes)} • $_attachedPageCount pages • Ready to publish',
                                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.check_circle_rounded, color: AppColors.attendanceSafe, size: 22),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Quick sample presets to attach:',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondaryLight),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              ActionChip(
                                avatar: const Icon(Icons.draw_rounded, size: 14),
                                label: const Text('Handwritten Unit 2', style: TextStyle(fontSize: 11)),
                                onPressed: () => _selectPresetFile(
                                  'DBMS_Unit2_Handwritten_Formulas.pdf',
                                  4194304,
                                  32,
                                  ResourceType.handwritten,
                                ),
                              ),
                              ActionChip(
                                avatar: const Icon(Icons.quiz_rounded, size: 14),
                                label: const Text('2025 PYQ Solved', style: TextStyle(fontSize: 11)),
                                onPressed: () => _selectPresetFile(
                                  'OS_2025_Endsem_Solved_Paper.pdf',
                                  2621440,
                                  18,
                                  ResourceType.pyq,
                                ),
                              ),
                              ActionChip(
                                avatar: const Icon(Icons.functions_rounded, size: 14),
                                label: const Text('Formula Cheatsheet', style: TextStyle(fontSize: 11)),
                                onPressed: () => _selectPresetFile(
                                  'DAA_Dynamic_Programming_FormulaSheet.pdf',
                                  1572864,
                                  6,
                                  ResourceType.formulaSheet,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Title
                    const Text('Resource Title', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 6),
                    TextFormField(
                      key: const Key('upload_title_input'),
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'e.g. AI Heuristics & Search Algorithms Master Notes',
                        prefixIcon: Icon(Icons.title_rounded),
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Please enter a clear title for this document';
                        }
                        if (val.trim().length < 5) {
                          return 'Title should be at least 5 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Subject / Course
                    const Text('Subject / Course', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedSubject,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.menu_book_rounded),
                      ),
                      items: _commonSubjects.map((sub) {
                        return DropdownMenuItem(
                          value: sub,
                          child: Text(sub, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedSubject = val;
                            _isCustomSubject = val == 'Other / Custom Course';
                          });
                        }
                      },
                    ),
                    if (_isCustomSubject) ...[
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _customSubjectController,
                        decoration: const InputDecoration(
                          hintText: 'Enter course name or subject code (e.g. COL331)',
                          prefixIcon: Icon(Icons.edit_note_rounded),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),

                    // Resource Type & Semester Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Resource Type
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Resource Category', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<ResourceType>(
                                initialValue: _selectedType,
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.category_rounded),
                                ),
                                items: const [
                                  DropdownMenuItem(value: ResourceType.pdf, child: Text('PDF Document')),
                                  DropdownMenuItem(value: ResourceType.handwritten, child: Text('Handwritten Notes')),
                                  DropdownMenuItem(value: ResourceType.pyq, child: Text('PYQ & Solutions')),
                                  DropdownMenuItem(value: ResourceType.formulaSheet, child: Text('Formula Cheatsheet')),
                                  DropdownMenuItem(value: ResourceType.labManual, child: Text('Lab Manual & Code')),
                                  DropdownMenuItem(value: ResourceType.slides, child: Text('Lecture Slides')),
                                ],
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedType = val);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Semester
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Semester', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<int>(
                                initialValue: _selectedSemester,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.school_rounded),
                                ),
                                items: List.generate(8, (i) => i + 1).map((sem) {
                                  return DropdownMenuItem(value: sem, child: Text('Sem $sem'));
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedSemester = val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Brief Summary / Description
                    const Text('Brief Summary & Description', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    const Text(
                      'Provide a brief overview of key topics, proofs, questions, and units covered.',
                      style: TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      key: const Key('upload_desc_input'),
                      controller: _descController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'e.g. Master notes covering complete Unit 1-3 with past 5 years semester paper solutions. Includes step-by-step proofs and diagrams.',
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Please provide a brief description of the resource';
                        }
                        if (val.trim().length < 10) {
                          return 'Description should be at least 10 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Topics & Keywords
                    const Text('Topics & Keywords (Comma separated)', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _tagsController,
                      decoration: const InputDecoration(
                        hintText: 'e.g. A* Search, Minimax, Heuristics, Alpha-Beta, Unit 2',
                        prefixIcon: Icon(Icons.label_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Author declaration card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.attendanceSafe.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.attendanceSafe.withValues(alpha: 0.25)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.verified_user_rounded, color: AppColors.attendanceSafe, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Posting as: ${currentUser?.fullName ?? 'Aarav Sharma'} • SGPA 9.4 (Sem $_selectedSemester)',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.attendanceSafe,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Publish Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        key: const Key('submit_upload_resource_button'),
                        onPressed: _isUploading ? null : _handleUpload,
                        icon: _isUploading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                              )
                            : const Icon(Icons.cloud_upload_rounded),
                        label: Text(
                          _isUploading ? 'Publishing Document...' : 'Publish Document to Study Hub',
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper method to open the upload modal from anywhere
void showUploadResourceModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => const UploadResourceModal(),
  );
}
