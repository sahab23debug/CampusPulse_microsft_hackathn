import 'package:test/test.dart';
import '../lib/src/services/bunk_calculator.dart';
import '../lib/src/services/match_scorer.dart';
import '../lib/src/services/elo_rating_service.dart';

void main() {
  group('BunkCalculator Unit Tests', () {
    test('calculateSafeBunks for 75% requirement with 20/20 attended', () {
      expect(BunkCalculator.calculateSafeBunks(20, 20, 75.0), equals(6));
    });

    test('calculateRecoveryClasses for 70% attendance recovering to 75%', () {
      expect(BunkCalculator.calculateRecoveryClasses(14, 20, 75.0), equals(4));
    });

    test('Edge case total 0', () {
      expect(BunkCalculator.calculateCurrentPercentage(0, 0), equals(100.0));
      expect(BunkCalculator.calculateSafeBunks(0, 0, 75.0), equals(0));
      expect(BunkCalculator.calculateRecoveryClasses(0, 0, 75.0), equals(0));
    });

    test('Edge case required 100%', () {
      expect(BunkCalculator.calculateSafeBunks(19, 20, 100.0), equals(0));
      expect(BunkCalculator.calculateRecoveryClasses(19, 20, 100.0), equals(-1));
    });
  });

  group('MatchScorer Unit Tests', () {
    test('Calculates high score for matching skills, college and branch', () {
      final result = MatchScorer.computeScore(
        requiredSkills: ['Flutter', 'Dart'],
        preferredSkills: ['PostgreSQL'],
        userInterests: ['Hackathons', 'AI'],
        userCollege: 'IIT Delhi',
        userBranch: 'CSE',
        userYear: 3,
        candidateSkills: ['Flutter', 'Dart', 'PostgreSQL', 'Python'],
        candidateInterests: ['Hackathons', 'Gaming'],
        candidateCollege: 'IIT Delhi',
        candidateBranch: 'CSE',
        candidateYear: 3,
      );

      expect(result.matchPercentage, greaterThanOrEqualTo(85));
      expect(result.matchedSkills, containsAll(['Flutter', 'Dart', 'PostgreSQL']));
      expect(result.isSameCollege, isTrue);
    });

    test('Calculates low score for zero skill match and different college', () {
      final result = MatchScorer.computeScore(
        requiredSkills: ['Rust', 'Solidity'],
        preferredSkills: ['Blockchain'],
        userInterests: ['Web3'],
        userCollege: 'BITS Pilani',
        userBranch: 'EEE',
        userYear: 2,
        candidateSkills: ['Java', 'Spring'],
        candidateInterests: ['Cricket'],
        candidateCollege: 'VIT Vellore',
        candidateBranch: 'Mechanical',
        candidateYear: 4,
      );

      expect(result.matchPercentage, lessThan(20));
      expect(result.matchedSkills, isEmpty);
      expect(result.isSameCollege, isFalse);
    });
  });

  group('EloRatingService Unit Tests', () {
    test('Equal ratings result in 50% win probability', () {
      final expected = EloRatingService.expectedScore(1200, 1200);
      expect(expected, closeTo(0.5, 0.01));
    });

    test('Higher rating wins against lower rating gains fewer points', () {
      final newRating = EloRatingService.calculateNewRating(
        currentRating: 1500,
        opponentRating: 1200,
        actualScore: 1.0, // Win
      );
      // Winner gains around 5-7 points
      expect(newRating, greaterThan(1500));
      expect(newRating - 1500, lessThan(16));
    });

    test('Underdog win results in large rating gain', () {
      final newRating = EloRatingService.calculateNewRating(
        currentRating: 1200,
        opponentRating: 1500,
        actualScore: 1.0, // Win
      );
      // Underdog gains around 25-30 points
      expect(newRating - 1200, greaterThanOrEqualTo(25));
    });

    test('Speed bonus calculation', () {
      // Correct in 0ms earns 200 points
      expect(EloRatingService.calculateAnswerPoints(isCorrect: true, timeTakenMs: 0), equals(200));
      // Incorrect earns 0 points
      expect(EloRatingService.calculateAnswerPoints(isCorrect: false, timeTakenMs: 1000), equals(0));
      // Correct at limit earns base 100 points
      expect(EloRatingService.calculateAnswerPoints(isCorrect: true, timeTakenMs: 15000), equals(100));
    });
  });
}
