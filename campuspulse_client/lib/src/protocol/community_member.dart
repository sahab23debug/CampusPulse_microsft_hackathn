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

abstract class CommunityMember
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CommunityMember._({
    this.id,
    required this.communityId,
    required this.userId,
    required this.userName,
    required this.role,
    required this.joinedAt,
    required this.isApproved,
  });

  factory CommunityMember({
    int? id,
    required int communityId,
    required int userId,
    required String userName,
    required String role,
    required DateTime joinedAt,
    required bool isApproved,
  }) = _CommunityMemberImpl;

  factory CommunityMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityMember(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      role: jsonSerialization['role'] as String,
      joinedAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
      isApproved:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isApproved']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int communityId;

  int userId;

  String userName;

  String role;

  DateTime joinedAt;

  bool isApproved;

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CommunityMember copyWith({
    int? id,
    int? communityId,
    int? userId,
    String? userName,
    String? role,
    DateTime? joinedAt,
    bool? isApproved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'userId': userId,
      'userName': userName,
      'role': role,
      'joinedAt': joinedAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'userId': userId,
      'userName': userName,
      'role': role,
      'joinedAt': joinedAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityMemberImpl extends CommunityMember {
  _CommunityMemberImpl({
    int? id,
    required int communityId,
    required int userId,
    required String userName,
    required String role,
    required DateTime joinedAt,
    required bool isApproved,
  }) : super._(
          id: id,
          communityId: communityId,
          userId: userId,
          userName: userName,
          role: role,
          joinedAt: joinedAt,
          isApproved: isApproved,
        );

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CommunityMember copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? userId,
    String? userName,
    String? role,
    DateTime? joinedAt,
    bool? isApproved,
  }) {
    return CommunityMember(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
      isApproved: isApproved ?? this.isApproved,
    );
  }
}
