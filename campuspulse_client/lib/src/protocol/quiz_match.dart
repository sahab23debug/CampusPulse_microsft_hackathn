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

abstract class QuizMatch
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  QuizMatch._({
    this.id,
    required this.mode,
    this.roomCode,
    required this.subject,
    required this.difficulty,
    required this.status,
    required this.questionIdsJson,
    required this.currentQuestionIndex,
    this.startedAt,
    this.endedAt,
    required this.createdAt,
  });

  factory QuizMatch({
    int? id,
    required String mode,
    String? roomCode,
    required String subject,
    required String difficulty,
    required String status,
    required String questionIdsJson,
    required int currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
  }) = _QuizMatchImpl;

  factory QuizMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizMatch(
      id: jsonSerialization['id'] as int?,
      mode: jsonSerialization['mode'] as String,
      roomCode: jsonSerialization['roomCode'] as String?,
      subject: jsonSerialization['subject'] as String,
      difficulty: jsonSerialization['difficulty'] as String,
      status: jsonSerialization['status'] as String,
      questionIdsJson: jsonSerialization['questionIdsJson'] as String,
      currentQuestionIndex: jsonSerialization['currentQuestionIndex'] as int,
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      endedAt: jsonSerialization['endedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['endedAt']),
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String mode;

  String? roomCode;

  String subject;

  String difficulty;

  String status;

  String questionIdsJson;

  int currentQuestionIndex;

  DateTime? startedAt;

  DateTime? endedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [QuizMatch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  QuizMatch copyWith({
    int? id,
    String? mode,
    String? roomCode,
    String? subject,
    String? difficulty,
    String? status,
    String? questionIdsJson,
    int? currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizMatch',
      if (id != null) 'id': id,
      'mode': mode,
      if (roomCode != null) 'roomCode': roomCode,
      'subject': subject,
      'difficulty': difficulty,
      'status': status,
      'questionIdsJson': questionIdsJson,
      'currentQuestionIndex': currentQuestionIndex,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endedAt != null) 'endedAt': endedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizMatch',
      if (id != null) 'id': id,
      'mode': mode,
      if (roomCode != null) 'roomCode': roomCode,
      'subject': subject,
      'difficulty': difficulty,
      'status': status,
      'questionIdsJson': questionIdsJson,
      'currentQuestionIndex': currentQuestionIndex,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endedAt != null) 'endedAt': endedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizMatchImpl extends QuizMatch {
  _QuizMatchImpl({
    int? id,
    required String mode,
    String? roomCode,
    required String subject,
    required String difficulty,
    required String status,
    required String questionIdsJson,
    required int currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
  }) : super._(
          id: id,
          mode: mode,
          roomCode: roomCode,
          subject: subject,
          difficulty: difficulty,
          status: status,
          questionIdsJson: questionIdsJson,
          currentQuestionIndex: currentQuestionIndex,
          startedAt: startedAt,
          endedAt: endedAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [QuizMatch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  QuizMatch copyWith({
    Object? id = _Undefined,
    String? mode,
    Object? roomCode = _Undefined,
    String? subject,
    String? difficulty,
    String? status,
    String? questionIdsJson,
    int? currentQuestionIndex,
    Object? startedAt = _Undefined,
    Object? endedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return QuizMatch(
      id: id is int? ? id : this.id,
      mode: mode ?? this.mode,
      roomCode: roomCode is String? ? roomCode : this.roomCode,
      subject: subject ?? this.subject,
      difficulty: difficulty ?? this.difficulty,
      status: status ?? this.status,
      questionIdsJson: questionIdsJson ?? this.questionIdsJson,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      endedAt: endedAt is DateTime? ? endedAt : this.endedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
