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

abstract class RentalItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RentalItem._({
    this.id,
    required this.ownerId,
    required this.ownerName,
    required this.title,
    required this.category,
    required this.description,
    required this.photosJson,
    required this.rentPricePerDay,
    required this.depositAmount,
    required this.condition,
    required this.isAvailable,
    required this.pickupPlace,
    required this.collegeId,
    required this.createdAt,
  });

  factory RentalItem({
    int? id,
    required int ownerId,
    required String ownerName,
    required String title,
    required String category,
    required String description,
    required String photosJson,
    required double rentPricePerDay,
    required double depositAmount,
    required String condition,
    required bool isAvailable,
    required String pickupPlace,
    required int collegeId,
    required DateTime createdAt,
  }) = _RentalItemImpl;

  factory RentalItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalItem(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      ownerName: jsonSerialization['ownerName'] as String,
      title: jsonSerialization['title'] as String,
      category: jsonSerialization['category'] as String,
      description: jsonSerialization['description'] as String,
      photosJson: jsonSerialization['photosJson'] as String,
      rentPricePerDay: (jsonSerialization['rentPricePerDay'] as num).toDouble(),
      depositAmount: (jsonSerialization['depositAmount'] as num).toDouble(),
      condition: jsonSerialization['condition'] as String,
      isAvailable:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isAvailable']),
      pickupPlace: jsonSerialization['pickupPlace'] as String,
      collegeId: jsonSerialization['collegeId'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  String ownerName;

  String title;

  String category;

  String description;

  String photosJson;

  double rentPricePerDay;

  double depositAmount;

  String condition;

  bool isAvailable;

  String pickupPlace;

  int collegeId;

  DateTime createdAt;

  /// Returns a shallow copy of this [RentalItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RentalItem copyWith({
    int? id,
    int? ownerId,
    String? ownerName,
    String? title,
    String? category,
    String? description,
    String? photosJson,
    double? rentPricePerDay,
    double? depositAmount,
    String? condition,
    bool? isAvailable,
    String? pickupPlace,
    int? collegeId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RentalItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'title': title,
      'category': category,
      'description': description,
      'photosJson': photosJson,
      'rentPricePerDay': rentPricePerDay,
      'depositAmount': depositAmount,
      'condition': condition,
      'isAvailable': isAvailable,
      'pickupPlace': pickupPlace,
      'collegeId': collegeId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RentalItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'title': title,
      'category': category,
      'description': description,
      'photosJson': photosJson,
      'rentPricePerDay': rentPricePerDay,
      'depositAmount': depositAmount,
      'condition': condition,
      'isAvailable': isAvailable,
      'pickupPlace': pickupPlace,
      'collegeId': collegeId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalItemImpl extends RentalItem {
  _RentalItemImpl({
    int? id,
    required int ownerId,
    required String ownerName,
    required String title,
    required String category,
    required String description,
    required String photosJson,
    required double rentPricePerDay,
    required double depositAmount,
    required String condition,
    required bool isAvailable,
    required String pickupPlace,
    required int collegeId,
    required DateTime createdAt,
  }) : super._(
          id: id,
          ownerId: ownerId,
          ownerName: ownerName,
          title: title,
          category: category,
          description: description,
          photosJson: photosJson,
          rentPricePerDay: rentPricePerDay,
          depositAmount: depositAmount,
          condition: condition,
          isAvailable: isAvailable,
          pickupPlace: pickupPlace,
          collegeId: collegeId,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RentalItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RentalItem copyWith({
    Object? id = _Undefined,
    int? ownerId,
    String? ownerName,
    String? title,
    String? category,
    String? description,
    String? photosJson,
    double? rentPricePerDay,
    double? depositAmount,
    String? condition,
    bool? isAvailable,
    String? pickupPlace,
    int? collegeId,
    DateTime? createdAt,
  }) {
    return RentalItem(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      photosJson: photosJson ?? this.photosJson,
      rentPricePerDay: rentPricePerDay ?? this.rentPricePerDay,
      depositAmount: depositAmount ?? this.depositAmount,
      condition: condition ?? this.condition,
      isAvailable: isAvailable ?? this.isAvailable,
      pickupPlace: pickupPlace ?? this.pickupPlace,
      collegeId: collegeId ?? this.collegeId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
