import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../chat/controllers/chat_controller.dart';
import '../../chat/presentation/requests_tab.dart';
import '../../chat/presentation/conversations_tab.dart';

/// Section 5.6: Connect (Teammate & Partner Discovery)
/// Features:
/// 1. Discover & Requirement-driven candidate matchmaking flow (Swipe cards)
/// 2. Requests Received section with person search & Accept / Decline
/// 3. Real-Time Chat & Active Conversations with live replies
class ConnectScreen extends ConsumerStatefulWidget {
  const ConnectScreen({super.key});

  @override
  ConsumerState<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends ConsumerState<ConnectScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Requirement State
  bool _hasRequirement = false;
  String _selectedPurpose = 'Hackathon';
  final _titleController = TextEditingController(text: 'Smart India Hackathon 2026 (SIH)');
  final _descController = TextEditingController(text: 'Building Kampuzz campus operating system. Looking for a strong Flutter frontend & API integration builder.');
  final Set<String> _selectedSkills = {'Flutter', 'Dart', 'PostgreSQL'};
  String _teamSize = '3 members';
  String _preferredProximity = 'Same College (IIT Delhi)';

  final List<String> _availableSkills = [
    'Flutter', 'Dart', 'PostgreSQL', 'Python', 'AI/ML', 'C++', 'Java', 'Algorithms', 'ROS', 'Embedded C', 'Figma', 'Docker'
  ];

  int _currentIndex = 0;

