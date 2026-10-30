import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/auth_user_menu.dart';

/// Section 5.5: Communities (Clubs & Interest Circles)
/// Features:
/// - Real-time community search & category filtering
/// - Working "+ Create Community" flow
/// - Seamless "Join & Open Community" detail view
/// - Community Detail View with Announcements, Updates Feed, and Linked Campus Events
class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Set<int> _joinedCommunities = {1, 3};
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _communities = [
    {
      'id': 1,
      'name': 'Open Source & Hackathon Ninjas',
      'category': 'Tech',
      'members': 342,
      'description': 'Find teammates for Smart India Hackathon, MLH, and Google Summer of Code. Weekly reviews & mock pitches.',
      'icon': Icons.code_rounded,
      'color': AppColors.primary,
      'admin': 'Sahab Raza (CSE 3rd Year)',
      'announcements': [
        '📢 Mock pitch session tonight at 8 PM on Google Meet! Link in WhatsApp group.',
        '📌 SIH 2026 Problem Statements are live. Check the linked hackathon event to register.',
      ],
      'posts': [
        {
          'author': 'Aarav Sharma',
          'time': '2 hours ago',
          'content': 'Just released Kampuzz v1.0 on GitHub! Looking for 2 backend contributors interested in Serverpod and PostgreSQL.',
          'likes': 24,
          'comments': 7,
        },
        {
          'author': 'Sahab Raza',
          'time': 'Yesterday',
          'content': 'Uploaded comprehensive Operating Systems & Kernel notes on Study Hub. Review them before tomorrow’s tutorial quiz!',
          'likes': 42,
          'comments': 12,
        },
      ],
      'events': [
        {
          'title': 'HackPulse 36-Hour Hackathon',
          'date': 'Nov 14-16, 2026',
          'venue': 'LHC Central Auditorium',
          'deadline': 'Tomorrow 11:59 PM',
        },
        {
          'title': 'Serverpod & Flutter Full-Stack Workshop',
          'date': 'Nov 20, 2026',
          'venue': 'CSE Seminar Hall 1',
          'deadline': 'In 5 days',
        },
      ],
    },
    {
      'id': 2,
      'name': 'Campus Musicians & Beatmakers',
      'category': 'Music',
      'members': 188,
      'description': 'Jam sessions, acoustic nights, guitar tabs exchange, and home studio production tips for college fests.',
      'icon': Icons.music_note_rounded,
      'color': AppColors.accent,
      'admin': 'Kabir Sen (ECE 4th Year)',
      'announcements': [
        '🎸 Open Air Theatre (OAT) Jam session this Friday 6 PM! Acoustic guitars & cajons welcome.',
      ],
      'posts': [
        {
          'author': 'Kabir Sen',
          'time': '3 hours ago',
          'content': 'Looking for a bassist and drummer for our Rendezvous Battle of the Bands squad. DM if interested!',
          'likes': 19,
          'comments': 5,
        },
      ],
      'events': [
        {
          'title': 'Battle of the Bands 2026 Prelims',
          'date': 'Nov 22, 2026',
          'venue': 'OAT Amphitheatre',
          'deadline': 'Nov 18, 2026',
        },
      ],
    },
    {
      'id': 3,
      'name': 'Robotics & Autonomous Hardware',
      'category': 'Tech',
      'members': 215,
      'description': 'Autonomous rovers, combat bots, drone telemetry, and PCB layout design discussions for national robotics competitions.',
      'icon': Icons.precision_manufacturing_rounded,
      'color': AppColors.secondary,
      'admin': 'Priya Patel (President DTU Robotics)',
      'announcements': [
        '🤖 Line follower & maze solver test tracks are open in Mechanical Workshop Bay 3.',
      ],
      'posts': [
        {
          'author': 'Priya Patel',
          'time': '5 hours ago',
          'content': 'Telemetry testing for our new quadcopter rover completed successfully. Sub-50ms latency over ROS2!',
          'likes': 38,
          'comments': 9,
        },
      ],
      'events': [
        {
          'title': 'Invictus Robowars & Rover Grand Prix',
          'date': 'Dec 2-4, 2026',
          'venue': 'Sports Complex Indoor Hall',
          'deadline': 'Nov 25, 2026',
        },
      ],
    },
    {
      'id': 4,
      'name': 'Campus Gaming & Esports Hub',
      'category': 'Gaming',
      'members': 410,
      'description': 'Valorant inter-hostel tournament scrims, BGMI custom rooms, and chess blitz showdowns.',
      'icon': Icons.sports_esports_rounded,
      'color': const Color(0xFF8B5CF6),
      'admin': 'Devansh Rao (Year 2 IT)',
      'announcements': [
        '🏆 Inter-hostel Valorant Finals stream on Saturday at 9 PM! Cash prize pool of ₹15,000.',
      ],
      'posts': [
        {
          'author': 'Devansh Rao',
          'time': '1 day ago',
          'content': 'Scrim lobby link is pinned in Discord. Need 1 Ascendant+ smoker main for bracket finals.',
          'likes': 31,
          'comments': 14,
        },
      ],
      'events': [
        {
          'title': 'Inter-College Valorant Showdown',
          'date': 'Nov 28, 2026',
          'venue': 'Online Discord & Twitch Stream',
          'deadline': 'Nov 26, 2026',
        },
      ],
    },
    {
      'id': 5,
      'name': 'Design, UI/UX & Creative Media',
      'category': 'Design',
      'members': 164,
      'description': 'Figma teardowns, branding critiques, design systems, and product thinking workshops for college creators.',
      'icon': Icons.palette_rounded,
      'color': const Color(0xFFEC4899),
      'admin': 'Aanya Gupta (Year 3 Design)',
      'announcements': [
        '🎨 Designathon 2026 briefing call this Sunday at 5 PM on Google Meet.',
      ],
      'posts': [
        {
          'author': 'Aanya Gupta',
          'time': '4 hours ago',
          'content': 'Just completed the design tokens for Kampuzz mobile & web! What do you all think of the new Pulse Crest logo?',
          'likes': 56,
          'comments': 18,
        },
      ],
      'events': [
        {
          'title': 'Campus UI/UX Design Sprint',
          'date': 'Nov 19, 2026',
          'venue': 'Design Studio LHC 201',
          'deadline': 'Nov 17, 2026',
        },
      ],
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openCommunityDetail(Map<String, dynamic> comm) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CommunityDetailPage(
          community: comm,
          isInitiallyJoined: _joinedCommunities.contains(comm['id']),
          onToggleJoin: (bool joined) {
            setState(() {
              if (joined) {
                _joinedCommunities.add(comm['id'] as int);
              } else {
                _joinedCommunities.remove(comm['id'] as int);
              }
            });
          },
        ),
      ),
    );
  }

  void _showCreateCommunityDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final announcementController = TextEditingController();
    String category = 'Tech';
    bool isPublic = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(Icons.add_circle, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          'Create a New Community',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Launch an official club, study society, or interest circle for campus peers.',
                      style: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 18),

                    // Community Name
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Community Name',
                        hintText: 'e.g. AI & Deep Learning Society or Drama Club',
                        prefixIcon: Icon(Icons.people_outline),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      initialValue: category,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        prefixIcon: Icon(Icons.category_outlined),
                      ),
                      items: ['Tech', 'Music', 'Gaming', 'Design', 'Cultural', 'Sports', 'Academic']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) => setModalState(() => category = val!),
                    ),
                    const SizedBox(height: 14),

                    // Description
                    TextField(
                      controller: descController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'What is this community about? What activities are planned?',
                        prefixIcon: Icon(Icons.description_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Initial Announcement (Optional)
                    TextField(
                      controller: announcementController,
                      decoration: const InputDecoration(
                        labelText: 'First Announcement / Welcome Notice',
                        hintText: 'e.g. Welcome everyone! General Body Meeting this Friday.',
                        prefixIcon: Icon(Icons.campaign_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Privacy Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Public Community', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                            Text('Anyone on campus can join instantly', style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight)),
                          ],
                        ),
                        Switch(
                          value: isPublic,
                          activeThumbColor: AppColors.primary,
                          onChanged: (val) => setModalState(() => isPublic = val),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // Create Button
                    ElevatedButton.icon(
                      onPressed: () {
                        if (nameController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a community name')),
                          );
                          return;
                        }

                        final newComm = {
                          'id': _communities.length + 1,
                          'name': nameController.text.trim(),
                          'category': category,
                          'members': 1,
                          'description': descController.text.trim().isNotEmpty
                              ? descController.text.trim()
                              : 'Official campus circle for $category enthusiasts.',
                          'icon': category == 'Tech'
                              ? Icons.terminal_rounded
                              : (category == 'Music' ? Icons.music_note_rounded : Icons.groups_rounded),
                          'color': AppColors.primary,
                          'admin': 'Aarav Sharma (You - Founder)',
                          'announcements': announcementController.text.trim().isNotEmpty
                              ? [announcementController.text.trim()]
                              : ['🎉 Welcome to ${nameController.text.trim()}! Introduce yourself.'],
                          'posts': [
                            {
                              'author': 'Aarav Sharma (Founder)',
                              'time': 'Just now',
                              'content': 'Welcome everyone to the official community! Feel free to post updates, projects, and collaborate.',
                              'likes': 1,
                              'comments': 0,
                            },
                          ],
                          'events': [],
                        };

                        setState(() {
                          _communities.insert(0, newComm);
                          _joinedCommunities.add(newComm['id'] as int);
                        });

                        Navigator.pop(ctx);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('🎉 Community "${newComm['name']}" created and joined!'),
                            backgroundColor: AppColors.attendanceSafe,
                          ),
                        );

                        // Automatically open the newly created community
                        _openCommunityDetail(newComm);
                      },
                      icon: const Icon(Icons.rocket_launch_outlined),
                      label: const Text('Create & Launch Community'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();

    final filtered = _communities.where((c) {
      final matchesCategory = _selectedCategory == 'All' || c['category'] == _selectedCategory;
      final matchesQuery = query.isEmpty ||
          c['name'].toString().toLowerCase().contains(query) ||
          c['description'].toString().toLowerCase().contains(query) ||
          c['category'].toString().toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Campus Communities', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          ElevatedButton.icon(
            onPressed: _showCreateCommunityDialog,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(90, 36),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(width: 8),
          const AuthUserAvatarButton(),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar (Requested by user)
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search clubs, robotics, hackathon ninjas, music...',
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.lightBorder),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Category Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Tech', 'Music', 'Gaming', 'Design', 'Cultural', 'Sports'].map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: AppColors.primaryLight,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                      onSelected: (val) => setState(() => _selectedCategory = cat),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore Clubs & Circles (${filtered.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text(
                  _selectedCategory,
                  style: const TextStyle(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Community Cards List
            if (filtered.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.lightBorder),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.search_off_rounded, size: 48, color: AppColors.textSecondaryLight),
                    const SizedBox(height: 12),
                    Text(
                      'No communities found for "${_searchController.text}"',
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start this club for your campus peers!',
                      style: TextStyle(color: AppColors.textSecondaryLight, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _showCreateCommunityDialog,
                      icon: const Icon(Icons.add),
                      label: const Text('Create This Community'),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final comm = filtered[index];
                  final commId = comm['id'] as int;
                  final isJoined = _joinedCommunities.contains(commId);
                  final color = comm['color'] as Color;

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // Clicking the card opens the community
                      _openCommunityDetail(comm);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: color.withValues(alpha: 0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(comm['icon'] as IconData, color: color, size: 24),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comm['name'],
                                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${comm['members']} members • ${comm['category']}',
                                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                                    ),
                                  ],
                                ),
                              ),
                              // Join & Open Button (Prompt constraint)
                              ElevatedButton(
                                onPressed: () {
                                  if (!isJoined) {
                                    setState(() => _joinedCommunities.add(commId));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Joined ${comm['name']}! Opening community feed...'),
                                        backgroundColor: AppColors.attendanceSafe,
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                  // Open community details immediately
                                  _openCommunityDetail(comm);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isJoined ? AppColors.primaryLight : AppColors.primary,
                                  foregroundColor: isJoined ? AppColors.primary : Colors.white,
                                  minimumSize: const Size(86, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Text(
                                  isJoined ? 'Joined ↗' : 'Join & Open',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            comm['description'],
                            style: const TextStyle(fontSize: 13, height: 1.4),
                          ),
                          if (comm['announcements'] != null && (comm['announcements'] as List).isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.campaign, size: 16, color: AppColors.primary),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      (comm['announcements'] as List).first.toString(),
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.primary),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// Dedicated Community Detail View opened upon Joining or Tapping a Community
class CommunityDetailPage extends StatefulWidget {
  final Map<String, dynamic> community;
  final bool isInitiallyJoined;
  final ValueChanged<bool> onToggleJoin;

  const CommunityDetailPage({
    super.key,
    required this.community,
    required this.isInitiallyJoined,
    required this.onToggleJoin,
  });

  @override
  State<CommunityDetailPage> createState() => _CommunityDetailPageState();
}

class _CommunityDetailPageState extends State<CommunityDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late bool _isJoined;
  late List<Map<String, dynamic>> _posts;
  final TextEditingController _newPostController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isJoined = widget.isInitiallyJoined;
    _posts = List<Map<String, dynamic>>.from(widget.community['posts'] ?? []);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _newPostController.dispose();
    super.dispose();
  }

  void _submitNewPost() {
    if (_newPostController.text.trim().isEmpty) return;
    setState(() {
      _posts.insert(0, {
        'author': 'Aarav Sharma (You)',
        'time': 'Just now',
        'content': _newPostController.text.trim(),
        'likes': 1,
        'comments': 0,
      });
      _newPostController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Update posted to community feed!'),
        backgroundColor: AppColors.attendanceSafe,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.community['color'] as Color? ?? AppColors.primary;
    final announcements = List<String>.from(widget.community['announcements'] ?? []);
    final events = List<Map<String, dynamic>>.from(widget.community['events'] ?? []);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text(widget.community['name']),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() => _isJoined = !_isJoined);
                widget.onToggleJoin(_isJoined);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isJoined ? 'Joined community!' : 'Left community.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isJoined ? AppColors.primaryLight : AppColors.primary,
                foregroundColor: _isJoined ? AppColors.primary : Colors.white,
                minimumSize: const Size(80, 36),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(_isJoined ? 'Joined' : 'Join'),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondaryLight,
          tabs: [
            Tab(text: 'Feed (${_posts.length})'),
            Tab(text: 'Notices (${announcements.length})'),
            Tab(text: 'Events (${events.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Community Feed & Updates
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Post Box
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.lightBorder),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primary,
                            child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _newPostController,
                              decoration: const InputDecoration(
                                hintText: 'Share an update, question, or project link...',
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _submitNewPost,
                            icon: const Icon(Icons.send_rounded, size: 14),
                            label: const Text('Post Update'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 36),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Posts List
                if (_posts.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text('No posts yet. Be the first to share!'),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final post = _posts[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.lightBorder),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: color.withValues(alpha: 0.15),
                                  child: Text(
                                    post['author'].toString().substring(0, 1),
                                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(post['author'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                      Text(post['time'], style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(post['content'], style: const TextStyle(fontSize: 14, height: 1.4)),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Icon(Icons.favorite_border_rounded, size: 16, color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text('${post['likes']}', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                const SizedBox(width: 16),
                                Icon(Icons.mode_comment_outlined, size: 16, color: Colors.grey.shade600),
                                const SizedBox(width: 4),
                                Text('${post['comments']}', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),

          // Tab 2: Pinned Notices & Announcements
          ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: announcements.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.campaign, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Official Club Broadcast', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primary)),
                          const SizedBox(height: 4),
                          Text(announcements[index], style: const TextStyle(fontSize: 14, height: 1.4)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Tab 3: Linked Upcoming Campus Events
          if (events.isEmpty)
            const Center(
              child: Text('No upcoming events scheduled by this community yet.'),
            )
          else
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ev = events[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.lightBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(ev['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.attendanceSafe.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('Open Pass', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.attendanceSafe)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14, color: AppColors.textSecondaryLight),
                          const SizedBox(width: 6),
                          Text(ev['date'], style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight)),
                          const SizedBox(width: 14),
                          const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondaryLight),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(ev['venue'], style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reg Deadline: ${ev['deadline']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.attendanceDanger)),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Registered for ${ev['title']}! Entry pass saved.'),
                                  backgroundColor: AppColors.attendanceSafe,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 34),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Get Pass', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
