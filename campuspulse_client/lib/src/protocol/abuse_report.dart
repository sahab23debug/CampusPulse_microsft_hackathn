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

abstract class AbuseReport
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AbuseReport._({
    this.id,
    required this.reporterUserId,
    required this.reporterUserName,
    required this.targetType,
    required this.targetId,
    required this.reason,
    required this.status,
    required this.createdAt,
  });

  factory AbuseReport({
    int? id,
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
    required String status,
    required DateTime createdAt,
  }) = _AbuseReportImpl;

  factory AbuseReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return AbuseReport(
      id: jsonSerialization['id'] as int?,
      reporterUserId: jsonSerialization['reporterUserId'] as int,
      reporterUserName: jsonSerialization['reporterUserName'] as String,
      targetType: jsonSerialization['targetType'] as String,
      targetId: jsonSerialization['targetId'] as int,
      reason: jsonSerialization['reason'] as String,
      status: jsonSerialization['status'] as String,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int reporterUserId;

  String reporterUserName;

  String targetType;

  int targetId;

  String reason;

  String status;

  DateTime createdAt;

  /// Returns a shallow copy of this [AbuseReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AbuseReport copyWith({
    int? id,
    int? reporterUserId,
    String? reporterUserName,
    String? targetType,
    int? targetId,
    String? reason,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AbuseReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'reporterUserName': reporterUserName,
      'targetType': targetType,
      'targetId': targetId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AbuseReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'reporterUserName': reporterUserName,
      'targetType': targetType,
      'targetId': targetId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AbuseReportImpl extends AbuseReport {
  _AbuseReportImpl({
    int? id,
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
    required String status,
    required DateTime createdAt,
  }) : super._(
          id: id,
          reporterUserId: reporterUserId,
          reporterUserName: reporterUserName,
          targetType: targetType,
          targetId: targetId,
          reason: reason,
          status: status,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [AbuseReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AbuseReport copyWith({
    Object? id = _Undefined,
    int? reporterUserId,
    String? reporterUserName,
    String? targetType,
    int? targetId,
    String? reason,
    String? status,
    DateTime? createdAt,
  }) {
    return AbuseReport(
      id: id is int? ? id : this.id,
      reporterUserId: reporterUserId ?? this.reporterUserId,
      reporterUserName: reporterUserName ?? this.reporterUserName,
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
