import 'dart:math' as math;

/// Elo rating calculations and speed-based score calculation for Quiz Arena battles.
class EloRatingService {
  static const int kFactor = 32;

  /// Expected outcome of player A playing against player B:
  /// E_A = 1 / (1 + 10^((Rating_B - Rating_A) / 400))
  static double expectedScore(int ratingA, int ratingB) {
    return 1.0 / (1.0 + math.pow(10.0, (ratingB - ratingA) / 400.0));
  }

  /// Calculates new rating after a match.
  /// [actualScore]: 1.0 for win, 0.5 for draw, 0.0 for loss.
  static int calculateNewRating({
    required int currentRating,
    required int opponentRating,
    required double actualScore,
  }) {
    final expected = expectedScore(currentRating, opponentRating);
    final delta = (kFactor * (actualScore - expected)).round();
    final newRating = currentRating + delta;
    return math.max(100, newRating); // Minimum rating floor of 100
  }

  /// Calculates points earned for an answer based on correctness and speed.
  /// Base points: 100
  /// Speed bonus: up to 100 points if answered within allocated seconds (e.g. 15 seconds).
  static int calculateAnswerPoints({
    required bool isCorrect,
    required int timeTakenMs,
    int maxTimeMs = 15000,
  }) {
    if (!isCorrect) return 0;
    if (timeTakenMs < 0) timeTakenMs = 0;
    if (timeTakenMs >= maxTimeMs) return 100;

    final remainingFraction = (maxTimeMs - timeTakenMs) / maxTimeMs;
    final speedBonus = (remainingFraction * 100).round();
    return 100 + speedBonus;
  }
}
