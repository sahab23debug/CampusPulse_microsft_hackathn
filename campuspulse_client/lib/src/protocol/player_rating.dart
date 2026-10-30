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

abstract class PlayerRating
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PlayerRating._({
    this.id,
    required this.userId,
    required this.userName,
    required this.collegeId,
    required this.branchId,
    required this.year,
    required this.rating,
    required this.matchesPlayed,
    required this.matchesWon,
    required this.weeklyScore,
    required this.lastUpdated,
  });

  factory PlayerRating({
    int? id,
    required int userId,
    required String userName,
    required int collegeId,
    required int branchId,
    required int year,
    required int rating,
    required int matchesPlayed,
    required int matchesWon,
    required int weeklyScore,
    required DateTime lastUpdated,
  }) = _PlayerRatingImpl;

  factory PlayerRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerRating(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      collegeId: jsonSerialization['collegeId'] as int,
      branchId: jsonSerialization['branchId'] as int,
      year: jsonSerialization['year'] as int,
      rating: jsonSerialization['rating'] as int,
      matchesPlayed: jsonSerialization['matchesPlayed'] as int,
      matchesWon: jsonSerialization['matchesWon'] as int,
      weeklyScore: jsonSerialization['weeklyScore'] as int,
      lastUpdated:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['lastUpdated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String userName;

  int collegeId;

  int branchId;

  int year;

  int rating;

  int matchesPlayed;

  int matchesWon;

  int weeklyScore;

  DateTime lastUpdated;

  /// Returns a shallow copy of this [PlayerRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PlayerRating copyWith({
    int? id,
    int? userId,
    String? userName,
    int? collegeId,
    int? branchId,
    int? year,
    int? rating,
    int? matchesPlayed,
    int? matchesWon,
    int? weeklyScore,
    DateTime? lastUpdated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerRating',
      if (id != null) 'id': id,
      'userId': userId,
      'userName': userName,
      'collegeId': collegeId,
      'branchId': branchId,
      'year': year,
      'rating': rating,
      'matchesPlayed': matchesPlayed,
      'matchesWon': matchesWon,
      'weeklyScore': weeklyScore,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerRating',
      if (id != null) 'id': id,
      'userId': userId,
      'userName': userName,
      'collegeId': collegeId,
      'branchId': branchId,
      'year': year,
      'rating': rating,
      'matchesPlayed': matchesPlayed,
      'matchesWon': matchesWon,
      'weeklyScore': weeklyScore,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerRatingImpl extends PlayerRating {
  _PlayerRatingImpl({
    int? id,
    required int userId,
    required String userName,
    required int collegeId,
    required int branchId,
    required int year,
    required int rating,
    required int matchesPlayed,
    required int matchesWon,
    required int weeklyScore,
    required DateTime lastUpdated,
  }) : super._(
          id: id,
          userId: userId,
          userName: userName,
          collegeId: collegeId,
          branchId: branchId,
          year: year,
          rating: rating,
          matchesPlayed: matchesPlayed,
          matchesWon: matchesWon,
          weeklyScore: weeklyScore,
          lastUpdated: lastUpdated,
        );

  /// Returns a shallow copy of this [PlayerRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PlayerRating copyWith({
    Object? id = _Undefined,
    int? userId,
    String? userName,
    int? collegeId,
    int? branchId,
    int? year,
    int? rating,
    int? matchesPlayed,
    int? matchesWon,
    int? weeklyScore,
    DateTime? lastUpdated,
  }) {
    return PlayerRating(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      collegeId: collegeId ?? this.collegeId,
      branchId: branchId ?? this.branchId,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      matchesPlayed: matchesPlayed ?? this.matchesPlayed,
      matchesWon: matchesWon ?? this.matchesWon,
      weeklyScore: weeklyScore ?? this.weeklyScore,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
