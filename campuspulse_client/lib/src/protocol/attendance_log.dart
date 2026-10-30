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

abstract class AttendanceLog
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AttendanceLog._({
    this.id,
    required this.userId,
    required this.subjectId,
    required this.date,
    required this.status,
    required this.source,
  });

  factory AttendanceLog({
    int? id,
    required int userId,
    required int subjectId,
    required DateTime date,
    required String status,
    required String source,
  }) = _AttendanceLogImpl;

  factory AttendanceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return AttendanceLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      subjectId: jsonSerialization['subjectId'] as int,
      date: _isc.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      status: jsonSerialization['status'] as String,
      source: jsonSerialization['source'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int subjectId;

  DateTime date;

  String status;

  String source;

  /// Returns a shallow copy of this [AttendanceLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AttendanceLog copyWith({
    int? id,
    int? userId,
    int? subjectId,
    DateTime? date,
    String? status,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AttendanceLog',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'date': date.toJson(),
      'status': status,
      'source': source,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AttendanceLog',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'date': date.toJson(),
      'status': status,
      'source': source,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AttendanceLogImpl extends AttendanceLog {
  _AttendanceLogImpl({
    int? id,
    required int userId,
    required int subjectId,
    required DateTime date,
    required String status,
    required String source,
  }) : super._(
          id: id,
          userId: userId,
          subjectId: subjectId,
          date: date,
          status: status,
          source: source,
        );

  /// Returns a shallow copy of this [AttendanceLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AttendanceLog copyWith({
    Object? id = _Undefined,
    int? userId,
    int? subjectId,
    DateTime? date,
    String? status,
    String? source,
  }) {
    return AttendanceLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      subjectId: subjectId ?? this.subjectId,
      date: date ?? this.date,
      status: status ?? this.status,
      source: source ?? this.source,
    );
  }
}
