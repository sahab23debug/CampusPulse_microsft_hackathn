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

abstract class ResourceComment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ResourceComment._({
    this.id,
    required this.resourceId,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.content,
    required this.createdAt,
    required this.isReported,
  });

  factory ResourceComment({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
    required DateTime createdAt,
    required bool isReported,
  }) = _ResourceCommentImpl;

  factory ResourceComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceComment(
      id: jsonSerialization['id'] as int?,
      resourceId: jsonSerialization['resourceId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      userAvatarUrl: jsonSerialization['userAvatarUrl'] as String?,
      content: jsonSerialization['content'] as String,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isReported:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isReported']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int resourceId;

  int userId;

  String userName;

  String? userAvatarUrl;

  String content;

  DateTime createdAt;

  bool isReported;

  /// Returns a shallow copy of this [ResourceComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ResourceComment copyWith({
    int? id,
    int? resourceId,
    int? userId,
    String? userName,
    String? userAvatarUrl,
    String? content,
    DateTime? createdAt,
    bool? isReported,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceComment',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isReported': isReported,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceComment',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isReported': isReported,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceCommentImpl extends ResourceComment {
  _ResourceCommentImpl({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
    required DateTime createdAt,
    required bool isReported,
  }) : super._(
          id: id,
          resourceId: resourceId,
          userId: userId,
          userName: userName,
          userAvatarUrl: userAvatarUrl,
          content: content,
          createdAt: createdAt,
          isReported: isReported,
        );

  /// Returns a shallow copy of this [ResourceComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ResourceComment copyWith({
    Object? id = _Undefined,
    int? resourceId,
    int? userId,
    String? userName,
    Object? userAvatarUrl = _Undefined,
    String? content,
    DateTime? createdAt,
    bool? isReported,
  }) {
    return ResourceComment(
      id: id is int? ? id : this.id,
      resourceId: resourceId ?? this.resourceId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatarUrl:
          userAvatarUrl is String? ? userAvatarUrl : this.userAvatarUrl,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isReported: isReported ?? this.isReported,
    );
  }
}
