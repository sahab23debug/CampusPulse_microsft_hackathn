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

abstract class Bookmark
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Bookmark._({
    this.id,
    required this.userId,
    required this.resourceType,
    required this.targetId,
    required this.title,
    this.subtitle,
    required this.createdAt,
  });

  factory Bookmark({
    int? id,
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
    required DateTime createdAt,
  }) = _BookmarkImpl;

  factory Bookmark.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bookmark(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      resourceType: jsonSerialization['resourceType'] as String,
      targetId: jsonSerialization['targetId'] as int,
      title: jsonSerialization['title'] as String,
      subtitle: jsonSerialization['subtitle'] as String?,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String resourceType;

  int targetId;

  String title;

  String? subtitle;

  DateTime createdAt;

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Bookmark copyWith({
    int? id,
    int? userId,
    String? resourceType,
    int? targetId,
    String? title,
    String? subtitle,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'resourceType': resourceType,
      'targetId': targetId,
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'resourceType': resourceType,
      'targetId': targetId,
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookmarkImpl extends Bookmark {
  _BookmarkImpl({
    int? id,
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          resourceType: resourceType,
          targetId: targetId,
          title: title,
          subtitle: subtitle,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Bookmark copyWith({
    Object? id = _Undefined,
    int? userId,
    String? resourceType,
    int? targetId,
    String? title,
    Object? subtitle = _Undefined,
    DateTime? createdAt,
  }) {
    return Bookmark(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      resourceType: resourceType ?? this.resourceType,
      targetId: targetId ?? this.targetId,
      title: title ?? this.title,
      subtitle: subtitle is String? ? subtitle : this.subtitle,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
