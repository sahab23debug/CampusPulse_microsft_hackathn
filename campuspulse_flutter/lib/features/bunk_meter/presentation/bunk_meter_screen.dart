import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/bunk_math.dart';
import '../../sam_ai/presentation/sam_copilot_modal.dart';

/// Section 5.2: Bunk-Meter (Attendance Predictor & Bunkoo-Meter Engine)
/// Reference: https://bunkoo-meter.web.app/
/// Features:
/// - Configurable target percentage (65%, 75% default, 80%, 85%)
/// - Mathematical Safe Bunk and Consecutive Recovery calculators
/// - Dual What-If Attendance Simulator (Bunking vs Attending)
/// - Next Lecture Impact analysis (+1 Present vs +1 Absent)
/// - Quick Bunk-O-Meter Calculator modal for arbitrary classes
/// - Real-time Subject Attendance Management (+Present, +Bunked, Undo)
class BunkMeterScreen extends StatefulWidget {
  const BunkMeterScreen({super.key});

  @override
  State<BunkMeterScreen> createState() => _BunkMeterScreenState();
}

class _BunkMeterScreenState extends State<BunkMeterScreen> {
  double _requiredPercentage = 75.0;
  int _whatIfCount = 0;
  bool _whatIfIsBunk = true; // true = Bunking, false = Attending

  final List<double> _presetTargets = [65.0, 75.0, 80.0, 85.0];

  final List<Map<String, dynamic>> _subjects = [
    {
      'id': 1,
      'name': 'Database Management Systems',
      'code': 'CS501',
      'attended': 26,
      'total': 30,
      'history': <bool>[],
    },
    {
      'id': 2,
      'name': 'Operating Systems',
      'code': 'CS502',
      'attended': 21,
      'total': 28,
      'history': <bool>[],
    },
    {
      'id': 3,
      'name': 'Design & Analysis of Algorithms',
      'code': 'CS503',
      'attended': 14,
      'total': 22,
      'history': <bool>[],
    },
    {
      'id': 4,
      'name': 'Computer Networks',
      'code': 'CS504',
      'attended': 19,
      'total': 20,
      'history': <bool>[],
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'green':
        return AppColors.attendanceSafe;
      case 'amber':
        return AppColors.attendanceWarning;
      case 'red':
      default:
        return AppColors.attendanceDanger;
    }
  }

