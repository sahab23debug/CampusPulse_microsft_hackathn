import 'package:test/test.dart';
import 'package:campuspulse_flutter/core/utils/bunk_math.dart';

void main() {
  group('BunkMath Calculations & Formula Verification', () {
    test('Standard safe bunks calculation: 20 attended out of 20 total, 75% required', () {
      // 20 / 0.75 - 20 = 26.666 - 20 = 6.666 -> floor = 6
      final bunks = BunkMath.safeBunks(20, 20, 75.0);
      expect(bunks, equals(6));
    });

    test('Standard safe bunks calculation: 15 attended out of 20 total, 75% required', () {
      // 15 / 0.75 - 20 = 20 - 20 = 0 -> exactly at 75%, safe bunks = 0
      final bunks = BunkMath.safeBunks(15, 20, 75.0);
      expect(bunks, equals(0));
    });

    test('Recovery classes calculation: 14 attended out of 20 total, 75% required (currently 70%)', () {
      // ceil((75 * 20 - 100 * 14) / (100 - 75)) = ceil((1500 - 1400) / 25) = ceil(100 / 25) = 4
      final recovery = BunkMath.recoveryClasses(14, 20, 75.0);
      expect(recovery, equals(4));

      // Verification: if attends 4 more classes, attended becomes 18, total becomes 24:
      // 18 / 24 = 0.75 (75.0%) -> recovered!
      final recoveredPct = BunkMath.currentPercentage(14 + recovery, 20 + recovery);
      expect(recoveredPct, greaterThanOrEqualTo(75.0));
    });

    test('Recovery classes when already above threshold returns 0', () {
      final recovery = BunkMath.recoveryClasses(18, 20, 75.0);
      expect(recovery, equals(0));
    });

    test('What-if slider calculation for bunking and attending', () {
      // 20 attended, 20 held. If bunks 5 more without projected total:
      // attended = 20, total = 25 -> 80%
      final pctBunk = BunkMath.whatIfPercentage(20, 20, 5);
      expect(pctBunk, closeTo(80.0, 0.01));

      // If attends 5 more classes:
      // attended = 25, total = 25 -> 100%
      final pctAttend = BunkMath.whatIfAttendPercentage(20, 20, 5);
      expect(pctAttend, closeTo(100.0, 0.01));

      // With projected semester total = 40 classes:
      // attended = 20, total = 40 -> 50%
      final pctProjected = BunkMath.whatIfPercentage(20, 20, 5, projectedSemesterTotal: 40);
      expect(pctProjected, closeTo(50.0, 0.01));
    });

    test('Next class impact calculation for present and absent', () {
      // 26 attended out of 30 held
      // If present: 27 / 31 = 87.096%
      final nextPresent = BunkMath.nextClassIfPresent(26, 30);
      expect(nextPresent, closeTo(87.1, 0.1));

      // If absent: 26 / 31 = 83.87%
      final nextAbsent = BunkMath.nextClassIfAbsent(26, 30);
      expect(nextAbsent, closeTo(83.87, 0.1));
    });

    test('Stress status message generates accurate human verdicts', () {
      // Safe scenario (20/20 at 75%)
      final safeMsg = BunkMath.stressStatusMessage(20, 20, 75.0);
      expect(safeMsg, contains('safely bunk 6 more classes'));

      // Borderline scenario (15/20 at 75%)
      final edgeMsg = BunkMath.stressStatusMessage(15, 20, 75.0);
      expect(edgeMsg, contains('0 safe bunks'));

      // Shortage scenario (14/20 at 75%)
      final shortageMsg = BunkMath.stressStatusMessage(14, 20, 75.0);
      expect(shortageMsg, contains('attend the next 4 classes consecutively'));
    });

    test('Edge case: total = 0 held classes', () {
      expect(BunkMath.currentPercentage(0, 0), equals(100.0));
      expect(BunkMath.safeBunks(0, 0, 75.0), equals(0));
      expect(BunkMath.recoveryClasses(0, 0, 75.0), equals(0));
      expect(BunkMath.statusColor(0, 0, 75.0), equals('green'));
    });

    test('Edge case: required = 100%', () {
      // 19 attended out of 20 total. Missed 1 class.
      // Safe bunks should be 0
      expect(BunkMath.safeBunks(19, 20, 100.0), equals(0));
      // Recovery is impossible because you can never reach 100% after missing a class
      expect(BunkMath.recoveryClasses(19, 20, 100.0), equals(-1));
      // Color should be red
      expect(BunkMath.statusColor(19, 20, 100.0), equals('red'));
    });

    test('Color status thresholds: green, amber, red', () {
      // 10/20 is 50% (< 75%) -> red
      expect(BunkMath.statusColor(10, 20, 75.0), equals('red'));

      // 15/20 is 75% (= 75%, 0 safe bunks) -> amber
      expect(BunkMath.statusColor(15, 20, 75.0), equals('amber'));

      // 28/30 is 93.3% (> 75%, many safe bunks) -> green
      expect(BunkMath.statusColor(28, 30, 75.0), equals('green'));
    });
  });
}
