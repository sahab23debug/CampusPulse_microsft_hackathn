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

abstract class ResourceFollow
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ResourceFollow._({
    this.id,
    required this.resourceId,
    required this.userId,
    required this.createdAt,
  });

  factory ResourceFollow({
    int? id,
    required int resourceId,
    required int userId,
    required DateTime createdAt,
  }) = _ResourceFollowImpl;

  factory ResourceFollow.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceFollow(
      id: jsonSerialization['id'] as int?,
      resourceId: jsonSerialization['resourceId'] as int,
      userId: jsonSerialization['userId'] as int,
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

  DateTime createdAt;

  /// Returns a shallow copy of this [ResourceFollow]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ResourceFollow copyWith({
    int? id,
    int? resourceId,
    int? userId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceFollow',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceFollow',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceFollowImpl extends ResourceFollow {
  _ResourceFollowImpl({
    int? id,
    required int resourceId,
    required int userId,
    required DateTime createdAt,
  }) : super._(
          id: id,
          resourceId: resourceId,
          userId: userId,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ResourceFollow]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ResourceFollow copyWith({
    Object? id = _Undefined,
    int? resourceId,
    int? userId,
    DateTime? createdAt,
  }) {
    return ResourceFollow(
      id: id is int? ? id : this.id,
      resourceId: resourceId ?? this.resourceId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
