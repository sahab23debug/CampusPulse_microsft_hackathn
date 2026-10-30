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

abstract class ResourceRating
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ResourceRating._({
    this.id,
    required this.resourceId,
    required this.userId,
    required this.userName,
    required this.rating,
    this.review,
    required this.createdAt,
  });

  factory ResourceRating({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    required int rating,
    String? review,
    required DateTime createdAt,
  }) = _ResourceRatingImpl;

  factory ResourceRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceRating(
      id: jsonSerialization['id'] as int?,
      resourceId: jsonSerialization['resourceId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      rating: jsonSerialization['rating'] as int,
      review: jsonSerialization['review'] as String?,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int resourceId;

  int userId;

  String userName;

  int rating;

  String? review;

  DateTime createdAt;

  /// Returns a shallow copy of this [ResourceRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ResourceRating copyWith({
    int? id,
    int? resourceId,
    int? userId,
    String? userName,
    int? rating,
    String? review,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceRating',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      'rating': rating,
      if (review != null) 'review': review,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceRating',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      'rating': rating,
      if (review != null) 'review': review,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceRatingImpl extends ResourceRating {
  _ResourceRatingImpl({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    required int rating,
    String? review,
    required DateTime createdAt,
  }) : super._(
          id: id,
          resourceId: resourceId,
          userId: userId,
          userName: userName,
          rating: rating,
          review: review,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ResourceRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ResourceRating copyWith({
    Object? id = _Undefined,
    int? resourceId,
    int? userId,
    String? userName,
    int? rating,
    Object? review = _Undefined,
    DateTime? createdAt,
  }) {
    return ResourceRating(
      id: id is int? ? id : this.id,
      resourceId: resourceId ?? this.resourceId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      rating: rating ?? this.rating,
      review: review is String? ? review : this.review,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
