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
import 'package:campuspulse_client/src/protocol/protocol.dart' as _ios9a6x4;
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class Resource
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Resource._({
    this.id,
    required this.uploaderId,
    required this.uploaderName,
    this.uploaderSgpa,
    this.uploaderSemester,
    required this.title,
    required this.description,
    required this.subjectId,
    required this.subjectName,
    required this.semester,
    required this.branchId,
    required this.year,
    required this.resourceType,
    this.fileUrl,
    this.externalUrl,
    required this.tags,
    required this.viewsCount,
    required this.followCount,
    required this.averageRating,
    required this.ratingCount,
    required this.createdAt,
  });

  factory Resource({
    int? id,
    required int uploaderId,
    required String uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    required String title,
    required String description,
    required int subjectId,
    required String subjectName,
    required int semester,
    required int branchId,
    required int year,
    required String resourceType,
    String? fileUrl,
    String? externalUrl,
    required List<String> tags,
    required int viewsCount,
    required int followCount,
    required double averageRating,
    required int ratingCount,
    required DateTime createdAt,
  }) = _ResourceImpl;

  factory Resource.fromJson(Map<String, dynamic> jsonSerialization) {
    return Resource(
      id: jsonSerialization['id'] as int?,
      uploaderId: jsonSerialization['uploaderId'] as int,
      uploaderName: jsonSerialization['uploaderName'] as String,
      uploaderSgpa: (jsonSerialization['uploaderSgpa'] as num?)?.toDouble(),
      uploaderSemester: jsonSerialization['uploaderSemester'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      subjectId: jsonSerialization['subjectId'] as int,
      subjectName: jsonSerialization['subjectName'] as String,
      semester: jsonSerialization['semester'] as int,
      branchId: jsonSerialization['branchId'] as int,
      year: jsonSerialization['year'] as int,
      resourceType: jsonSerialization['resourceType'] as String,
      fileUrl: jsonSerialization['fileUrl'] as String?,
      externalUrl: jsonSerialization['externalUrl'] as String?,
      tags: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['tags']),
      viewsCount: jsonSerialization['viewsCount'] as int,
      followCount: jsonSerialization['followCount'] as int,
      averageRating: (jsonSerialization['averageRating'] as num).toDouble(),
      ratingCount: jsonSerialization['ratingCount'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int uploaderId;

  String uploaderName;

  double? uploaderSgpa;

  int? uploaderSemester;

  String title;

  String description;

  int subjectId;

  String subjectName;

  int semester;

  int branchId;

  int year;

  String resourceType;

  String? fileUrl;

  String? externalUrl;

  List<String> tags;

  int viewsCount;

  int followCount;

  double averageRating;

  int ratingCount;

  DateTime createdAt;

  /// Returns a shallow copy of this [Resource]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Resource copyWith({
    int? id,
    int? uploaderId,
    String? uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    String? title,
    String? description,
    int? subjectId,
    String? subjectName,
    int? semester,
    int? branchId,
    int? year,
    String? resourceType,
    String? fileUrl,
    String? externalUrl,
    List<String>? tags,
    int? viewsCount,
    int? followCount,
    double? averageRating,
    int? ratingCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Resource',
      if (id != null) 'id': id,
      'uploaderId': uploaderId,
      'uploaderName': uploaderName,
      if (uploaderSgpa != null) 'uploaderSgpa': uploaderSgpa,
      if (uploaderSemester != null) 'uploaderSemester': uploaderSemester,
      'title': title,
      'description': description,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'semester': semester,
      'branchId': branchId,
      'year': year,
      'resourceType': resourceType,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (externalUrl != null) 'externalUrl': externalUrl,
      'tags': tags.toJson(),
      'viewsCount': viewsCount,
      'followCount': followCount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Resource',
      if (id != null) 'id': id,
      'uploaderId': uploaderId,
      'uploaderName': uploaderName,
      if (uploaderSgpa != null) 'uploaderSgpa': uploaderSgpa,
      if (uploaderSemester != null) 'uploaderSemester': uploaderSemester,
      'title': title,
      'description': description,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'semester': semester,
      'branchId': branchId,
      'year': year,
      'resourceType': resourceType,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (externalUrl != null) 'externalUrl': externalUrl,
      'tags': tags.toJson(),
      'viewsCount': viewsCount,
      'followCount': followCount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceImpl extends Resource {
  _ResourceImpl({
    int? id,
    required int uploaderId,
    required String uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    required String title,
    required String description,
    required int subjectId,
    required String subjectName,
    required int semester,
    required int branchId,
    required int year,
    required String resourceType,
    String? fileUrl,
    String? externalUrl,
    required List<String> tags,
    required int viewsCount,
    required int followCount,
    required double averageRating,
    required int ratingCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uploaderId: uploaderId,
          uploaderName: uploaderName,
          uploaderSgpa: uploaderSgpa,
          uploaderSemester: uploaderSemester,
          title: title,
          description: description,
          subjectId: subjectId,
          subjectName: subjectName,
          semester: semester,
          branchId: branchId,
          year: year,
          resourceType: resourceType,
          fileUrl: fileUrl,
          externalUrl: externalUrl,
          tags: tags,
          viewsCount: viewsCount,
          followCount: followCount,
          averageRating: averageRating,
          ratingCount: ratingCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Resource]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Resource copyWith({
    Object? id = _Undefined,
    int? uploaderId,
    String? uploaderName,
    Object? uploaderSgpa = _Undefined,
    Object? uploaderSemester = _Undefined,
    String? title,
    String? description,
    int? subjectId,
    String? subjectName,
    int? semester,
    int? branchId,
    int? year,
    String? resourceType,
    Object? fileUrl = _Undefined,
    Object? externalUrl = _Undefined,
    List<String>? tags,
    int? viewsCount,
    int? followCount,
    double? averageRating,
    int? ratingCount,
    DateTime? createdAt,
  }) {
    return Resource(
      id: id is int? ? id : this.id,
      uploaderId: uploaderId ?? this.uploaderId,
      uploaderName: uploaderName ?? this.uploaderName,
      uploaderSgpa: uploaderSgpa is double? ? uploaderSgpa : this.uploaderSgpa,
      uploaderSemester:
          uploaderSemester is int? ? uploaderSemester : this.uploaderSemester,
      title: title ?? this.title,
      description: description ?? this.description,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      semester: semester ?? this.semester,
      branchId: branchId ?? this.branchId,
      year: year ?? this.year,
      resourceType: resourceType ?? this.resourceType,
      fileUrl: fileUrl is String? ? fileUrl : this.fileUrl,
      externalUrl: externalUrl is String? ? externalUrl : this.externalUrl,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      viewsCount: viewsCount ?? this.viewsCount,
      followCount: followCount ?? this.followCount,
      averageRating: averageRating ?? this.averageRating,
      ratingCount: ratingCount ?? this.ratingCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
