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

abstract class QuizQuestion
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  QuizQuestion._({
    this.id,
    required this.subject,
    required this.topic,
    required this.difficulty,
    required this.questionText,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOptionIndex,
    required this.explanation,
    required this.textHash,
    required this.usageCount,
    required this.createdAt,
  });

  factory QuizQuestion({
    int? id,
    required String subject,
    required String topic,
    required String difficulty,
    required String questionText,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required int correctOptionIndex,
    required String explanation,
    required String textHash,
    required int usageCount,
    required DateTime createdAt,
  }) = _QuizQuestionImpl;

  factory QuizQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizQuestion(
      id: jsonSerialization['id'] as int?,
      subject: jsonSerialization['subject'] as String,
      topic: jsonSerialization['topic'] as String,
      difficulty: jsonSerialization['difficulty'] as String,
      questionText: jsonSerialization['questionText'] as String,
      optionA: jsonSerialization['optionA'] as String,
      optionB: jsonSerialization['optionB'] as String,
      optionC: jsonSerialization['optionC'] as String,
      optionD: jsonSerialization['optionD'] as String,
      correctOptionIndex: jsonSerialization['correctOptionIndex'] as int,
      explanation: jsonSerialization['explanation'] as String,
      textHash: jsonSerialization['textHash'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String subject;

  String topic;

  String difficulty;

  String questionText;

  String optionA;

  String optionB;

  String optionC;

  String optionD;

  int correctOptionIndex;

  String explanation;

  String textHash;

  int usageCount;

  DateTime createdAt;

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  QuizQuestion copyWith({
    int? id,
    String? subject,
    String? topic,
    String? difficulty,
    String? questionText,
    String? optionA,
    String? optionB,
    String? optionC,
    String? optionD,
    int? correctOptionIndex,
    String? explanation,
    String? textHash,
    int? usageCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizQuestion',
      if (id != null) 'id': id,
      'subject': subject,
      'topic': topic,
      'difficulty': difficulty,
      'questionText': questionText,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
      'textHash': textHash,
      'usageCount': usageCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizQuestion',
      if (id != null) 'id': id,
      'subject': subject,
      'topic': topic,
      'difficulty': difficulty,
      'questionText': questionText,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
      'textHash': textHash,
      'usageCount': usageCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizQuestionImpl extends QuizQuestion {
  _QuizQuestionImpl({
    int? id,
    required String subject,
    required String topic,
    required String difficulty,
    required String questionText,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required int correctOptionIndex,
    required String explanation,
    required String textHash,
    required int usageCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          subject: subject,
          topic: topic,
          difficulty: difficulty,
          questionText: questionText,
          optionA: optionA,
          optionB: optionB,
          optionC: optionC,
          optionD: optionD,
          correctOptionIndex: correctOptionIndex,
          explanation: explanation,
          textHash: textHash,
          usageCount: usageCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  QuizQuestion copyWith({
    Object? id = _Undefined,
    String? subject,
    String? topic,
    String? difficulty,
    String? questionText,
    String? optionA,
    String? optionB,
    String? optionC,
    String? optionD,
    int? correctOptionIndex,
    String? explanation,
    String? textHash,
    int? usageCount,
    DateTime? createdAt,
  }) {
    return QuizQuestion(
      id: id is int? ? id : this.id,
      subject: subject ?? this.subject,
      topic: topic ?? this.topic,
      difficulty: difficulty ?? this.difficulty,
      questionText: questionText ?? this.questionText,
      optionA: optionA ?? this.optionA,
      optionB: optionB ?? this.optionB,
      optionC: optionC ?? this.optionC,
      optionD: optionD ?? this.optionD,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
      textHash: textHash ?? this.textHash,
      usageCount: usageCount ?? this.usageCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
