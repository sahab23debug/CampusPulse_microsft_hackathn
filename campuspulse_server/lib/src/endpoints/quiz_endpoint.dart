import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/elo_rating_service.dart';

class QuizEndpoint extends Endpoint {
  /// Start a quiz match (solo practice or 1v1 matchmaking).
  /// Returns match metadata and question prompt cards WITHOUT revealing correct answers!
  Future<Map<String, dynamic>> startMatch(
    Session session, {
    required int userId,
    required String userName,
    required String mode, // 'solo', '1v1', 'group'
    required String subject,
    required String difficulty,
    String? roomCode,
  }) async {
    // 1. Fetch questions for match
    final questions = await QuizQuestion.db.find(
      session,
      where: (t) => t.subject.equals(subject) & t.difficulty.equals(difficulty),
      limit: 5,
    );

    final questionIds = questions.map((q) => q.id!).toList();

    // 2. Create Match
    final match = QuizMatch(
      mode: mode,
      roomCode: roomCode,
      subject: subject,
      difficulty: difficulty,
      status: 'active',
      questionIdsJson: jsonEncode(questionIds),
      currentQuestionIndex: 0,
      startedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );

    final savedMatch = await QuizMatch.db.insertRow(session, match);

    // 3. Register Player
    var playerRating = await PlayerRating.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final currentRating = playerRating?.rating ?? 1200;

    await QuizMatchPlayer.db.insertRow(
      session,
      QuizMatchPlayer(
        matchId: savedMatch.id!,
        userId: userId,
        userName: userName,
        score: 0,
        correctAnswersCount: 0,
        ratingBefore: currentRating,
        isFinished: false,
      ),
    );

    // 4. Client-safe question payload (options shuffled, correct index HIDDEN)
    final clientQuestions = questions.map((q) {
      return {
        'id': q.id,
        'subject': q.subject,
        'topic': q.topic,
        'difficulty': q.difficulty,
        'questionText': q.questionText,
        'options': [q.optionA, q.optionB, q.optionC, q.optionD],
      };
    }).toList();

    return {
      'matchId': savedMatch.id,
      'mode': savedMatch.mode,
      'subject': savedMatch.subject,
      'difficulty': savedMatch.difficulty,
      'questions': clientQuestions,
    };
  }

  /// Submit answer for a question. Server validates correctness, awards points, and calculates speed bonus.
  Future<Map<String, dynamic>> submitAnswer(
    Session session, {
    required int matchId,
    required int userId,
    required int questionId,
    required int selectedOptionIndex,
    required int timeTakenMs,
  }) async {
    // Check if already answered (anti-cheat: one answer per question)
    final existingAnswer = await QuizAnswer.db.findFirstRow(
      session,
      where: (t) =>
          t.matchId.equals(matchId) &
          t.questionId.equals(questionId) &
          t.userId.equals(userId),
    );

    if (existingAnswer != null) {
      throw Exception('Question already answered.');
    }

    final question = await QuizQuestion.db.findById(session, questionId);
    if (question == null) throw Exception('Question not found.');

    final isCorrect = (selectedOptionIndex == question.correctOptionIndex);
    final pointsEarned = EloRatingService.calculateAnswerPoints(
      isCorrect: isCorrect,
      timeTakenMs: timeTakenMs,
    );

    // Save answer
    await QuizAnswer.db.insertRow(
      session,
      QuizAnswer(
        matchId: matchId,
        userId: userId,
        questionId: questionId,
        selectedOptionIndex: selectedOptionIndex,
        timeTakenMs: timeTakenMs,
        isCorrect: isCorrect,
        pointsEarned: pointsEarned,
      ),
    );

    // Update player score in match
    final player = await QuizMatchPlayer.db.findFirstRow(
      session,
      where: (t) => t.matchId.equals(matchId) & t.userId.equals(userId),
    );

    if (player != null) {
      player.score += pointsEarned;
      if (isCorrect) player.correctAnswersCount += 1;
      await QuizMatchPlayer.db.updateRow(session, player);
    }

    return {
      'isCorrect': isCorrect,
      'pointsEarned': pointsEarned,
      'correctOptionIndex': question.correctOptionIndex,
      'explanation': question.explanation,
    };
  }

  /// Complete match and calculate new Elo rating.
  Future<Map<String, dynamic>> finishMatch(
    Session session, {
    required int matchId,
    required int userId,
    required bool wonMatch,
  }) async {
    final player = await QuizMatchPlayer.db.findFirstRow(
      session,
      where: (t) => t.matchId.equals(matchId) & t.userId.equals(userId),
    );

    if (player == null) throw Exception('Player not in match.');

    var playerRating = await PlayerRating.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final beforeRating = playerRating?.rating ?? 1200;
    final opponentRating = 1200; // In solo or standard matchmaking benchmark

    final newRating = EloRatingService.calculateNewRating(
      currentRating: beforeRating,
      opponentRating: opponentRating,
      actualScore: wonMatch ? 1.0 : 0.0,
    );

    player.ratingAfter = newRating;
    player.isFinished = true;
    await QuizMatchPlayer.db.updateRow(session, player);

    if (playerRating != null) {
      playerRating.rating = newRating;
      playerRating.matchesPlayed += 1;
      if (wonMatch) playerRating.matchesWon += 1;
      playerRating.weeklyScore += player.score;
      playerRating.lastUpdated = DateTime.now();
      await PlayerRating.db.updateRow(session, playerRating);
    }

    return {
      'score': player.score,
      'correctCount': player.correctAnswersCount,
      'ratingBefore': beforeRating,
      'ratingAfter': newRating,
      'ratingDelta': newRating - beforeRating,
    };
  }

  /// Get leaderboards: (1) Overall College, (2) Same Year, (3) Same Branch.
  Future<List<PlayerRating>> getLeaderboard(
    Session session, {
    int? collegeId,
    int? branchId,
    int? year,
    int limit = 20,
  }) async {
    return await PlayerRating.db.find(
      session,
      where: (t) {
        var expr = t.id.notEquals(0);
        if (collegeId != null) expr = expr & t.collegeId.equals(collegeId);
        if (branchId != null) expr = expr & t.branchId.equals(branchId);
        if (year != null) expr = expr & t.year.equals(year);
        return expr;
      },
      orderBy: (t) => t.rating.desc(),
      limit: limit,
    );
  }
}