  final List<Map<String, dynamic>> _candidates = [
    {
      'id': 2,
      'fullName': 'Sahab Raza',
      'avatarUrl': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      'college': 'IIT Delhi',
      'branch': 'CSE',
      'year': 3,
      'baseMatch': 94,
      'matchedSkills': ['Flutter', 'Dart', 'PostgreSQL'],
      'bio': 'OS & Kernel enthusiast. Teaching assistant for DAA & DBMS. Looking for 36-hr HackPulse hackathon teammates.',
      'interests': ['Coding', 'Tech', 'Design'],
      'skills': ['C++', 'Python', 'Linux', 'Operating Systems', 'Flutter', 'Dart', 'PostgreSQL'],
      'sgpa': {'Sem 1': 9.0, 'Sem 2': 9.3, 'Sem 3': 9.2, 'Sem 4': 9.6},
      'notesUploaded': 11,
      'averageRating': 4.9,
      'quizRank': 1,
    },
    {
      'id': 3,
      'fullName': 'Priya Nair',
      'avatarUrl': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
      'college': 'IIT Delhi',
      'branch': 'CSE',
      'year': 3,
      'baseMatch': 88,
      'matchedSkills': ['Algorithms', 'Java', 'Python'],
      'bio': 'Competitive programmer (Guardian on LeetCode). Class Representative (CR). Fast prototyping partner.',
      'interests': ['Coding', 'Dance', 'Tech'],
      'skills': ['Algorithms', 'Java', 'Data Structures', 'C++', 'Python'],
      'sgpa': {'Sem 1': 9.5, 'Sem 2': 9.6, 'Sem 3': 9.7, 'Sem 4': 9.8},
      'notesUploaded': 8,
      'averageRating': 4.8,
      'quizRank': 3,
    },
    {
      'id': 4,
      'fullName': 'Rohan Verma',
      'avatarUrl': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
      'college': 'IIT Delhi',
      'branch': 'ECE',
      'year': 2,
      'baseMatch': 78,
      'matchedSkills': ['Embedded C', 'Hardware', 'C++'],
      'bio': 'Robotics club coordinator. IoT tinkerer building custom telemetry drones and autonomous rovers.',
      'interests': ['Robotics', 'Tech', 'Sports'],
      'skills': ['Verilog', 'Arduino', 'Embedded C', 'MATLAB', 'C++'],
      'sgpa': {'Sem 1': 8.7, 'Sem 2': 8.9},
      'notesUploaded': 4,
      'averageRating': 4.7,
      'quizRank': 5,
    },
    {
      'id': 5,
      'fullName': 'Aanya Gupta',
      'avatarUrl': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      'college': 'IIT Delhi',
      'branch': 'Design & CSE',
      'year': 3,
      'baseMatch': 82,
      'matchedSkills': ['Figma', 'UI/UX', 'Flutter'],
      'bio': 'Product designer & frontend enthusiast. Winner of Inter-College Designathon 2025.',
      'interests': ['Design', 'UI/UX', 'Tech', 'Music'],
      'skills': ['Figma', 'UI/UX', 'Flutter', 'Prototyping'],
      'sgpa': {'Sem 1': 9.1, 'Sem 2': 9.3, 'Sem 3': 9.4},
      'notesUploaded': 5,
      'averageRating': 4.9,
      'quizRank': 4,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _applyPreset(String purpose, String title, String desc, List<String> skills) {
    setState(() {
      _selectedPurpose = purpose;
      _titleController.text = title;
      _descController.text = desc;
      _selectedSkills.clear();
      _selectedSkills.addAll(skills);
    });
  }

  int _calculateDynamicMatch(Map<String, dynamic> candidate) {
    final candidateSkills = (candidate['skills'] as List<String>).toSet();
    final overlap = _selectedSkills.intersection(candidateSkills).length;
    int score = 60 + (overlap * 12);
    if (candidate['college'] == 'IIT Delhi') score += 6;
    if (score > 98) score = 98;
    return score;
  }

  List<String> _getDynamicMatchedSkills(Map<String, dynamic> candidate) {
    final candidateSkills = (candidate['skills'] as List<String>).toSet();
    final overlap = _selectedSkills.intersection(candidateSkills).toList();
    return overlap.isNotEmpty ? overlap : ['Same Campus'];
  }

  void _onSwipe(bool isInterested) {
    final candidate = _candidates[_currentIndex];
    if (isInterested) {
      _showConnectDialog(candidate);
    } else {
      setState(() {
        if (_currentIndex < _candidates.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
    }
  }

  void _showConnectDialog(Map<String, dynamic> candidate) {
    final noteController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Connect with ${candidate['fullName']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: AppColors.primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You can send up to 3 messages before request acceptance.',
                      style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: 'Introduce yourself (e.g. "Hey, looking for a ${_selectedPurpose.toLowerCase()} teammate for ${_titleController.text}...")',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              final initialMsg = noteController.text.trim();
              final conv = ref.read(chatControllerProvider.notifier).addSentRequestOrConversation(
                    peerName: candidate['fullName'] as String,
                    peerAvatar: candidate['avatarUrl'] as String,
                    peerCollege: candidate['college'] as String,
                    peerBranch: '${candidate['branch']} (Year ${candidate['year']})',
                    matchPercentage: candidate['baseMatch'] as int? ?? 90,
                    initialMessage: initialMsg,
                  );

              setState(() {
                if (_currentIndex < _candidates.length - 1) {
                  _currentIndex++;
                } else {
                  _currentIndex = 0;
                }
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Connection request sent to ${candidate['fullName']}! Chat enabled.'),
                  backgroundColor: AppColors.attendanceSafe,
                  action: SnackBarAction(
                    label: 'Open Chat',
                    textColor: Colors.white,
                    onPressed: () => context.push('/chat/${conv.id}'),
                  ),
                ),
              );
            },
            child: const Text('Send Request'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatControllerProvider);
    final pendingCount = chatState.pendingRequestCount;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Connect & Teammates', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          if (_hasRequirement)
            TextButton.icon(
              onPressed: () => setState(() => _hasRequirement = false),
              icon: const Icon(Icons.tune_rounded, size: 18),
              label: const Text('Edit Goal', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondaryLight,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          tabs: [
            const Tab(
              icon: Icon(Icons.explore_outlined, size: 18),
              text: 'Discover',
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.move_to_inbox_outlined, size: 18),
                  const SizedBox(width: 6),
                  const Text('Requests'),
                  if (pendingCount > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.attendanceDanger,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$pendingCount',
                        style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Tab(
              icon: Icon(Icons.chat_bubble_outline_rounded, size: 18),
              text: 'Chats',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 1. Discover & Match
          _hasRequirement ? _buildSwipeMatchView() : _buildRequirementFormView(),

          // 2. Requests Received with Search & Accept/Decline
          const RequestsTab(),

          // 3. Real-Time Chats & Active Conversations
          const ConversationsTab(),
        ],
      ),
    );
  }

  // View 1: Requirement Gathering Form (Shown first on Connect)
  Widget _buildRequirementFormView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.lightBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.handshake_rounded, color: AppColors.primary, size: 28),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tell Us What You Need',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Kampuzz algorithms will calculate match scores and find the right campus partner.',
                            style: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 1-Tap Quick Presets
              const Text(
                'QUICK PRESETS (1-TAP)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.primary, letterSpacing: 0.6),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ActionChip(
                      avatar: const Icon(Icons.rocket_launch, size: 16, color: AppColors.primary),
                      label: const Text('SIH 2026 Hackathon'),
                      onPressed: () => _applyPreset(
                        'Hackathon',
                        'Smart India Hackathon 2026',
                        'Need Flutter & Serverpod/Python builders for our campus problem statement.',
                        ['Flutter', 'Dart', 'PostgreSQL', 'AI/ML'],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ActionChip(
                      avatar: const Icon(Icons.menu_book, size: 16, color: AppColors.secondary),
                      label: const Text('DBMS & DAA Study Group'),
                      onPressed: () => _applyPreset(
                        'Study Partner',
                        'DBMS & Algorithm Mid-Sem Prep',
                        'Preparing for upcoming mid-sem exam. Looking for a partner to solve tutorials & past papers.',
                        ['Algorithms', 'C++', 'Java'],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ActionChip(
                      avatar: const Icon(Icons.precision_manufacturing, size: 16, color: AppColors.accent),
                      label: const Text('Robotics Hardware'),
                      onPressed: () => _applyPreset(
                        'Project',
                        'Autonomous Rover Hardware',
                        'Building autonomous bot for TechFest. Need someone strong in Embedded C and ROS.',
                        ['Embedded C', 'ROS', 'Python'],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // Purpose Selector Chips
              const Text(
                '1. What is your purpose?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['Hackathon', 'Study Partner', 'Project', 'Gaming', 'Sports', 'Other'].map((purpose) {
                  final isSelected = _selectedPurpose == purpose;
                  return ChoiceChip(
                    label: Text(purpose),
                    selected: isSelected,
                    selectedColor: AppColors.primaryLight,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                    onSelected: (val) => setState(() => _selectedPurpose = purpose),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Title Field
              const Text(
                '2. Requirement Title',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Smart India Hackathon 2026 Teammate',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 18),

              // Description Field
              const Text(
                '3. Describe what you are looking for',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Describe role, project scope, or study goals...',
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ),
              const SizedBox(height: 20),

              // Required Skills
              const Text(
                '4. Required Skills Needed',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _availableSkills.map((skill) {
                  final isSelected = _selectedSkills.contains(skill);
                  return FilterChip(
                    label: Text(skill),
                    selected: isSelected,
                    selectedColor: AppColors.primaryLight,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          _selectedSkills.add(skill);
                        } else {
                          _selectedSkills.remove(skill);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Team Size & Preferred Proximity
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _teamSize,
                      decoration: const InputDecoration(labelText: 'Team Size Needed'),
                      items: ['2 members', '3 members', '4 members', '5+ members']
                          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (val) => setState(() => _teamSize = val!),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _preferredProximity,
                      decoration: const InputDecoration(labelText: 'Proximity Filter'),
                      items: ['Same College (IIT Delhi)', 'Same Branch & Year', 'Any College']
                          .map((p) => DropdownMenuItem(value: p, child: Text(p, overflow: TextOverflow.ellipsis)))
                          .toList(),
                      onChanged: (val) => setState(() => _preferredProximity = val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Submit & Calculate Matches Button
              ElevatedButton.icon(
                onPressed: () {
                  if (_titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a requirement title')),
                    );
                    return;
                  }
                  setState(() => _hasRequirement = true);
                },
                icon: const Icon(Icons.search_rounded),
                label: const Text('Calculate Matches & Show Profiles →'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // View 2: Candidate Profiles Match & Swipe View
  Widget _buildSwipeMatchView() {
    final candidate = _candidates[_currentIndex];
    final matchScore = _calculateDynamicMatch(candidate);
    final matchedSkills = _getDynamicMatchedSkills(candidate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          // Active Requirement Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.attendanceSafe, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Matched for: ${_titleController.text} ($_selectedPurpose)',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _hasRequirement = false),
                  child: const Text('Change', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Poster Style Swipe Card
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: NetworkImage(candidate['avatarUrl']),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.45),
                      Colors.black.withValues(alpha: 0.95),
                    ],
                    stops: const [0.0, 0.45, 0.9],
                  ),
                ),
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Match Score Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.attendanceSafe,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.attendanceSafe.withValues(alpha: 0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.bolt, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '$matchScore% MATCH',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Candidate Name & College
                    Text(
                      candidate['fullName'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${candidate['branch']} • Year ${candidate['year']} • ${candidate['college']}',
                      style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),

                    // Bio
                    Text(
                      candidate['bio'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Matching Skills Chips
                    const Text(
                      'MATCHING SKILLS',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: matchedSkills.map((skill) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            skill,
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 18),

                    // View Details button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProfileScreen(
                                isPublicView: true,
                                customUser: {
                                  'fullName': candidate['fullName'],
                                  'email': '${candidate['fullName'].toString().toLowerCase().replaceAll(" ", ".")}@iitd.ac.in',
                                  'avatarUrl': candidate['avatarUrl'],
                                  'collegeName': candidate['college'],
                                  'branchName': candidate['branch'],
                                  'sectionName': 'CSE-3A',
                                  'year': candidate['year'],
                                  'semester': 5,
                                  'bio': candidate['bio'],
                                  'interests': candidate['interests'],
                                  'skills': candidate['skills'],
                                  'githubUrl': 'https://github.com',
                                  'linkedinUrl': 'https://linkedin.com',
                                  'role': 'student',
                                  'sgpa': candidate['sgpa'],
                                  'notesUploaded': candidate['notesUploaded'],
                                  'averageRating': candidate['averageRating'],
                                  'quizRank': candidate['quizRank'],
                                },
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white70),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('View Full LinkedIn Profile'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Swipe Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: 'skip_btn',
                backgroundColor: Colors.white,
                foregroundColor: AppColors.attendanceDanger,
                elevation: 3,
                onPressed: () => _onSwipe(false),
                child: const Icon(Icons.close, size: 28),
              ),
              FloatingActionButton.extended(
                heroTag: 'connect_btn',
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 4,
                onPressed: () => _onSwipe(true),
                icon: const Icon(Icons.handshake_rounded),
                label: const Text('Connect Now', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