  void _markAttendance(int index, bool isPresent) {
    setState(() {
      _subjects[index]['total'] = (_subjects[index]['total'] as int) + 1;
      if (isPresent) {
        _subjects[index]['attended'] = (_subjects[index]['attended'] as int) + 1;
      }
      final history = _subjects[index]['history'] as List<bool>;
      history.add(isPresent);
    });

    final sub = _subjects[index];
    final pct = BunkMath.currentPercentage(sub['attended'] as int, sub['total'] as int);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Marked ${isPresent ? "Present ✓" : "Absent ✗"} in ${sub['code']}. Current: ${pct.toStringAsFixed(1)}%',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _undoAttendance(int index) {
    final history = _subjects[index]['history'] as List<bool>;
    if (history.isEmpty) return;

    final lastWasPresent = history.removeLast();
    setState(() {
      _subjects[index]['total'] = (_subjects[index]['total'] as int) - 1;
      if (lastWasPresent) {
        _subjects[index]['attended'] = (_subjects[index]['attended'] as int) - 1;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reverted last mark for ${_subjects[index]['code']}.'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showAddSubjectDialog() {
    final nameCtrl = TextEditingController();
    final codeCtrl = TextEditingController();
    final attendedCtrl = TextEditingController(text: '15');
    final totalCtrl = TextEditingController(text: '20');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.add_chart_rounded, color: AppColors.primary),
            SizedBox(width: 8),
            Text('Add College Subject', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Subject Name *', hintText: 'e.g. Compiler Design'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: codeCtrl,
                decoration: const InputDecoration(labelText: 'Subject Code', hintText: 'e.g. CS505'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: attendedCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Attended'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: totalCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Total Held'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              final code = codeCtrl.text.trim().isEmpty ? 'SUB' : codeCtrl.text.trim();
              final att = int.tryParse(attendedCtrl.text.trim()) ?? 0;
              final tot = int.tryParse(totalCtrl.text.trim()) ?? att;

              setState(() {
                _subjects.add({
                  'id': DateTime.now().millisecondsSinceEpoch,
                  'name': name,
                  'code': code,
                  'attended': att,
                  'total': tot,
                  'history': <bool>[],
                });
              });
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text('Add Subject', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  void _showQuickCalculatorModal() {
    int qAttended = 20;
    int qTotal = 25;
    double qTarget = _requiredPercentage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setQuickState) {
            final pct = BunkMath.currentPercentage(qAttended, qTotal);
            final safe = BunkMath.safeBunks(qAttended, qTotal, qTarget);
            final recovery = BunkMath.recoveryClasses(qAttended, qTotal, qTarget);
            final statusColor = _getStatusColor(BunkMath.statusColor(qAttended, qTotal, qTarget));
            final nextPresent = BunkMath.nextClassIfPresent(qAttended, qTotal);
            final nextAbsent = BunkMath.nextClassIfAbsent(qAttended, qTotal);

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
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
                        decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(Icons.calculate_rounded, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text('Quick Bunkoo-Meter Calculator', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Calculate safe bunks & recovery for any custom class numbers instantly.',
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 16),

                    // Inputs
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: qAttended.toString(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Attended Classes', border: OutlineInputBorder()),
                            onChanged: (val) {
                              setQuickState(() => qAttended = int.tryParse(val) ?? 0);
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            initialValue: qTotal.toString(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Total Classes Held', border: OutlineInputBorder()),
                            onChanged: (val) {
                              setQuickState(() => qTotal = int.tryParse(val) ?? 1);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Result Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${pct.toStringAsFixed(1)}%',
                                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: statusColor),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  pct >= qTarget ? 'Safe' : 'Shortage',
                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            BunkMath.stressStatusMessage(qAttended, qTotal, qTarget),
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: statusColor),
                          ),
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text('Safe Bunks', style: TextStyle(fontSize: 11, color: Colors.black54)),
                                  Text('$safe classes', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Recovery', style: TextStyle(fontSize: 11, color: Colors.black54)),
                                  Text(recovery > 0 ? '$recovery classes' : '0 (Safe)',
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Next Present', style: TextStyle(fontSize: 11, color: Colors.black54)),
                                  Text('${nextPresent.toStringAsFixed(1)}%',
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.attendanceSafe)),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Next Bunk', style: TextStyle(fontSize: 11, color: Colors.black54)),
                                  Text('${nextAbsent.toStringAsFixed(1)}%',
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.attendanceDanger)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Overall Calculation
    int totalAttended = 0;
    int totalHeld = 0;
    for (final s in _subjects) {
      totalAttended += (s['attended'] as int);
      totalHeld += (s['total'] as int);
    }

    final overallPct = BunkMath.currentPercentage(totalAttended, totalHeld);
    final overallSafeBunks = BunkMath.safeBunks(totalAttended, totalHeld, _requiredPercentage);
    final overallRecovery = BunkMath.recoveryClasses(totalAttended, totalHeld, _requiredPercentage);
    final overallColor = _getStatusColor(BunkMath.statusColor(totalAttended, totalHeld, _requiredPercentage));
    final nextClassPresent = BunkMath.nextClassIfPresent(totalAttended, totalHeld);
    final nextClassAbsent = BunkMath.nextClassIfAbsent(totalAttended, totalHeld);

    // What-If projected percentage
    final projectedWhatIfPct = _whatIfIsBunk
        ? BunkMath.whatIfPercentage(totalAttended, totalHeld, _whatIfCount)
        : BunkMath.whatIfAttendPercentage(totalAttended, totalHeld, _whatIfCount);
    final projectedColor = _getStatusColor(
      BunkMath.statusColor(
        _whatIfIsBunk ? totalAttended : totalAttended + _whatIfCount,
        totalHeld + _whatIfCount,
        _requiredPercentage,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bunk-Meter', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            icon: const Icon(Icons.calculate_outlined),
            tooltip: 'Quick Bunkoo-Meter Calculator',
            onPressed: _showQuickCalculatorModal,
          ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Add Subject',
            onPressed: _showAddSubjectDialog,
          ),
          IconButton(
            icon: const Icon(Icons.auto_awesome, color: Color(0xFF6366F1)),
            tooltip: 'Ask Sam AI Attendance Advice',
            onPressed: () => showSamCopilotModal(context),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Attendance Policy Formulas',
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Bunkoo-Meter Formulas'),
                  content: Text(
                    '• Current Attendance: (Attended / Total) × 100\n'
                    '• Safe Bunks: floor((100 × Attended - Target × Total) / Target)\n'
                    '• Recovery: ceil((Target × Total - 100 × Attended) / (100 - Target))\n'
                    '• Target: ${_requiredPercentage.toInt()}%\n'
                    '• Safe: > ${_requiredPercentage.toInt()}%\n'
                    '• Amber: Within 1-2 classes of dropping\n'
                    '• Critical: Below ${_requiredPercentage.toInt()}% threshold',
                  ),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Got it')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Target Percentage Selector Bar
            Row(
              children: [
                const Icon(Icons.flag_rounded, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                const Text(
                  'Target Policy:',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _presetTargets.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final target = _presetTargets[index];
                        final isSelected = _requiredPercentage == target;
                        return ChoiceChip(
                          label: Text('${target.toInt()}%'),
                          selected: isSelected,
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                            fontSize: 12,
                          ),
                          onSelected: (val) {
                            if (val) setState(() => _requiredPercentage = target);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Top Overall Prediction Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    overallColor.withValues(alpha: 0.9),
                    overallColor.withValues(alpha: 0.75),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: overallColor.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'OVERALL ATTENDANCE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${overallPct.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '$totalAttended attended / $totalHeld held (Target: ${_requiredPercentage.toInt()}%)',
                            style: const TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          overallPct >= _requiredPercentage ? Icons.check_circle_outline : Icons.warning_amber_rounded,
                          color: Colors.white,
                          size: 44,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Stress Status Text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      BunkMath.stressStatusMessage(totalAttended, totalHeld, _requiredPercentage),
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: Colors.white24, height: 1),
                  const SizedBox(height: 12),

                  // Metrics Row: Safe Bunks, Recovery & Next Lecture Impact
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text('Safe Bunks', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text(
                            '$overallSafeBunks classes',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(height: 24, width: 1, color: Colors.white24),
                      Column(
                        children: [
                          const Text('Recovery Needed', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text(
                            overallRecovery > 0 ? '$overallRecovery classes' : '0 (Safe)',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(height: 24, width: 1, color: Colors.white24),
                      Column(
                        children: [
                          const Text('Next Present', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text(
                            '${nextClassPresent.toStringAsFixed(1)}%',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(height: 24, width: 1, color: Colors.white24),
                      Column(
                        children: [
                          const Text('Next Bunk', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text(
                            '${nextClassAbsent.toStringAsFixed(1)}%',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Interactive What-If Simulator Card (Bunkoo-Meter Dual Mode)
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'What-If Attendance Simulator',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      // Segmented Mode Switcher (Bunk vs Attend)
                      SegmentedButton<bool>(
                        segments: const [
                          ButtonSegment(value: true, label: Text('Bunk', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700))),
                          ButtonSegment(value: false, label: Text('Attend', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700))),
                        ],
                        selected: {_whatIfIsBunk},
                        onSelectionChanged: (set) => setState(() => _whatIfIsBunk = set.first),
                        style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _whatIfIsBunk
                        ? 'If I bunk $_whatIfCount more class${_whatIfCount == 1 ? "" : "es"}, my overall attendance becomes:'
                        : 'If I attend $_whatIfCount more class${_whatIfCount == 1 ? "" : "es"}, my overall attendance becomes:',
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '${projectedWhatIfPct.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: projectedColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: projectedColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          projectedWhatIfPct >= _requiredPercentage ? 'Safely Above Target' : 'Falls Below Target',
                          style: TextStyle(color: projectedColor, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _whatIfCount.toDouble(),
                    min: 0,
                    max: 15,
                    divisions: 15,
                    activeColor: _whatIfIsBunk ? AppColors.attendanceDanger : AppColors.attendanceSafe,
                    label: '$_whatIfCount classes',
                    onChanged: (val) {
                      setState(() {
                        _whatIfCount = val.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Subject-wise Breakdown Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subject Breakdown',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                TextButton.icon(
                  onPressed: _showAddSubjectDialog,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add Subject'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Subject Cards
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _subjects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final sub = _subjects[index];
                final attended = sub['attended'] as int;
                final total = sub['total'] as int;
                final history = (sub['history'] as List<bool>?) ?? [];
                final pct = BunkMath.currentPercentage(attended, total);
                final safe = BunkMath.safeBunks(attended, total, _requiredPercentage);
                final recovery = BunkMath.recoveryClasses(attended, total, _requiredPercentage);
                final color = _getStatusColor(BunkMath.statusColor(attended, total, _requiredPercentage));
                final subNextPresent = BunkMath.nextClassIfPresent(attended, total);
                final subNextAbsent = BunkMath.nextClassIfAbsent(attended, total);

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkCard : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sub['name'],
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${sub['code']} • $attended/$total classes held',
                                  style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${pct.toStringAsFixed(1)}%',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: (pct / 100.0).clamp(0.0, 1.0),
                          backgroundColor: Colors.grey.withValues(alpha: 0.15),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Status & Next Class Breakdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (safe > 0)
                            Text(
                              '✓ Can safely bunk $safe class${safe == 1 ? "" : "es"}',
                              style: const TextStyle(color: AppColors.attendanceSafe, fontSize: 12, fontWeight: FontWeight.w600),
                            )
                          else if (recovery > 0)
                            Text(
                              '⚠ Must attend next $recovery class${recovery == 1 ? "" : "es"}',
                              style: const TextStyle(color: AppColors.attendanceDanger, fontSize: 12, fontWeight: FontWeight.w600),
                            )
                          else
                            const Text(
                              'On the edge (0 safe bunks)',
                              style: TextStyle(color: AppColors.attendanceWarning, fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          Text(
                            '+1 Present: ${subNextPresent.toStringAsFixed(1)}% | Bunk: ${subNextAbsent.toStringAsFixed(1)}%',
                            style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Action Buttons: Present, Bunked, Undo
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _markAttendance(index, true),
                              icon: const Icon(Icons.check, size: 16, color: AppColors.attendanceSafe),
                              label: const Text('Present', style: TextStyle(color: AppColors.attendanceSafe, fontSize: 12)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.attendanceSafe),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _markAttendance(index, false),
                              icon: const Icon(Icons.close, size: 16, color: AppColors.attendanceDanger),
                              label: const Text('Bunked', style: TextStyle(color: AppColors.attendanceDanger, fontSize: 12)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.attendanceDanger),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                          if (history.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            IconButton.outlined(
                              icon: const Icon(Icons.undo_rounded, size: 18),
                              tooltip: 'Undo last mark',
                              onPressed: () => _undoAttendance(index),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
