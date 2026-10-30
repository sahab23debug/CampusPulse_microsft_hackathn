import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/controllers/auth_controller.dart';

/// Phase 1: Under 60-second Onboarding Flow
/// Collects: College, Branch, Year, Section, Semester, Interests, Skills, Bio, SGPA
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 0;

  // Step 1: Academic details
  String _selectedCollege = 'Indian Institute of Technology Delhi (IITD)';
  String _selectedBranch = 'Computer Science & Engineering';
  int _selectedYear = 3;
  String _selectedSection = 'CSE-3A';

  // Step 2: Interests
  final Set<String> _selectedInterests = {'Tech', 'Coding'};
  final List<String> _availableInterests = [
    'Tech', 'Coding', 'Music', 'Dance', 'Food', 'Sports', 'Gaming', 'Design', 'Robotics', 'Literature'
  ];

  // Step 3: Skills & Bio
  final _nameController = TextEditingController(text: 'Ananya Verma');
  final _emailController = TextEditingController(text: 'ananya.verma@iitd.ac.in');
  final _skillsController = TextEditingController(text: 'Flutter, Dart, PostgreSQL');
  final _bioController = TextEditingController(text: 'Passionate full-stack developer eager to build for campus.');
  final _sgpaController = TextEditingController(text: '9.2');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _skillsController.dispose();
    _bioController.dispose();
    _sgpaController.dispose();
    super.dispose();
  }

  void _completeOnboarding() {
    final parsedSgpa = double.tryParse(_sgpaController.text.trim()) ?? 9.0;
    final skillsList = _skillsController.text.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();

    ref.read(authControllerProvider.notifier).completeOnboarding(
      name: _nameController.text.trim().isNotEmpty ? _nameController.text.trim() : 'Student',
      email: _emailController.text.trim().isNotEmpty ? _emailController.text.trim() : 'student@college.ac.in',
      collegeName: _selectedCollege,
      branchName: _selectedBranch,
      year: _selectedYear,
      sectionName: _selectedSection,
      interests: _selectedInterests.toList(),
      skills: skillsList.isNotEmpty ? skillsList : ['Flutter', 'Dart'],
      bio: _bioController.text.trim(),
      sgpa: parsedSgpa,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile setup complete! Welcome to Kampuzz.'),
        backgroundColor: AppColors.attendanceSafe,
      ),
    );
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step ${_step + 1} of 3 • Under 60s Setup'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: (_step + 1) / 3.0,
                  backgroundColor: Colors.grey.withValues(alpha: 0.15),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                const SizedBox(height: 24),

                if (_step == 0) ...[
                  const Text('Select Your College & Section', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  const Text('This personalizes your timetable, bunk-meter and notes hub.', style: TextStyle(color: AppColors.textSecondaryLight)),
                  const SizedBox(height: 24),

                  DropdownButtonFormField<String>(
                    initialValue: _selectedCollege,
                    decoration: const InputDecoration(labelText: 'College / University'),
                    items: [
                      'Indian Institute of Technology Delhi (IITD)',
                      'Delhi Technological University (DTU)',
                      'Netaji Subhas University of Technology (NSUT)',
                    ].map((c) => DropdownMenuItem(value: c, child: Text(c, overflow: TextOverflow.ellipsis))).toList(),
                    onChanged: (val) => setState(() => _selectedCollege = val!),
                  ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    initialValue: _selectedBranch,
                    decoration: const InputDecoration(labelText: 'Branch / Major'),
                    items: [
                      'Computer Science & Engineering',
                      'Electronics & Communication Engineering',
                      'Mechanical Engineering',
                    ].map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                    onChanged: (val) => setState(() => _selectedBranch = val!),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          initialValue: _selectedYear,
                          decoration: const InputDecoration(labelText: 'Year'),
                          items: [1, 2, 3, 4].map((y) => DropdownMenuItem(value: y, child: Text('Year $y'))).toList(),
                          onChanged: (val) => setState(() => _selectedYear = val!),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedSection,
                          decoration: const InputDecoration(labelText: 'Section'),
                          items: ['CSE-3A', 'CSE-3B', 'ECE-2A'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                          onChanged: (val) => setState(() => _selectedSection = val!),
                        ),
                      ),
                    ],
                  ),
                ] else if (_step == 1) ...[
                  const Text('Choose Your Interests', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  const Text('Connect with like-minded students and discover relevant campus events.', style: TextStyle(color: AppColors.textSecondaryLight)),
                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _availableInterests.map((interest) {
                      final isSelected = _selectedInterests.contains(interest);
                      return FilterChip(
                        label: Text(interest),
                        selected: isSelected,
                        selectedColor: AppColors.primaryLight,
                        labelStyle: TextStyle(
                          color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                        onSelected: (val) {
                          setState(() {
                            if (val) {
                              _selectedInterests.add(interest);
                            } else {
                              _selectedInterests.remove(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ] else ...[
                  const Text('Profile & Academic Info', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  const Text('Let potential project teammates and seniors know your strengths.', style: TextStyle(color: AppColors.textSecondaryLight)),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'College Email ID',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _skillsController,
                    decoration: const InputDecoration(
                      labelText: 'Skills (comma-separated tags)',
                      hintText: 'e.g. Flutter, Python, SQL, C++',
                      prefixIcon: Icon(Icons.code),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _bioController,
                    decoration: const InputDecoration(
                      labelText: 'Short Bio',
                      prefixIcon: Icon(Icons.info_outline),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _sgpaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Current Semester SGPA (Optional - Self Declared)',
                      hintText: 'e.g. 9.2',
                      prefixIcon: Icon(Icons.grade_outlined),
                    ),
                  ),
                ],

                const SizedBox(height: 40),
                Row(
                  children: [
                    if (_step > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => setState(() => _step--),
                          child: const Text('Back'),
                        ),
                      ),
                    if (_step > 0) const SizedBox(width: 14),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_step < 2) {
                            setState(() => _step++);
                          } else {
                            _completeOnboarding();
                          }
                        },
                        child: Text(_step < 2 ? 'Continue' : 'Finish & Enter App'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
