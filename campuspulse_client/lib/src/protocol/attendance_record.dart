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

abstract class AttendanceRecord
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AttendanceRecord._({
    this.id,
    required this.userId,
    required this.subjectId,
    required this.subjectName,
    required this.subjectCode,
    required this.classesAttended,
    required this.totalClassesHeld,
    required this.requiredPercentage,
    this.plannedTotalClasses,
    required this.lastUpdated,
  });

  factory AttendanceRecord({
    int? id,
    required int userId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required int classesAttended,
    required int totalClassesHeld,
    required double requiredPercentage,
    int? plannedTotalClasses,
    required DateTime lastUpdated,
  }) = _AttendanceRecordImpl;

  factory AttendanceRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return AttendanceRecord(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      subjectId: jsonSerialization['subjectId'] as int,
      subjectName: jsonSerialization['subjectName'] as String,
      subjectCode: jsonSerialization['subjectCode'] as String,
      classesAttended: jsonSerialization['classesAttended'] as int,
      totalClassesHeld: jsonSerialization['totalClassesHeld'] as int,
      requiredPercentage:
          (jsonSerialization['requiredPercentage'] as num).toDouble(),
      plannedTotalClasses: jsonSerialization['plannedTotalClasses'] as int?,
      lastUpdated:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['lastUpdated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int subjectId;

  String subjectName;

  String subjectCode;

  int classesAttended;

  int totalClassesHeld;

  double requiredPercentage;

  int? plannedTotalClasses;

  DateTime lastUpdated;

  /// Returns a shallow copy of this [AttendanceRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AttendanceRecord copyWith({
    int? id,
    int? userId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    int? classesAttended,
    int? totalClassesHeld,
    double? requiredPercentage,
    int? plannedTotalClasses,
    DateTime? lastUpdated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AttendanceRecord',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'classesAttended': classesAttended,
      'totalClassesHeld': totalClassesHeld,
      'requiredPercentage': requiredPercentage,
      if (plannedTotalClasses != null)
        'plannedTotalClasses': plannedTotalClasses,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AttendanceRecord',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'classesAttended': classesAttended,
      'totalClassesHeld': totalClassesHeld,
      'requiredPercentage': requiredPercentage,
      if (plannedTotalClasses != null)
        'plannedTotalClasses': plannedTotalClasses,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AttendanceRecordImpl extends AttendanceRecord {
  _AttendanceRecordImpl({
    int? id,
    required int userId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required int classesAttended,
    required int totalClassesHeld,
    required double requiredPercentage,
    int? plannedTotalClasses,
    required DateTime lastUpdated,
  }) : super._(
          id: id,
          userId: userId,
          subjectId: subjectId,
          subjectName: subjectName,
          subjectCode: subjectCode,
          classesAttended: classesAttended,
          totalClassesHeld: totalClassesHeld,
          requiredPercentage: requiredPercentage,
          plannedTotalClasses: plannedTotalClasses,
          lastUpdated: lastUpdated,
        );

  /// Returns a shallow copy of this [AttendanceRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AttendanceRecord copyWith({
    Object? id = _Undefined,
    int? userId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    int? classesAttended,
    int? totalClassesHeld,
    double? requiredPercentage,
    Object? plannedTotalClasses = _Undefined,
    DateTime? lastUpdated,
  }) {
    return AttendanceRecord(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      subjectCode: subjectCode ?? this.subjectCode,
      classesAttended: classesAttended ?? this.classesAttended,
      totalClassesHeld: totalClassesHeld ?? this.totalClassesHeld,
      requiredPercentage: requiredPercentage ?? this.requiredPercentage,
      plannedTotalClasses: plannedTotalClasses is int?
          ? plannedTotalClasses
          : this.plannedTotalClasses,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
