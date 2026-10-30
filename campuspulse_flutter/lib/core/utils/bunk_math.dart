import 'dart:math' as math;

/// Bunkoo-Meter & CampusPulse Attendance Calculation Engine.
/// Implements standard Bunkoo-Meter mathematical formulas:
/// - Current Attendance: (Attended / Total) * 100
/// - Safe Bunks: floor((100 * Attended - Target * Total) / Target)
/// - Recovery Classes: ceil((Target * Total - 100 * Attended) / (100 - Target))
/// - Next Lecture Impact (Present vs Bunked)
/// - What-If Attendance Simulations (Bunking vs Attending)
class BunkMath {
  /// Current attendance percentage with edge case handling (0 total classes = 100.0%).
  static double currentPercentage(int attended, int total) {
    if (total <= 0) return 100.0;
    if (attended <= 0) return 0.0;
    if (attended > total) attended = total;
    return (attended / total) * 100.0;
  }

  /// Safe bunks remaining without dropping below target percentage:
  /// floor((100 * attended - required * total) / required)
  ///
  /// Returns 0 if current attendance is below or right on the threshold.
  static int safeBunks(int attended, int total, double requiredPercentage) {
    if (total <= 0) return 0;
    if (requiredPercentage <= 0) return 999;
    if (requiredPercentage >= 100.0) return 0;

    final currentPct = currentPercentage(attended, total);
    if (currentPct < requiredPercentage) return 0;

    final numerator = (100.0 * attended) - (requiredPercentage * total);
    // Add small epsilon for floating-point precision stability
    final value = (numerator / requiredPercentage) + 1e-9;
    return math.max(0, value.floor());
  }

  /// Consecutive classes needed to recover back to target required percentage:
  /// ceil((required * total - 100 * attended) / (100 - required))
  ///
  /// Returns 0 if already above target percentage.
  /// Returns -1 if mathematically unreachable (e.g. required is 100% and a class was missed).
  static int recoveryClasses(int attended, int total, double requiredPercentage) {
    if (total <= 0) return 0;
    final currentPct = currentPercentage(attended, total);
    if (currentPct >= requiredPercentage) return 0;

    if (requiredPercentage >= 100.0) {
      return -1;
    }

    final numerator = (requiredPercentage * total) - (100.0 * attended);
    final denominator = 100.0 - requiredPercentage;
    // Subtract small epsilon before ceil to avoid 4.000000000000001 ceiling to 5
    final needed = ((numerator / denominator) - 1e-9).ceil();
    return math.max(0, needed);
  }

  /// What-if projection if student bunks [bunkXMore] additional classes:
  /// attended / (total + bunkXMore) * 100
  static double whatIfPercentage(
    int attended,
    int total,
    int bunkXMore, {
    int? projectedSemesterTotal,
  }) {
    if (bunkXMore < 0) bunkXMore = 0;
    final newTotal = projectedSemesterTotal ?? (total + bunkXMore);
    if (newTotal <= 0) return 100.0;
    return (attended / newTotal) * 100.0;
  }

  /// What-if projection if student attends [attendXMore] additional classes:
  /// (attended + attendXMore) / (total + attendXMore) * 100
  static double whatIfAttendPercentage(int attended, int total, int attendXMore) {
    if (attendXMore < 0) attendXMore = 0;
    final newTotal = total + attendXMore;
    if (newTotal <= 0) return 100.0;
    return ((attended + attendXMore) / newTotal) * 100.0;
  }

  /// Projected percentage if student attends the next single class (+1 present)
  static double nextClassIfPresent(int attended, int total) {
    return ((attended + 1) / (total + 1)) * 100.0;
  }

  /// Projected percentage if student skips the next single class (+1 bunked)
  static double nextClassIfAbsent(int attended, int total) {
    return (attended / (total + 1)) * 100.0;
  }

  /// Bunkoo-Meter Status indicator: 'green', 'amber', 'red'
  static String statusColor(int attended, int total, double requiredPercentage) {
    if (total <= 0) return 'green';
    final currentPct = currentPercentage(attended, total);
    if (currentPct < requiredPercentage) return 'red';
    final bunks = safeBunks(attended, total, requiredPercentage);
    if (bunks <= 1 || (currentPct - requiredPercentage) < 3.0) return 'amber';
    return 'green';
  }

  /// Human-friendly Bunkoo-Meter verdict message
  static String stressStatusMessage(int attended, int total, double requiredPercentage) {
    if (total <= 0) {
      return 'No classes held yet. Your attendance starts at 100%.';
    }

    final currentPct = currentPercentage(attended, total);
    final targetStr = requiredPercentage.toStringAsFixed(requiredPercentage.truncateToDouble() == requiredPercentage ? 0 : 1);

    if (currentPct >= requiredPercentage) {
      final safe = safeBunks(attended, total, requiredPercentage);
      if (safe > 0) {
        return 'Chill out! You can safely bunk $safe more class${safe == 1 ? "" : "es"} without dropping below $targetStr%.';
      } else {
        return 'On the edge! You have 0 safe bunks. Missing your next class will put you below $targetStr%.';
      }
    } else {
      final recovery = recoveryClasses(attended, total, requiredPercentage);
      if (recovery == -1) {
        return 'Critical shortage! Mathematically impossible to reach 100% after missing a lecture.';
      }
      return 'Shortage Alert! You must attend the next $recovery class${recovery == 1 ? "" : "es"} consecutively to reach $targetStr%.';
    }
  }
}
