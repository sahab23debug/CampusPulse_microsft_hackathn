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

abstract class Community
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Community._({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    this.iconUrl,
    required this.creatorUserId,
    this.collegeId,
    required this.isPrivate,
    required this.memberCount,
    required this.createdAt,
  });

  factory Community({
    int? id,
    required String name,
    required String description,
    required String category,
    String? iconUrl,
    required int creatorUserId,
    int? collegeId,
    required bool isPrivate,
    required int memberCount,
    required DateTime createdAt,
  }) = _CommunityImpl;

  factory Community.fromJson(Map<String, dynamic> jsonSerialization) {
    return Community(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      collegeId: jsonSerialization['collegeId'] as int?,
      isPrivate:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isPrivate']),
      memberCount: jsonSerialization['memberCount'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  String category;

  String? iconUrl;

  int creatorUserId;

  int? collegeId;

  bool isPrivate;

  int memberCount;

  DateTime createdAt;

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Community copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? iconUrl,
    int? creatorUserId,
    int? collegeId,
    bool? isPrivate,
    int? memberCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'creatorUserId': creatorUserId,
      if (collegeId != null) 'collegeId': collegeId,
      'isPrivate': isPrivate,
      'memberCount': memberCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'creatorUserId': creatorUserId,
      if (collegeId != null) 'collegeId': collegeId,
      'isPrivate': isPrivate,
      'memberCount': memberCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityImpl extends Community {
  _CommunityImpl({
    int? id,
    required String name,
    required String description,
    required String category,
    String? iconUrl,
    required int creatorUserId,
    int? collegeId,
    required bool isPrivate,
    required int memberCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          category: category,
          iconUrl: iconUrl,
          creatorUserId: creatorUserId,
          collegeId: collegeId,
          isPrivate: isPrivate,
          memberCount: memberCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Community copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? category,
    Object? iconUrl = _Undefined,
    int? creatorUserId,
    Object? collegeId = _Undefined,
    bool? isPrivate,
    int? memberCount,
    DateTime? createdAt,
  }) {
    return Community(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      collegeId: collegeId is int? ? collegeId : this.collegeId,
      isPrivate: isPrivate ?? this.isPrivate,
      memberCount: memberCount ?? this.memberCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
