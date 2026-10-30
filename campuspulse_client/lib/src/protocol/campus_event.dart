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

abstract class CampusEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CampusEvent._({
    this.id,
    required this.collegeId,
    required this.organizerClub,
    required this.creatorUserId,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.venue,
    required this.eventDate,
    required this.registrationDeadline,
    this.capacity,
    required this.registrationCount,
    this.registrationUrl,
    required this.isInternalRegistration,
    required this.tags,
    required this.isApproved,
    required this.createdAt,
  });

  factory CampusEvent({
    int? id,
    required int collegeId,
    required String organizerClub,
    required int creatorUserId,
    required String title,
    required String description,
    required String posterUrl,
    required String venue,
    required DateTime eventDate,
    required DateTime registrationDeadline,
    int? capacity,
    required int registrationCount,
    String? registrationUrl,
    required bool isInternalRegistration,
    required List<String> tags,
    required bool isApproved,
    required DateTime createdAt,
  }) = _CampusEventImpl;

  factory CampusEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CampusEvent(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int,
      organizerClub: jsonSerialization['organizerClub'] as String,
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      posterUrl: jsonSerialization['posterUrl'] as String,
      venue: jsonSerialization['venue'] as String,
      eventDate:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['eventDate']),
      registrationDeadline: _isc.DateTimeJsonExtension.fromJson(
          jsonSerialization['registrationDeadline']),
      capacity: jsonSerialization['capacity'] as int?,
      registrationCount: jsonSerialization['registrationCount'] as int,
      registrationUrl: jsonSerialization['registrationUrl'] as String?,
      isInternalRegistration: _isc.BoolJsonExtension.fromJson(
          jsonSerialization['isInternalRegistration']),
      tags: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['tags']),
      isApproved:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isApproved']),
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int collegeId;

  String organizerClub;

  int creatorUserId;

  String title;

  String description;

  String posterUrl;

  String venue;

  DateTime eventDate;

  DateTime registrationDeadline;

  int? capacity;

  int registrationCount;

  String? registrationUrl;

  bool isInternalRegistration;

  List<String> tags;

  bool isApproved;

  DateTime createdAt;

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CampusEvent copyWith({
    int? id,
    int? collegeId,
    String? organizerClub,
    int? creatorUserId,
    String? title,
    String? description,
    String? posterUrl,
    String? venue,
    DateTime? eventDate,
    DateTime? registrationDeadline,
    int? capacity,
    int? registrationCount,
    String? registrationUrl,
    bool? isInternalRegistration,
    List<String>? tags,
    bool? isApproved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'organizerClub': organizerClub,
      'creatorUserId': creatorUserId,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'venue': venue,
      'eventDate': eventDate.toJson(),
      'registrationDeadline': registrationDeadline.toJson(),
      if (capacity != null) 'capacity': capacity,
      'registrationCount': registrationCount,
      if (registrationUrl != null) 'registrationUrl': registrationUrl,
      'isInternalRegistration': isInternalRegistration,
      'tags': tags.toJson(),
      'isApproved': isApproved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'organizerClub': organizerClub,
      'creatorUserId': creatorUserId,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'venue': venue,
      'eventDate': eventDate.toJson(),
      'registrationDeadline': registrationDeadline.toJson(),
      if (capacity != null) 'capacity': capacity,
      'registrationCount': registrationCount,
      if (registrationUrl != null) 'registrationUrl': registrationUrl,
      'isInternalRegistration': isInternalRegistration,
      'tags': tags.toJson(),
      'isApproved': isApproved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CampusEventImpl extends CampusEvent {
  _CampusEventImpl({
    int? id,
    required int collegeId,
    required String organizerClub,
    required int creatorUserId,
    required String title,
    required String description,
    required String posterUrl,
    required String venue,
    required DateTime eventDate,
    required DateTime registrationDeadline,
    int? capacity,
    required int registrationCount,
    String? registrationUrl,
    required bool isInternalRegistration,
    required List<String> tags,
    required bool isApproved,
    required DateTime createdAt,
  }) : super._(
          id: id,
          collegeId: collegeId,
          organizerClub: organizerClub,
          creatorUserId: creatorUserId,
          title: title,
          description: description,
          posterUrl: posterUrl,
          venue: venue,
          eventDate: eventDate,
          registrationDeadline: registrationDeadline,
          capacity: capacity,
          registrationCount: registrationCount,
          registrationUrl: registrationUrl,
          isInternalRegistration: isInternalRegistration,
          tags: tags,
          isApproved: isApproved,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CampusEvent copyWith({
    Object? id = _Undefined,
    int? collegeId,
    String? organizerClub,
    int? creatorUserId,
    String? title,
    String? description,
    String? posterUrl,
    String? venue,
    DateTime? eventDate,
    DateTime? registrationDeadline,
    Object? capacity = _Undefined,
    int? registrationCount,
    Object? registrationUrl = _Undefined,
    bool? isInternalRegistration,
    List<String>? tags,
    bool? isApproved,
    DateTime? createdAt,
  }) {
    return CampusEvent(
      id: id is int? ? id : this.id,
      collegeId: collegeId ?? this.collegeId,
      organizerClub: organizerClub ?? this.organizerClub,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      venue: venue ?? this.venue,
      eventDate: eventDate ?? this.eventDate,
      registrationDeadline: registrationDeadline ?? this.registrationDeadline,
      capacity: capacity is int? ? capacity : this.capacity,
      registrationCount: registrationCount ?? this.registrationCount,
      registrationUrl:
          registrationUrl is String? ? registrationUrl : this.registrationUrl,
      isInternalRegistration:
          isInternalRegistration ?? this.isInternalRegistration,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
