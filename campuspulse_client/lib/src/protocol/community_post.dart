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

abstract class CommunityPost
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CommunityPost._({
    this.id,
    required this.communityId,
    required this.authorId,
    required this.authorName,
    this.authorAvatarUrl,
    required this.content,
    this.imageUrl,
    required this.isAnnouncement,
    required this.isPinned,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
  });

  factory CommunityPost({
    int? id,
    required int communityId,
    required int authorId,
    required String authorName,
    String? authorAvatarUrl,
    required String content,
    String? imageUrl,
    required bool isAnnouncement,
    required bool isPinned,
    required int likeCount,
    required int commentCount,
    required DateTime createdAt,
  }) = _CommunityPostImpl;

  factory CommunityPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityPost(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      authorId: jsonSerialization['authorId'] as int,
      authorName: jsonSerialization['authorName'] as String,
      authorAvatarUrl: jsonSerialization['authorAvatarUrl'] as String?,
      content: jsonSerialization['content'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      isAnnouncement:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isAnnouncement']),
      isPinned: _isc.BoolJsonExtension.fromJson(jsonSerialization['isPinned']),
      likeCount: jsonSerialization['likeCount'] as int,
      commentCount: jsonSerialization['commentCount'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int communityId;

  int authorId;

  String authorName;

  String? authorAvatarUrl;

  String content;

  String? imageUrl;

  bool isAnnouncement;

  bool isPinned;

  int likeCount;

  int commentCount;

  DateTime createdAt;

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CommunityPost copyWith({
    int? id,
    int? communityId,
    int? authorId,
    String? authorName,
    String? authorAvatarUrl,
    String? content,
    String? imageUrl,
    bool? isAnnouncement,
    bool? isPinned,
    int? likeCount,
    int? commentCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorId': authorId,
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isAnnouncement': isAnnouncement,
      'isPinned': isPinned,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorId': authorId,
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isAnnouncement': isAnnouncement,
      'isPinned': isPinned,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityPostImpl extends CommunityPost {
  _CommunityPostImpl({
    int? id,
    required int communityId,
    required int authorId,
    required String authorName,
    String? authorAvatarUrl,
    required String content,
    String? imageUrl,
    required bool isAnnouncement,
    required bool isPinned,
    required int likeCount,
    required int commentCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          communityId: communityId,
          authorId: authorId,
          authorName: authorName,
          authorAvatarUrl: authorAvatarUrl,
          content: content,
          imageUrl: imageUrl,
          isAnnouncement: isAnnouncement,
          isPinned: isPinned,
          likeCount: likeCount,
          commentCount: commentCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CommunityPost copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? authorId,
    String? authorName,
    Object? authorAvatarUrl = _Undefined,
    String? content,
    Object? imageUrl = _Undefined,
    bool? isAnnouncement,
    bool? isPinned,
    int? likeCount,
    int? commentCount,
    DateTime? createdAt,
  }) {
    return CommunityPost(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorAvatarUrl:
          authorAvatarUrl is String? ? authorAvatarUrl : this.authorAvatarUrl,
      content: content ?? this.content,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      isAnnouncement: isAnnouncement ?? this.isAnnouncement,
      isPinned: isPinned ?? this.isPinned,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
