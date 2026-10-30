import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/campus_pulse_logo.dart';
import '../../../core/widgets/auth_user_menu.dart';
import '../../sam_ai/presentation/sam_copilot_modal.dart';

/// Available view modes for the main screen
enum HomeViewMode {
  feed,
  list,
}

/// Section 5.4: Event Feed & Events List (Main Screen)
/// - Vertically swipeable full-screen feed (PageView) of upcoming events
/// - Dedicated function to list events with search, category filtering & status chips
/// - Dedicated function & interactive modal to add new campus events
/// - Live countdown to registration deadline (days:hours:minutes:seconds; turns red under 24h)
/// - "Registration closed" after deadline
/// - Quick registration, bookmarking, and complete event details sheet
class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  late Timer _timer;
  HomeViewMode _viewMode = HomeViewMode.feed;

  final Set<int> _registeredEvents = {};
  final Set<int> _savedEvents = {};

  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Registered',
    'Saved',
    'Hackathon',
    'Tech',
    'Cultural',
    'Robotics',
    'Workshop',
    'Sports',
  ];

  final List<Map<String, dynamic>> _events = [
    {
      'id': 1,
      'title': 'HackPulse 2026: 36-Hr National Hackathon',
      'club': 'DevClub IITD',
      'category': 'Hackathon',
      'posterUrl': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800',
      'date': 'Nov 5, 2026 • 9:00 AM',
      'venue': 'LHC Seminar Hall, IIT Delhi',
      'description': 'Solve problems in Web3, AI, and Campus Life. ₹3 Lakhs cash pool + direct internship interviews.',
      'deadline': DateTime.now().add(const Duration(hours: 14, minutes: 22, seconds: 40)),
      'tags': ['Hackathon', 'Coding', 'Cash Prize', 'AI'],
      'participants': 214,
      'capacity': 250,
    },
    {
      'id': 2,
      'title': 'Acoustic Night & Open Mic Under Stars',
      'club': 'Music & Cultural Society',
      'category': 'Cultural',
      'posterUrl': 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800',
      'date': 'Nov 8, 2026 • 6:30 PM',
      'venue': 'Open Air Theatre (OAT)',
      'description': 'Unplugged guitar riffs, soothing vocals, and spoken poetry. Free artisanal coffee & snacks!',
      'deadline': DateTime.now().add(const Duration(days: 3, hours: 8, minutes: 10)),
      'tags': ['Music', 'Open Mic', 'Night Life', 'Acoustic'],
      'participants': 380,
      'capacity': 500,
    },
    {
      'id': 3,
      'title': 'RoboWars 2026: Combat Robotics Championship',
      'club': 'Robotics Club',
      'category': 'Robotics',
      'posterUrl': 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=800',
      'date': 'Nov 12, 2026 • 11:00 AM',
      'venue': 'SAC Indoor Sports Complex',
      'description': '15kg and 30kg combat bots battle in an armored arena. Live sparks, pneumatic flippers, and spinning blades!',
      'deadline': DateTime.now().add(const Duration(days: 5, hours: 2)),
      'tags': ['Robotics', 'Hardware', 'Battle'],
      'participants': 142,
      'capacity': 200,
    },
    {
      'id': 4,
      'title': 'Generative AI & Agentic Systems Bootcamp',
      'club': 'Google Developer Student Club',
      'category': 'Tech',
      'posterUrl': 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800',
      'date': 'Nov 16, 2026 • 2:00 PM',
      'venue': 'CSE Audi 2 & Google Meet',
      'description': 'Hands-on workshop on building multi-agent LLM systems with Gemini 1.5 Pro, Serverpod, and Vector DBs.',
      'deadline': DateTime.now().add(const Duration(days: 6, hours: 18)),
      'tags': ['Tech', 'AI', 'Workshop', 'HandsOn'],
      'participants': 178,
      'capacity': 220,
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _searchController.dispose();
    super.dispose();
  }

  // ==========================================
  // HELPER FORMATTING & TIMING FUNCTIONS
  // ==========================================

  String _formatCountdown(DateTime deadline) {
    final diff = deadline.difference(DateTime.now());
    if (diff.isNegative) return 'Registration closed';

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final minutes = diff.inMinutes % 60;
    final seconds = diff.inSeconds % 60;

    final hStr = hours.toString().padLeft(2, '0');
    final mStr = minutes.toString().padLeft(2, '0');
    final sStr = seconds.toString().padLeft(2, '0');

    if (days > 0) {
      return '${days}d ${hStr}h ${mStr}m ${sStr}s';
    }
    return '${hStr}h ${mStr}m ${sStr}s';
  }

  bool _isUnder24Hours(DateTime deadline) {
    final diff = deadline.difference(DateTime.now());
    return !diff.isNegative && diff.inHours < 24;
  }

  void _toggleRegistration(int eventId, String title) {
    setState(() {
      if (_registeredEvents.contains(eventId)) {
        _registeredEvents.remove(eventId);
      } else {
        _registeredEvents.add(eventId);
      }
    });

    final isRegistered = _registeredEvents.contains(eventId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isRegistered
              ? 'Successfully registered for "$title"! Pass saved to My Events.'
              : 'Cancelled registration for "$title".',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleBookmark(int eventId) {
    setState(() {
      if (_savedEvents.contains(eventId)) {
        _savedEvents.remove(eventId);
      } else {
        _savedEvents.add(eventId);
      }
    });
  }

  // =========================================================
  // SEPARATE FUNCTION: ADD NEW EVENT (Logic & State Update)
  // =========================================================

  /// Dedicated function to add a new event to the campus pulse event feed
  void addNewEvent(Map<String, dynamic> newEvent) {
    setState(() {
      _events.insert(0, newEvent);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Event "${newEvent['title']}" published successfully to Campus Pulse!',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.attendanceSafe,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // =========================================================
  // SEPARATE FUNCTION: SHOW ADD EVENT BOTTOM SHEET (UI Modal)
  // =========================================================

  /// Dedicated separate function that launches the Add Event modal form
  void showAddEventBottomSheet(BuildContext context) {
    final titleController = TextEditingController();
    final clubController = TextEditingController();
    final venueController = TextEditingController();
    final descriptionController = TextEditingController();
    final tagsController = TextEditingController();
    final capacityController = TextEditingController(text: '200');

    String selectedCategory = 'Hackathon';
    DateTime eventDate = DateTime.now().add(const Duration(days: 7, hours: 10));
    DateTime registrationDeadline = DateTime.now().add(const Duration(days: 5, hours: 18));
    String posterUrl = 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800';

    final presetPosters = [
      {'name': 'Hackathon & Tech', 'url': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800'},
      {'name': 'Music & Cultural', 'url': 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800'},
      {'name': 'Robotics', 'url': 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=800'},
      {'name': 'AI & Data', 'url': 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800'},
      {'name': 'Sports & Gaming', 'url': 'https://images.unsplash.com/photo-1517649763962-0c623266ddc0?w=800'},
    ];

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
            final dateFormat = DateFormat('EEE, MMM d, yyyy • h:mm a');

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(ctx).size.height * 0.88,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag Handle
                      Center(
                        child: Container(
                          width: 44,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sheet Header
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.event_available_rounded, color: AppColors.primary, size: 24),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Campus Event',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'Publish an upcoming club or college event',
                                style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Event Title
                      TextField(
                        key: const Key('add_event_title_input'),
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Event Title *',
                          hintText: 'e.g. Flutter Forward Hackathon 2026',
                          prefixIcon: const Icon(Icons.title_rounded, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Organizing Club
                      TextField(
                        key: const Key('add_event_club_input'),
                        controller: clubController,
                        decoration: InputDecoration(
                          labelText: 'Organizing Club / Society *',
                          hintText: 'e.g. DevClub, Coding Society, E-Cell',
                          prefixIcon: const Icon(Icons.groups_rounded, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Category Selector
                      const Text(
                        'Category',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: ['Hackathon', 'Tech', 'Cultural', 'Robotics', 'Workshop', 'Sports'].map((cat) {
                          final isSelected = selectedCategory == cat;
                          return ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            selectedColor: AppColors.primary.withValues(alpha: 0.15),
                            labelStyle: TextStyle(
                              color: isSelected ? AppColors.primary : Colors.black87,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                            onSelected: (val) {
                              if (val) setModalState(() => selectedCategory = cat);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 14),

                      // Venue
                      TextField(
                        key: const Key('add_event_venue_input'),
                        controller: venueController,
                        decoration: InputDecoration(
                          labelText: 'Venue / Location *',
                          hintText: 'e.g. LHC Auditorium 1 or Open Air Theatre',
                          prefixIcon: const Icon(Icons.location_on_outlined, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Date & Time Picker
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        leading: const Icon(Icons.calendar_month_rounded, color: AppColors.primary),
                        title: const Text('Event Date & Time', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        subtitle: Text(dateFormat.format(eventDate), style: const TextStyle(fontSize: 12)),
                        trailing: TextButton(
                          child: const Text('Change'),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: eventDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (date != null && ctx.mounted) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(eventDate),
                              );
                              if (time != null) {
                                setModalState(() {
                                  eventDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                                });
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Registration Deadline Picker
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        leading: const Icon(Icons.timer_outlined, color: AppColors.attendanceDanger),
                        title: const Text('Registration Deadline', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        subtitle: Text(dateFormat.format(registrationDeadline), style: const TextStyle(fontSize: 12)),
                        trailing: TextButton(
                          child: const Text('Change'),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: registrationDeadline,
                              firstDate: DateTime.now(),
                              lastDate: eventDate,
                            );
                            if (date != null && ctx.mounted) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(registrationDeadline),
                              );
                              if (time != null) {
                                setModalState(() {
                                  registrationDeadline = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                                });
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Capacity
                      TextField(
                        key: const Key('add_event_capacity_input'),
                        controller: capacityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Maximum Capacity (Seats)',
                          hintText: 'e.g. 250',
                          prefixIcon: const Icon(Icons.people_outline_rounded, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Poster Theme Presets
                      const Text(
                        'Event Banner / Poster',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 70,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: presetPosters.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final poster = presetPosters[index];
                            final isSelected = posterUrl == poster['url'];
                            return GestureDetector(
                              onTap: () => setModalState(() => posterUrl = poster['url']!),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected ? AppColors.primary : Colors.transparent,
                                    width: 2.5,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(poster['url']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                                    ),
                                  ),
                                  child: Text(
                                    poster['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Tags
                      TextField(
                        controller: tagsController,
                        decoration: InputDecoration(
                          labelText: 'Tags (comma separated)',
                          hintText: 'e.g. Hackathon, AI, Cash Prize, Certificates',
                          prefixIcon: const Icon(Icons.tag_rounded, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Description
                      TextField(
                        key: const Key('add_event_description_input'),
                        controller: descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Event Description *',
                          hintText: 'Describe rules, eligibility, schedule, cash prizes, and perks...',
                          prefixIcon: const Icon(Icons.notes_rounded, color: AppColors.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          key: const Key('submit_new_event_button'),
                          onPressed: () {
                            final title = titleController.text.trim();
                            final club = clubController.text.trim();
                            final venue = venueController.text.trim();
                            final desc = descriptionController.text.trim();
                            final cap = int.tryParse(capacityController.text.trim()) ?? 200;

                            if (title.isEmpty || club.isEmpty || venue.isEmpty || desc.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in Title, Club, Venue, and Description.'),
                                  backgroundColor: AppColors.attendanceDanger,
                                ),
                              );
                              return;
                            }

                            final rawTags = tagsController.text.trim();
                            final tagList = rawTags.isNotEmpty
                                ? rawTags.split(',').map((t) => t.trim().replaceAll('#', '')).where((t) => t.isNotEmpty).toList()
                                : <String>[selectedCategory, 'Campus'];

                            final newEvent = {
                              'id': DateTime.now().millisecondsSinceEpoch,
                              'title': title,
                              'club': club,
                              'category': selectedCategory,
                              'posterUrl': posterUrl,
                              'date': DateFormat('MMM d, yyyy • h:mm a').format(eventDate),
                              'venue': venue,
                              'description': desc,
                              'deadline': registrationDeadline,
                              'tags': tagList,
                              'participants': 0,
                              'capacity': cap,
                            };

                            addNewEvent(newEvent);
                            Navigator.pop(ctx);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Publish Campus Event',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // =========================================================
  // SEPARATE FUNCTION: SHOW EVENT DETAILS MODAL
  // =========================================================

  /// Dedicated separate function that displays the full event details sheet
  void showEventDetailsModal(BuildContext context, Map<String, dynamic> event) {
    final eventId = event['id'] as int;
    final deadline = event['deadline'] as DateTime;
    final isClosed = deadline.difference(DateTime.now()).isNegative;
    final isRegistered = _registeredEvents.contains(eventId);
    final isSaved = _savedEvents.contains(eventId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDetailState) {
            return FractionallySizedBox(
              heightFactor: 0.85,
              child: Column(
                children: [
                  // Header Poster Image
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                          image: DecorationImage(
                            image: NetworkImage(event['posterUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withValues(alpha: 0.4), Colors.black.withValues(alpha: 0.85)],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: IconButton(
                          icon: const Icon(Icons.close_rounded, color: Colors.white),
                          onPressed: () => Navigator.pop(ctx),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isClosed ? Colors.grey[700] : AppColors.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                _formatCountdown(deadline),
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              event['title'],
                              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'By ${event['club']}',
                              style: const TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Detail Body
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Meta Row
                          Row(
                            children: [
                              const Icon(Icons.event_rounded, color: AppColors.primary, size: 18),
                              const SizedBox(width: 8),
                              Text(event['date'], style: const TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded, color: AppColors.accent, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(event['venue'], style: const TextStyle(fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.people_alt_rounded, color: AppColors.secondary, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                '${event['participants']} / ${event['capacity']} students registered',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 12),

                          // Description
                          const Text('About the Event', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 8),
                          Text(
                            event['description'],
                            style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                          ),
                          const SizedBox(height: 16),

                          // Tags
                          const Text('Tags & Topics', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (event['tags'] as List<dynamic>).map((tag) {
                              return Chip(
                                label: Text('#$tag'),
                                backgroundColor: Colors.grey.shade100,
                                labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Action Bar
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.grey.shade200)),
                    ),
                    child: Row(
                      children: [
                        IconButton.outlined(
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved ? AppColors.secondary : Colors.grey,
                          ),
                          onPressed: () {
                            _toggleBookmark(eventId);
                            setDetailState(() {});
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: isClosed
                                ? null
                                : () {
                                    _toggleRegistration(eventId, event['title']);
                                    setDetailState(() {});
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isRegistered ? AppColors.attendanceSafe : AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text(
                              isClosed
                                  ? 'Registration Closed'
                                  : isRegistered
                                      ? '✓ Registered (Tap to cancel)'
                                      : 'Register Now',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // =========================================================
  // SEPARATE FUNCTION: LIST EVENTS VIEW (Main Screen List Mode)
  // =========================================================

  /// Dedicated separate function that builds the structured Events List View
  Widget buildEventsListView() {
    final query = _searchController.text.trim().toLowerCase();

    // Filter events according to search query and category
    final filteredEvents = _events.where((event) {
      final title = (event['title'] as String).toLowerCase();
      final club = (event['club'] as String).toLowerCase();
      final venue = (event['venue'] as String).toLowerCase();
      final category = (event['category'] as String?)?.toLowerCase() ?? '';
      final tags = (event['tags'] as List<dynamic>).map((t) => t.toString().toLowerCase()).toList();

      final matchesSearch = query.isEmpty ||
          title.contains(query) ||
          club.contains(query) ||
          venue.contains(query) ||
          tags.any((t) => t.contains(query));

      if (!matchesSearch) return false;

      if (_selectedCategory == 'All') return true;
      if (_selectedCategory == 'Registered') return _registeredEvents.contains(event['id']);
      if (_selectedCategory == 'Saved') return _savedEvents.contains(event['id']);

      return category == _selectedCategory.toLowerCase() ||
          tags.any((t) => t.toLowerCase() == _selectedCategory.toLowerCase());
    }).toList();

    return Column(
      children: [
        // Top Controls: Search Bar & Post Button Row
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        key: const Key('events_search_input'),
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Search events, clubs, venues, #tags...',
                          hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary, size: 20),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear_rounded, size: 18),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {});
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.icon(
                    key: const Key('list_view_add_event_btn'),
                    onPressed: () => showAddEventBottomSheet(context),
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Add Event', style: TextStyle(fontWeight: FontWeight.w700)),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Horizontal Category Chips
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final isSelected = _selectedCategory == cat;
                    return FilterChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? AppColors.primary : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Events List Content or Empty State
        Expanded(
          child: filteredEvents.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];
                    return _buildEventCard(event);
                  },
                ),
        ),
      ],
    );
  }

  /// Event Card Widget in the structured List View
  Widget _buildEventCard(Map<String, dynamic> event) {
    final eventId = event['id'] as int;
    final deadline = event['deadline'] as DateTime;
    final isUnder24 = _isUnder24Hours(deadline);
    final isClosed = deadline.difference(DateTime.now()).isNegative;
    final isRegistered = _registeredEvents.contains(eventId);
    final isSaved = _savedEvents.contains(eventId);
    final capacity = (event['capacity'] as int?) ?? 200;
    final participants = (event['participants'] as int?) ?? 0;
    final double fillRate = capacity > 0 ? (participants / capacity).clamp(0.0, 1.0) : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => showEventDetailsModal(context, event),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Poster Thumbnail + Title & Club
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        event['posterUrl'],
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 72,
                          height: 72,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.event, color: Colors.grey),
                        ),
                      ),
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
                                  color: AppColors.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  event['category'] ?? 'Event',
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // Countdown Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: isClosed
                                      ? Colors.grey.shade200
                                      : isUnder24
                                          ? AppColors.attendanceDanger.withValues(alpha: 0.15)
                                          : AppColors.primary.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      isClosed ? Icons.lock_clock : Icons.timer_outlined,
                                      size: 12,
                                      color: isClosed
                                          ? Colors.grey.shade700
                                          : isUnder24
                                              ? AppColors.attendanceDanger
                                              : AppColors.primary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _formatCountdown(deadline),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: isClosed
                                            ? Colors.grey.shade700
                                            : isUnder24
                                                ? AppColors.attendanceDanger
                                                : AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            event['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, height: 1.2),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Organized by ${event['club']}',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Date & Venue Details
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 6),
                    Text(
                      event['date'],
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 14),
                    Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event['venue'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Registration Capacity Bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: fillRate,
                          minHeight: 5,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            fillRate >= 0.9 ? AppColors.attendanceDanger : AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$participants/$capacity spots',
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Action Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: isClosed ? null : () => _toggleRegistration(eventId, event['title']),
                        icon: Icon(isRegistered ? Icons.check_circle_rounded : Icons.app_registration_rounded, size: 16),
                        label: Text(
                          isClosed
                              ? 'Closed'
                              : isRegistered
                                  ? 'Registered'
                                  : 'Register Now',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isRegistered ? AppColors.attendanceSafe : AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => showEventDetailsModal(context, event),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: const Text('Details', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? AppColors.secondary : Colors.grey.shade600,
                        size: 20,
                      ),
                      onPressed: () => _toggleBookmark(eventId),
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

  /// Empty state view when no events match the search/filter
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.event_busy_rounded, color: AppColors.primary, size: 48),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Events Found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              _searchController.text.isNotEmpty
                  ? 'No campus events matching "${_searchController.text}".'
                  : 'No events under the selected category.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _searchController.clear();
                setState(() => _selectedCategory = 'All');
              },
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Reset Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // SEPARATE FUNCTION: FEED VIEW (Instagram-style Full-screen)
  // =========================================================

  /// Dedicated separate function that builds the vertical swipeable PageView feed
  Widget buildFeedView() {
    return PageView.builder(
      key: const Key('events_page_view_feed'),
      scrollDirection: Axis.vertical,
      itemCount: _events.length,
      itemBuilder: (context, index) {
        final event = _events[index];
        final eventId = event['id'] as int;
        final deadline = event['deadline'] as DateTime;
        final isUnder24 = _isUnder24Hours(deadline);
        final isClosed = deadline.difference(DateTime.now()).isNegative;
        final isRegistered = _registeredEvents.contains(eventId);
        final isSaved = _savedEvents.contains(eventId);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(event['posterUrl']),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.95),
                ],
                stops: const [0.0, 0.4, 0.9],
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Countdown Pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: isClosed
                        ? Colors.grey[800]
                        : isUnder24
                            ? AppColors.attendanceDanger
                            : AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: (isUnder24 ? AppColors.attendanceDanger : AppColors.primary).withValues(alpha: 0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isClosed ? Icons.lock_clock : Icons.timer_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatCountdown(deadline),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Event Title & Club
                Text(
                  event['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Organized by ${event['club']}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                // Venue & Date Pills
                Row(
                  children: [
                    const Icon(Icons.event_outlined, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      event['date'],
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(width: 14),
                    const Icon(Icons.location_on_outlined, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event['venue'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Description
                Text(
                  event['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),

                // Tag Chips
                Wrap(
                  spacing: 8,
                  children: (event['tags'] as List<dynamic>).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '#$tag',
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Action Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isClosed ? null : () => _toggleRegistration(eventId, event['title']),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isRegistered ? AppColors.attendanceSafe : AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          isClosed
                              ? 'Closed'
                              : isRegistered
                                  ? '✓ Registered (${event['participants'] + 1})'
                                  : 'Register Now (${event['participants']}/${event['capacity']})',
                          style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        padding: const EdgeInsets.all(12),
                      ),
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? AppColors.secondary : Colors.white,
                      ),
                      onPressed: () => _toggleBookmark(eventId),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // =========================================================
  // MAIN SCREEN BUILD METHOD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CampusPulseLogo(size: 28, showGlow: false),
            SizedBox(width: 10),
            Text('Kampuzz', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          // View Mode Switcher Button (Feed vs List Events)
          IconButton(
            key: const Key('toggle_view_mode_button'),
            tooltip: _viewMode == HomeViewMode.feed ? 'Switch to List Events' : 'Switch to Swipe Feed',
            icon: Icon(
              _viewMode == HomeViewMode.feed ? Icons.format_list_bulleted_rounded : Icons.view_carousel_rounded,
              color: AppColors.primary,
            ),
            onPressed: () {
              setState(() {
                _viewMode = _viewMode == HomeViewMode.feed ? HomeViewMode.list : HomeViewMode.feed;
              });
            },
          ),

          // Add Event Action Button
          IconButton(
            key: const Key('appbar_add_event_button'),
            tooltip: 'Add / Post Campus Event',
            icon: const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
            onPressed: () => showAddEventBottomSheet(context),
          ),

          // Sam AI Copilot Button
          IconButton(
            tooltip: 'Ask Sam AI Copilot',
            icon: const Icon(Icons.auto_awesome, color: Color(0xFF6366F1)),
            onPressed: () => showSamCopilotModal(context),
          ),

          // Timetable Button
          IconButton(
            tooltip: 'Timetable',
            icon: const Icon(Icons.calendar_today_outlined, color: AppColors.primary),
            onPressed: () => context.push('/timetable'),
          ),

          const AuthUserAvatarButton(),
        ],
      ),

      // Screen Body: Switch between Feed View and List Events View
      body: _viewMode == HomeViewMode.feed ? buildFeedView() : buildEventsListView(),
    );
  }
}
