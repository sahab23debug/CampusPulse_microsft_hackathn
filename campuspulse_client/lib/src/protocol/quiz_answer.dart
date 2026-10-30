/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class QuizAnswer
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  QuizAnswer._({
    this.id,
    required this.matchId,
    required this.userId,
    required this.questionId,
    required this.selectedOptionIndex,
    required this.timeTakenMs,
    required this.isCorrect,
    required this.pointsEarned,
  });

  factory QuizAnswer({
    int? id,
    required int matchId,
    required int userId,
    required int questionId,
    required int selectedOptionIndex,
    required int timeTakenMs,
    required bool isCorrect,
    required int pointsEarned,
  }) = _QuizAnswerImpl;

  factory QuizAnswer.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizAnswer(
      id: jsonSerialization['id'] as int?,
      matchId: jsonSerialization['matchId'] as int,
      userId: jsonSerialization['userId'] as int,
      questionId: jsonSerialization['questionId'] as int,
      selectedOptionIndex: jsonSerialization['selectedOptionIndex'] as int,
      timeTakenMs: jsonSerialization['timeTakenMs'] as int,
      isCorrect:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isCorrect']),
      pointsEarned: jsonSerialization['pointsEarned'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int matchId;

  int userId;

  int questionId;

  int selectedOptionIndex;

  int timeTakenMs;

  bool isCorrect;

  int pointsEarned;

  /// Returns a shallow copy of this [QuizAnswer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  QuizAnswer copyWith({
    int? id,
    int? matchId,
    int? userId,
    int? questionId,
    int? selectedOptionIndex,
    int? timeTakenMs,
    bool? isCorrect,
    int? pointsEarned,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizAnswer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'questionId': questionId,
      'selectedOptionIndex': selectedOptionIndex,
      'timeTakenMs': timeTakenMs,
      'isCorrect': isCorrect,
      'pointsEarned': pointsEarned,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizAnswer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'questionId': questionId,
      'selectedOptionIndex': selectedOptionIndex,
      'timeTakenMs': timeTakenMs,
      'isCorrect': isCorrect,
      'pointsEarned': pointsEarned,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizAnswerImpl extends QuizAnswer {
  _QuizAnswerImpl({
    int? id,
    required int matchId,
    required int userId,
    required int questionId,
    required int selectedOptionIndex,
    required int timeTakenMs,
    required bool isCorrect,
    required int pointsEarned,
  }) : super._(
          id: id,
          matchId: matchId,
          userId: userId,
          questionId: questionId,
          selectedOptionIndex: selectedOptionIndex,
          timeTakenMs: timeTakenMs,
          isCorrect: isCorrect,
          pointsEarned: pointsEarned,
        );

  /// Returns a shallow copy of this [QuizAnswer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  QuizAnswer copyWith({
    Object? id = _Undefined,
    int? matchId,
    int? userId,
    int? questionId,
    int? selectedOptionIndex,
    int? timeTakenMs,
    bool? isCorrect,
    int? pointsEarned,
  }) {
    return QuizAnswer(
      id: id is int? ? id : this.id,
      matchId: matchId ?? this.matchId,
      userId: userId ?? this.userId,
      questionId: questionId ?? this.questionId,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      timeTakenMs: timeTakenMs ?? this.timeTakenMs,
      isCorrect: isCorrect ?? this.isCorrect,
      pointsEarned: pointsEarned ?? this.pointsEarned,
    );
  }
}
