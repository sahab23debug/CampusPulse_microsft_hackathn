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

abstract class RentalRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RentalRequest._({
    this.id,
    required this.itemId,
    required this.renterId,
    required this.renterName,
    required this.ownerId,
    required this.status,
    required this.consentAgreed,
    required this.startDate,
    required this.returnDueDate,
    this.handoverPhotosJson,
    this.returnPhotosJson,
    required this.totalRentAmount,
    required this.depositHeld,
    required this.createdAt,
  });

  factory RentalRequest({
    int? id,
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required String status,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    required double totalRentAmount,
    required double depositHeld,
    required DateTime createdAt,
  }) = _RentalRequestImpl;

  factory RentalRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalRequest(
      id: jsonSerialization['id'] as int?,
      itemId: jsonSerialization['itemId'] as int,
      renterId: jsonSerialization['renterId'] as int,
      renterName: jsonSerialization['renterName'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      status: jsonSerialization['status'] as String,
      consentAgreed:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['consentAgreed']),
      startDate:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      returnDueDate: _isc.DateTimeJsonExtension.fromJson(
          jsonSerialization['returnDueDate']),
      handoverPhotosJson: jsonSerialization['handoverPhotosJson'] as String?,
      returnPhotosJson: jsonSerialization['returnPhotosJson'] as String?,
      totalRentAmount: (jsonSerialization['totalRentAmount'] as num).toDouble(),
      depositHeld: (jsonSerialization['depositHeld'] as num).toDouble(),
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int itemId;

  int renterId;

  String renterName;

  int ownerId;

  String status;

  bool consentAgreed;

  DateTime startDate;

  DateTime returnDueDate;

  String? handoverPhotosJson;

  String? returnPhotosJson;

  double totalRentAmount;

  double depositHeld;

  DateTime createdAt;

  /// Returns a shallow copy of this [RentalRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RentalRequest copyWith({
    int? id,
    int? itemId,
    int? renterId,
    String? renterName,
    int? ownerId,
    String? status,
    bool? consentAgreed,
    DateTime? startDate,
    DateTime? returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    double? totalRentAmount,
    double? depositHeld,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RentalRequest',
      if (id != null) 'id': id,
      'itemId': itemId,
      'renterId': renterId,
      'renterName': renterName,
      'ownerId': ownerId,
      'status': status,
      'consentAgreed': consentAgreed,
      'startDate': startDate.toJson(),
      'returnDueDate': returnDueDate.toJson(),
      if (handoverPhotosJson != null) 'handoverPhotosJson': handoverPhotosJson,
      if (returnPhotosJson != null) 'returnPhotosJson': returnPhotosJson,
      'totalRentAmount': totalRentAmount,
      'depositHeld': depositHeld,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RentalRequest',
      if (id != null) 'id': id,
      'itemId': itemId,
      'renterId': renterId,
      'renterName': renterName,
      'ownerId': ownerId,
      'status': status,
      'consentAgreed': consentAgreed,
      'startDate': startDate.toJson(),
      'returnDueDate': returnDueDate.toJson(),
      if (handoverPhotosJson != null) 'handoverPhotosJson': handoverPhotosJson,
      if (returnPhotosJson != null) 'returnPhotosJson': returnPhotosJson,
      'totalRentAmount': totalRentAmount,
      'depositHeld': depositHeld,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalRequestImpl extends RentalRequest {
  _RentalRequestImpl({
    int? id,
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required String status,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    required double totalRentAmount,
    required double depositHeld,
    required DateTime createdAt,
  }) : super._(
          id: id,
          itemId: itemId,
          renterId: renterId,
          renterName: renterName,
          ownerId: ownerId,
          status: status,
          consentAgreed: consentAgreed,
          startDate: startDate,
          returnDueDate: returnDueDate,
          handoverPhotosJson: handoverPhotosJson,
          returnPhotosJson: returnPhotosJson,
          totalRentAmount: totalRentAmount,
          depositHeld: depositHeld,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RentalRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RentalRequest copyWith({
    Object? id = _Undefined,
    int? itemId,
    int? renterId,
    String? renterName,
    int? ownerId,
    String? status,
    bool? consentAgreed,
    DateTime? startDate,
    DateTime? returnDueDate,
    Object? handoverPhotosJson = _Undefined,
    Object? returnPhotosJson = _Undefined,
    double? totalRentAmount,
    double? depositHeld,
    DateTime? createdAt,
  }) {
    return RentalRequest(
      id: id is int? ? id : this.id,
      itemId: itemId ?? this.itemId,
      renterId: renterId ?? this.renterId,
      renterName: renterName ?? this.renterName,
      ownerId: ownerId ?? this.ownerId,
      status: status ?? this.status,
      consentAgreed: consentAgreed ?? this.consentAgreed,
      startDate: startDate ?? this.startDate,
      returnDueDate: returnDueDate ?? this.returnDueDate,
      handoverPhotosJson: handoverPhotosJson is String?
          ? handoverPhotosJson
          : this.handoverPhotosJson,
      returnPhotosJson: returnPhotosJson is String?
          ? returnPhotosJson
          : this.returnPhotosJson,
      totalRentAmount: totalRentAmount ?? this.totalRentAmount,
      depositHeld: depositHeld ?? this.depositHeld,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
