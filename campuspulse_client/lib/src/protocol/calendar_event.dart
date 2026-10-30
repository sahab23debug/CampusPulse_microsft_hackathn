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

abstract class CalendarEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CalendarEvent._({
    this.id,
    this.collegeId,
    this.sectionId,
    required this.title,
    required this.description,
    required this.eventType,
    required this.startDate,
    required this.endDate,
    required this.isAllDay,
    this.venue,
  });

  factory CalendarEvent({
    int? id,
    int? collegeId,
    int? sectionId,
    required String title,
    required String description,
    required String eventType,
    required DateTime startDate,
    required DateTime endDate,
    required bool isAllDay,
    String? venue,
  }) = _CalendarEventImpl;

  factory CalendarEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CalendarEvent(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int?,
      sectionId: jsonSerialization['sectionId'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      eventType: jsonSerialization['eventType'] as String,
      startDate:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      isAllDay: _isc.BoolJsonExtension.fromJson(jsonSerialization['isAllDay']),
      venue: jsonSerialization['venue'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? collegeId;

  int? sectionId;

  String title;

  String description;

  String eventType;

  DateTime startDate;

  DateTime endDate;

  bool isAllDay;

  String? venue;

  /// Returns a shallow copy of this [CalendarEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CalendarEvent copyWith({
    int? id,
    int? collegeId,
    int? sectionId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    String? venue,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CalendarEvent',
      if (id != null) 'id': id,
      if (collegeId != null) 'collegeId': collegeId,
      if (sectionId != null) 'sectionId': sectionId,
      'title': title,
      'description': description,
      'eventType': eventType,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isAllDay': isAllDay,
      if (venue != null) 'venue': venue,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CalendarEvent',
      if (id != null) 'id': id,
      if (collegeId != null) 'collegeId': collegeId,
      if (sectionId != null) 'sectionId': sectionId,
      'title': title,
      'description': description,
      'eventType': eventType,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isAllDay': isAllDay,
      if (venue != null) 'venue': venue,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalendarEventImpl extends CalendarEvent {
  _CalendarEventImpl({
    int? id,
    int? collegeId,
    int? sectionId,
    required String title,
    required String description,
    required String eventType,
    required DateTime startDate,
    required DateTime endDate,
    required bool isAllDay,
    String? venue,
  }) : super._(
          id: id,
          collegeId: collegeId,
          sectionId: sectionId,
          title: title,
          description: description,
          eventType: eventType,
          startDate: startDate,
          endDate: endDate,
          isAllDay: isAllDay,
          venue: venue,
        );

  /// Returns a shallow copy of this [CalendarEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CalendarEvent copyWith({
    Object? id = _Undefined,
    Object? collegeId = _Undefined,
    Object? sectionId = _Undefined,
    String? title,
    String? description,
    String? eventType,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    Object? venue = _Undefined,
  }) {
    return CalendarEvent(
      id: id is int? ? id : this.id,
      collegeId: collegeId is int? ? collegeId : this.collegeId,
      sectionId: sectionId is int? ? sectionId : this.sectionId,
      title: title ?? this.title,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
      venue: venue is String? ? venue : this.venue,
    );
  }
}
