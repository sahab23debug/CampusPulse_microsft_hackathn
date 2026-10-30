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

abstract class QuizMatchPlayer
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  QuizMatchPlayer._({
    this.id,
    required this.matchId,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.score,
    required this.correctAnswersCount,
    required this.ratingBefore,
    this.ratingAfter,
    required this.isFinished,
  });

  factory QuizMatchPlayer({
    int? id,
    required int matchId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required int score,
    required int correctAnswersCount,
    required int ratingBefore,
    int? ratingAfter,
    required bool isFinished,
  }) = _QuizMatchPlayerImpl;

  factory QuizMatchPlayer.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizMatchPlayer(
      id: jsonSerialization['id'] as int?,
      matchId: jsonSerialization['matchId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      userAvatarUrl: jsonSerialization['userAvatarUrl'] as String?,
      score: jsonSerialization['score'] as int,
      correctAnswersCount: jsonSerialization['correctAnswersCount'] as int,
      ratingBefore: jsonSerialization['ratingBefore'] as int,
      ratingAfter: jsonSerialization['ratingAfter'] as int?,
      isFinished:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isFinished']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int matchId;

  int userId;

  String userName;

  String? userAvatarUrl;

  int score;

  int correctAnswersCount;

  int ratingBefore;

  int? ratingAfter;

  bool isFinished;

  /// Returns a shallow copy of this [QuizMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  QuizMatchPlayer copyWith({
    int? id,
    int? matchId,
    int? userId,
    String? userName,
    String? userAvatarUrl,
    int? score,
    int? correctAnswersCount,
    int? ratingBefore,
    int? ratingAfter,
    bool? isFinished,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizMatchPlayer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'score': score,
      'correctAnswersCount': correctAnswersCount,
      'ratingBefore': ratingBefore,
      if (ratingAfter != null) 'ratingAfter': ratingAfter,
      'isFinished': isFinished,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizMatchPlayer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'score': score,
      'correctAnswersCount': correctAnswersCount,
      'ratingBefore': ratingBefore,
      if (ratingAfter != null) 'ratingAfter': ratingAfter,
      'isFinished': isFinished,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizMatchPlayerImpl extends QuizMatchPlayer {
  _QuizMatchPlayerImpl({
    int? id,
    required int matchId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required int score,
    required int correctAnswersCount,
    required int ratingBefore,
    int? ratingAfter,
    required bool isFinished,
  }) : super._(
          id: id,
          matchId: matchId,
          userId: userId,
          userName: userName,
          userAvatarUrl: userAvatarUrl,
          score: score,
          correctAnswersCount: correctAnswersCount,
          ratingBefore: ratingBefore,
          ratingAfter: ratingAfter,
          isFinished: isFinished,
        );

  /// Returns a shallow copy of this [QuizMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  QuizMatchPlayer copyWith({
    Object? id = _Undefined,
    int? matchId,
    int? userId,
    String? userName,
    Object? userAvatarUrl = _Undefined,
    int? score,
    int? correctAnswersCount,
    int? ratingBefore,
    Object? ratingAfter = _Undefined,
    bool? isFinished,
  }) {
    return QuizMatchPlayer(
      id: id is int? ? id : this.id,
      matchId: matchId ?? this.matchId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatarUrl:
          userAvatarUrl is String? ? userAvatarUrl : this.userAvatarUrl,
      score: score ?? this.score,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      ratingBefore: ratingBefore ?? this.ratingBefore,
      ratingAfter: ratingAfter is int? ? ratingAfter : this.ratingAfter,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}
