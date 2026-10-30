import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../sam_ai/presentation/sam_copilot_modal.dart';

/// Section 5.3: Timetable and Academic Calendar
class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _todayClasses = [
    {
      'subject': 'Database Management Systems',
      'code': 'CS501',
      'faculty': 'Prof. V. Sharma',
      'room': 'LHC-101',
      'time': '09:00 AM - 10:00 AM',
      'type': 'Lecture',
      'isCurrent': false,
      'isNext': false,
    },
    {
      'subject': 'Operating Systems',
      'code': 'CS502',
      'faculty': 'Dr. Neha Gupta',
      'room': 'LHC-204',
      'time': '10:15 AM - 11:15 AM',
      'type': 'Lecture',
      'isCurrent': true, // Highlighted current class
      'isNext': false,
    },
    {
      'subject': 'Design & Analysis of Algorithms',
      'code': 'CS503',
      'faculty': 'Prof. R. Sen',
      'room': 'CS Lab 3',
      'time': '11:30 AM - 01:00 PM',
      'type': 'Lab',
      'isCurrent': false,
      'isNext': true, // Highlighted next class
    },
    {
      'subject': 'Computer Networks',
      'code': 'CS504',
      'faculty': 'Dr. K. Iyer',
      'room': 'LHC-102',
      'time': '02:00 PM - 03:00 PM',
      'type': 'Lecture',
      'isCurrent': false,
      'isNext': false,
    },
  ];

  final List<Map<String, dynamic>> _academicEvents = [
    {
      'title': 'Mid-Semester Examinations',
      'date': 'Nov 18 - Nov 24, 2026',
      'type': 'Exam',
      'color': AppColors.attendanceDanger,
      'desc': 'Theory exams for all 5th semester courses across departments.',
    },
    {
      'title': 'Diwali Semester Break',
      'date': 'Nov 1 - Nov 4, 2026',
      'type': 'Holiday',
      'color': AppColors.attendanceSafe,
      'desc': 'Hostels remain open; no academic lectures or lab sessions.',
    },
    {
      'title': 'HackPulse National Hackathon',
      'date': 'Nov 5 - Nov 6, 2026',
      'type': 'Fest',
      'color': AppColors.primary,
      'desc': 'Annual 36-hour flagship hackathon at LHC Seminar Hall.',
    },
    {
      'title': 'DBMS Project Milestone 2 Submission',
      'date': 'Nov 14, 2026 • 11:59 PM',
      'type': 'Deadline',
      'color': AppColors.attendanceWarning,
      'desc': 'Schema design + B-Tree indexing benchmarks report upload.',
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable & Calendar', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            tooltip: 'Ask Sam AI about Schedule',
            icon: const Icon(Icons.auto_awesome, color: Color(0xFF6366F1)),
            onPressed: () => showSamCopilotModal(context),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondaryLight,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Today'),
            Tab(text: 'Week Grid'),
            Tab(text: 'Academic Calendar'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 1. Today View
          _buildTodayView(isDark),

          // 2. Week Grid View
          _buildWeekGridView(isDark),

          // 3. Academic Calendar View
          _buildCalendarView(isDark),
        ],
      ),
    );
  }

  Widget _buildTodayView(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Sam AI Copilot Timetable Banner
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6366F1).withValues(alpha: 0.12),
                const Color(0xFF8B5CF6).withValues(alpha: 0.08),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF6366F1).withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF6366F1),
                child: Icon(Icons.auto_awesome, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sam AI Timetable Buddy', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: Color(0xFF6366F1))),
                    Text('Next: DAA Lab in CS Lab 3 at 11:30 AM', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () => showSamCopilotModal(context),
                icon: const Icon(Icons.chat_bubble_outline_rounded, size: 14),
                label: const Text('Ask Sam'),
              ),
            ],
          ),
        ),

        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thursday, Today',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Section CSE-3A (4 classes scheduled)',
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Week 9',
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Classes List
        ..._todayClasses.map((c) {
          final isCurrent = c['isCurrent'] as bool;
          final isNext = c['isNext'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isCurrent
                    ? AppColors.primary
                    : isNext
                        ? AppColors.secondary
                        : isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                width: (isCurrent || isNext) ? 2 : 1,
              ),
              boxShadow: isCurrent
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (isCurrent)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'HAPPENING NOW',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 10),
                            ),
                          )
                        else if (isNext)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'UP NEXT',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 10),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            c['type'],
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      c['time'],
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  c['subject'],
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 15, color: AppColors.textSecondaryLight),
                    const SizedBox(width: 4),
                    Text(c['faculty'], style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight)),
                    const SizedBox(width: 14),
                    const Icon(Icons.room_outlined, size: 15, color: AppColors.textSecondaryLight),
                    const SizedBox(width: 4),
                    Text(c['room'], style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Marked present for ${c['code']} in Bunk-Meter!')),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline, size: 16, color: AppColors.attendanceSafe),
                      label: const Text('Mark Present', style: TextStyle(color: AppColors.attendanceSafe, fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildWeekGridView(bool isDark) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: days.map((day) {
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              const Text(
                '09:00 AM • DBMS (LHC-101)\n10:15 AM • Operating Systems (LHC-204)\n11:30 AM • DAA Lab (CS Lab 3)\n02:00 PM • Computer Networks (LHC-102)',
                style: TextStyle(fontSize: 13, height: 1.6),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarView(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'November 2026 Events',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 14),
        ..._academicEvents.map((e) {
          final color = e['color'] as Color;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              e['title'],
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              e['type'],
                              style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e['date'],
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        e['desc'],
                        style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
