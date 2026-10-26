import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Serverpod Endpoint powering the real-time Multiplayer Quiz Game (Course Trivia Arena).
/// Supports live synchronous duels between study buddies or automated AI practice bots.
class QuizArenaEndpoint extends Endpoint {
  static final List<QuizQuestion> _questionBank = [
    QuizQuestion(
      questionId: 'q1',
      course: 'CS 189: Intro to Machine Learning',
      topic: 'Convex Optimization & Loss Functions',
      prompt: 'Which loss function is minimized in standard Linear Support Vector Machines (SVMs)?',
      options: ['Hinge Loss', 'Mean Squared Error', 'Cross-Entropy Loss', '0-1 Loss'],
      correctIndex: 0,
      explanation: 'SVMs minimize the soft-margin Hinge Loss max(0, 1 - y * w^T x) plus L2 regularization on weights.',
      difficulty: 'Medium',
      timeLimitSec: 15,
    ),
    QuizQuestion(
      questionId: 'q2',
      course: 'CS 162: Operating Systems',
      topic: 'Concurrency & Deadlocks',
      prompt: 'Which of the following is NOT one of the four Coffman conditions necessary for deadlock?',
      options: ['Mutual Exclusion', 'Hold and Wait', 'Preemption Allowed', 'Circular Wait'],
      correctIndex: 2,
      explanation: 'The Coffman condition is "No Preemption". If preemption is allowed, deadlocks cannot persist.',
      difficulty: 'Hard',
      timeLimitSec: 15,
    ),
    QuizQuestion(
      questionId: 'q3',
      course: 'MATH 53: Multivariable Calculus',
      topic: 'Vector Calculus Theorems',
      prompt: 'Stokes\' Theorem equates a surface integral of curl F over surface S with a line integral around its boundary curve C. What must be true about S?',
      options: ['S must be closed', 'S must be smooth and orientable with boundary C', 'S must be planar', 'F must have divergence zero'],
      correctIndex: 1,
      explanation: 'Stokes\' Theorem applies to any piecewise smooth, oriented surface bounded by a closed curve C with consistent orientation.',
      difficulty: 'Medium',
      timeLimitSec: 15,
    ),
    QuizQuestion(
      questionId: 'q4',
      course: 'DATA 100: Principles of Data Science',
      topic: 'Bias-Variance Tradeoff',
      prompt: 'Increasing the regularization parameter lambda in Ridge Regression generally leads to what change?',
      options: ['Higher Variance, Lower Bias', 'Higher Bias, Lower Variance', 'Higher Bias, Higher Variance', 'Zero change in bias or variance'],
      correctIndex: 1,
      explanation: 'Increasing regularization shrinks model weights toward zero, reducing model complexity (lower variance) at the cost of higher bias.',
      difficulty: 'Easy',
      timeLimitSec: 15,
    ),
    QuizQuestion(
      questionId: 'q5',
      course: 'Campus Lore & Hackathon Culture',
      topic: 'University Traditions',
      prompt: 'Which Berkeley library features 24-hour study spaces with subterranean floors known as Level C and Main Stacks?',
      options: ['Doe & Moffitt Library', 'Bancroft Library', 'Engineering Library (Bechtel)', 'Kresge Physical Sciences'],
      correctIndex: 0,
      explanation: 'Moffitt and the Gardner (Main) Stacks beneath Doe Memorial Library are the definitive late-night cram hubs.',
      difficulty: 'Easy',
      timeLimitSec: 15,
    ),
  ];

  /// Get question deck for a course or general campus arena.
  Future<List<QuizQuestion>> getQuizDeck(Session session, {String? course}) async {
    session.log('QuizArenaEndpoint: Fetching question deck for course=$course');
    if (course != null && course.isNotEmpty && course != 'All') {
      final filtered = _questionBank.where((q) => q.course.contains(course)).toList();
      if (filtered.isNotEmpty) return filtered;
    }
    return _questionBank;
  }

  /// Create a multiplayer duel room and invite a study buddy.
  Future<QuizSession> createDuelRoom(
    Session session, {
    required String hostUserId,
    required String challengerUserId,
    required String course,
  }) async {
    final roomId = 'room_${DateTime.now().millisecondsSinceEpoch}';
    session.log('QuizArenaEndpoint: Created duel room $roomId between $hostUserId and $challengerUserId');

    final quizSession = QuizSession(
      sessionId: 'sess_${DateTime.now().millisecondsSinceEpoch}',
      roomId: roomId,
      course: course,
      players: [hostUserId, challengerUserId],
      currentQuestionIndex: 0,
      scores: {hostUserId: 0, challengerUserId: 0},
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    // Notify challenger via Serverpod streaming WebSocket
    session.messages.postMessage('user_channel_$challengerUserId', {
      'type': 'quiz_challenge',
      'roomId': roomId,
      'hostUserId': hostUserId,
      'course': course,
    });

    return quizSession;
  }

  /// Submit answer and stream score update to both players.
  Future<Map<String, dynamic>> submitAnswer(
    Session session, {
    required String roomId,
    required String userId,
    required String questionId,
    required int selectedIndex,
    required int remainingTimeSec,
  }) async {
    final question = _questionBank.firstWhere(
      (q) => q.questionId == questionId,
      orElse: () => _questionBank[0],
    );

    final isCorrect = selectedIndex == question.correctIndex;
    final points = isCorrect ? (100 + (remainingTimeSec * 10)) : 0;

    session.log('Quiz submission in $roomId by $userId: correct=$isCorrect, points=$points');

    session.messages.postMessage('quiz_room_$roomId', {
      'type': 'score_update',
      'userId': userId,
      'pointsAwarded': points,
      'isCorrect': isCorrect,
      'explanation': question.explanation,
    });

    return {
      'isCorrect': isCorrect,
      'pointsAwarded': points,
      'correctIndex': question.correctIndex,
      'explanation': question.explanation,
    };
  }
}
