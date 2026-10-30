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

abstract class TimetableEntry
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TimetableEntry._({
    this.id,
    required this.sectionId,
    required this.subjectId,
    required this.subjectName,
    required this.subjectCode,
    required this.facultyName,
    required this.roomNumber,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.type,
  });

  factory TimetableEntry({
    int? id,
    required int sectionId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required String facultyName,
    required String roomNumber,
    required int dayOfWeek,
    required String startTime,
    required String endTime,
    required String type,
  }) = _TimetableEntryImpl;

  factory TimetableEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return TimetableEntry(
      id: jsonSerialization['id'] as int?,
      sectionId: jsonSerialization['sectionId'] as int,
      subjectId: jsonSerialization['subjectId'] as int,
      subjectName: jsonSerialization['subjectName'] as String,
      subjectCode: jsonSerialization['subjectCode'] as String,
      facultyName: jsonSerialization['facultyName'] as String,
      roomNumber: jsonSerialization['roomNumber'] as String,
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startTime: jsonSerialization['startTime'] as String,
      endTime: jsonSerialization['endTime'] as String,
      type: jsonSerialization['type'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int sectionId;

  int subjectId;

  String subjectName;

  String subjectCode;

  String facultyName;

  String roomNumber;

  int dayOfWeek;

  String startTime;

  String endTime;

  String type;

  /// Returns a shallow copy of this [TimetableEntry]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TimetableEntry copyWith({
    int? id,
    int? sectionId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    String? facultyName,
    String? roomNumber,
    int? dayOfWeek,
    String? startTime,
    String? endTime,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TimetableEntry',
      if (id != null) 'id': id,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'facultyName': facultyName,
      'roomNumber': roomNumber,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TimetableEntry',
      if (id != null) 'id': id,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'facultyName': facultyName,
      'roomNumber': roomNumber,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'type': type,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TimetableEntryImpl extends TimetableEntry {
  _TimetableEntryImpl({
    int? id,
    required int sectionId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required String facultyName,
    required String roomNumber,
    required int dayOfWeek,
    required String startTime,
    required String endTime,
    required String type,
  }) : super._(
          id: id,
          sectionId: sectionId,
          subjectId: subjectId,
          subjectName: subjectName,
          subjectCode: subjectCode,
          facultyName: facultyName,
          roomNumber: roomNumber,
          dayOfWeek: dayOfWeek,
          startTime: startTime,
          endTime: endTime,
          type: type,
        );

  /// Returns a shallow copy of this [TimetableEntry]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TimetableEntry copyWith({
    Object? id = _Undefined,
    int? sectionId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    String? facultyName,
    String? roomNumber,
    int? dayOfWeek,
    String? startTime,
    String? endTime,
    String? type,
  }) {
    return TimetableEntry(
      id: id is int? ? id : this.id,
      sectionId: sectionId ?? this.sectionId,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      subjectCode: subjectCode ?? this.subjectCode,
      facultyName: facultyName ?? this.facultyName,
      roomNumber: roomNumber ?? this.roomNumber,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
    );
  }
}
