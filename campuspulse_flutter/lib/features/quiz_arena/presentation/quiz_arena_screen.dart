import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/auth_user_menu.dart';

/// Section 5.7: Quiz Arena (Pokemon-Style Battles & Leaderboard Podium)
class QuizArenaScreen extends StatefulWidget {
  const QuizArenaScreen({super.key});

  @override
  State<QuizArenaScreen> createState() => _QuizArenaScreenState();
}

class _QuizArenaScreenState extends State<QuizArenaScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _playerRating = 1340;
  int _selectedLeaderboardTab = 0; // 0: Overall, 1: Same Year, 2: Same Branch

  // Active Quiz State
  bool _isInBattle = false;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _secondsRemaining = 15;
  Timer? _questionTimer;
  int? _selectedAnswerIndex;
  bool _answerSubmitted = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'subject': 'Operating Systems',
      'topic': 'CPU Scheduling',
      'question': 'Which of the following scheduling algorithms can cause the Convoy Effect?',
      'options': [
        'Round Robin (RR)',
        'Shortest Job First (SJF)',
        'First-Come, First-Served (FCFS)',
        'Multilevel Feedback Queue',
      ],
      'correct': 2,
      'explanation': 'In FCFS, CPU-intensive processes hold the CPU while I/O processes wait behind, causing a convoy.',
    },
    {
      'subject': 'Database Management Systems',
      'topic': 'Transactions',
      'question': 'Which ACID property is primarily ensured by the Write-Ahead Logging (WAL) protocol?',
      'options': [
        'Atomicity and Durability',
        'Isolation only',
        'Consistency only',
        'Scalability',
      ],
      'correct': 0,
      'explanation': 'WAL ensures Atomicity (undo uncommitted operations) and Durability (redo committed operations).',
    },
    {
      'subject': 'Data Structures & Algorithms',
      'topic': 'Graph Algorithms',
      'question': 'What is the time complexity of Dijkstra\'s algorithm with a Min-Heap for graph G(V, E)?',
      'options': [
        'O(V^2)',
        'O((V + E) log V)',
        'O(V * E)',
        'O(E log E)',
      ],
      'correct': 1,
      'explanation': 'Min-Heap priority queue provides O((V + E) log V) time complexity.',
    },
  ];

  final List<Map<String, dynamic>> _leaderboard = [
    {'rank': 1, 'name': 'Sahab Raza', 'rating': 1580, 'college': 'IIT Delhi', 'change': '+42'},
    {'rank': 2, 'name': 'Aarav Sharma', 'rating': 1510, 'college': 'IIT Delhi', 'change': '+18'},
    {'rank': 3, 'name': 'Priya Nair', 'rating': 1495, 'college': 'IIT Delhi', 'change': '-5'},
    {'rank': 4, 'name': 'Ananya Sengupta', 'rating': 1420, 'college': 'DTU', 'change': '+25'},
    {'rank': 5, 'name': 'Rohan Verma', 'rating': 1380, 'college': 'IIT Delhi', 'change': '+8'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _questionTimer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  void _startSoloBattle() {
    setState(() {
      _isInBattle = true;
      _currentQuestionIndex = 0;
      _score = 0;
      _selectedAnswerIndex = null;
      _answerSubmitted = false;
      _secondsRemaining = 15;
    });

    _startTimer();
  }

  void _startTimer() {
    _questionTimer?.cancel();
    _questionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _submitAnswer(-1); // Time expired
      }
    });
  }

  void _submitAnswer(int optionIndex) {
    if (_answerSubmitted) return;
    _questionTimer?.cancel();

    final q = _questions[_currentQuestionIndex];
    final isCorrect = (optionIndex == q['correct']);
    final speedBonus = isCorrect ? (_secondsRemaining * 6) : 0;
    final points = isCorrect ? (100 + speedBonus) : 0;

    setState(() {
      _selectedAnswerIndex = optionIndex;
      _answerSubmitted = true;
      _score += points;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
        _answerSubmitted = false;
        _secondsRemaining = 15;
      });
      _startTimer();
    } else {
      // Finished Match
      setState(() {
        _isInBattle = false;
        _playerRating += 24;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Match Complete! Final Score: $_score. Rating changed: +24 (New: $_playerRating)'),
          backgroundColor: AppColors.attendanceSafe,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isInBattle) {
      return _buildLiveBattleView(isDark);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Arena', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: const [
          AuthUserAvatarButton(),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondaryLight,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Battle Modes'),
            Tab(text: 'Leaderboards'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 1. Battle Modes
          _buildModesView(isDark),

          // 2. Leaderboards
          _buildLeaderboardsView(isDark),
        ],
      ),
    );
  }

  Widget _buildModesView(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Elo Rating Status Card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('YOUR QUIZ ELO', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text('$_playerRating', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
                  const Text('Rank: Diamond II • Top 3% in College', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              const Icon(Icons.shield_rounded, size: 60, color: Colors.amber),
            ],
          ),
        ),
        const SizedBox(height: 20),

        const Text('Select Game Mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),

        // Solo Practice Card
        _buildModeCard(
          title: 'Solo Practice Challenge',
          subtitle: '5 AI-curated questions with adaptive difficulty. Practice anytime.',
          icon: Icons.person_outline,
          color: AppColors.primary,
          badge: 'CASUAL',
          onTap: _startSoloBattle,
          isDark: isDark,
        ),
        const SizedBox(height: 12),

        // 1v1 Online Battle
        _buildModeCard(
          title: '1v1 Ranked Matchmaking',
          subtitle: 'Battle live with a classmate from your college with similar Elo rating.',
          icon: Icons.flash_on,
          color: AppColors.secondary,
          badge: 'RANKED',
          onTap: _startSoloBattle,
          isDark: isDark,
        ),
        const SizedBox(height: 12),

        // Group Battle
        _buildModeCard(
          title: 'Custom Room Battle',
          subtitle: 'Create a room with a 6-digit code or join a friend\'s lobby.',
          icon: Icons.group_outlined,
          color: AppColors.accent,
          badge: 'FRIENDS',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Room Code generated: #PULSE42')),
            );
          },
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildModeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String badge,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Row(
          children: [
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(badge, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight)),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLiveBattleView(bool isDark) {
    final q = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1} of ${_questions.length}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Score: $_score',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timer Bar
            LinearProgressIndicator(
              value: _secondsRemaining / 15.0,
              backgroundColor: Colors.grey.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                _secondsRemaining < 5 ? AppColors.attendanceDanger : AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${q['subject']} • ${q['topic']}',
                  style: const TextStyle(color: AppColors.textSecondaryLight, fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${_secondsRemaining}s remaining',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _secondsRemaining < 5 ? AppColors.attendanceDanger : AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Question Text
            Text(
              q['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, height: 1.4),
            ),
            const SizedBox(height: 24),

            // Options
            ...List.generate(4, (idx) {
              final optionText = q['options'][idx] as String;
              final isCorrectOption = (idx == q['correct']);
              final isSelected = (_selectedAnswerIndex == idx);

              Color? bgColor;
              Color? borderColor;

              if (_answerSubmitted) {
                if (isCorrectOption) {
                  bgColor = AppColors.attendanceSafe.withValues(alpha: 0.2);
                  borderColor = AppColors.attendanceSafe;
                } else if (isSelected) {
                  bgColor = AppColors.attendanceDanger.withValues(alpha: 0.2);
                  borderColor = AppColors.attendanceDanger;
                }
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: _answerSubmitted ? null : () => _submitAnswer(idx),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgColor ?? (isDark ? AppColors.darkCard : Colors.white),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: borderColor ?? (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                        width: isSelected || (_answerSubmitted && isCorrectOption) ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            String.fromCharCode(65 + idx),
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(optionText, style: const TextStyle(fontSize: 14))),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            if (_answerSubmitted) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '💡 Explanation: ${q['explanation']}',
                  style: const TextStyle(fontSize: 12, height: 1.4),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(_currentQuestionIndex < _questions.length - 1 ? 'Next Question →' : 'See Results'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardsView(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Three Filter Tabs: Overall College, Same Year, Same Branch
        Row(
          children: [
            _buildLeaderboardTabChip(0, 'All College'),
            const SizedBox(width: 8),
            _buildLeaderboardTabChip(1, '3rd Year Only'),
            const SizedBox(width: 8),
            _buildLeaderboardTabChip(2, 'CSE Branch Only'),
          ],
        ),
        const SizedBox(height: 24),

        // Podium for Top 3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 2nd Place
            _buildPodiumStep(
              name: _leaderboard[1]['name'],
              rating: _leaderboard[1]['rating'],
              rank: 2,
              height: 110,
              color: const Color(0xFF94A3B8), // Silver
            ),
            const SizedBox(width: 12),
            // 1st Place
            _buildPodiumStep(
              name: _leaderboard[0]['name'],
              rating: _leaderboard[0]['rating'],
              rank: 1,
              height: 140,
              color: const Color(0xFFFBBF24), // Gold
            ),
            const SizedBox(width: 12),
            // 3rd Place
            _buildPodiumStep(
              name: _leaderboard[2]['name'],
              rating: _leaderboard[2]['rating'],
              rank: 3,
              height: 85,
              color: const Color(0xFFD97706), // Bronze
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Remaining Rank List
        ..._leaderboard.skip(3).map((player) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
            ),
            child: Row(
              children: [
                Text(
                  '#${player['rank']}',
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.textSecondaryLight),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(player['name'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                      Text(player['college'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight)),
                    ],
                  ),
                ),
                Text(
                  '${player['rating']} pts',
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppColors.primary),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLeaderboardTabChip(int index, String label) {
    final isSelected = _selectedLeaderboardTab == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedLeaderboardTab = index),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.grey.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textSecondaryLight,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPodiumStep({
    required String name,
    required int rating,
    required int rank,
    required double height,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          name.split(' ').first,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
        ),
        Text(
          '$rating pts',
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
        ),
        const SizedBox(height: 6),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          alignment: Alignment.center,
          child: Text(
            '#$rank',
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
