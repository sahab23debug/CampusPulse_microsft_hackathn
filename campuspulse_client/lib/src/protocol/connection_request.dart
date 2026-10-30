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

abstract class ConnectionRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ConnectionRequest._({
    this.id,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.receiverName,
    required this.note,
    required this.status,
    required this.messageCountBeforeAccept,
    required this.createdAt,
    this.updatedAt,
  });

  factory ConnectionRequest({
    int? id,
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
    required String status,
    required int messageCountBeforeAccept,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ConnectionRequestImpl;

  factory ConnectionRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConnectionRequest(
      id: jsonSerialization['id'] as int?,
      senderId: jsonSerialization['senderId'] as int,
      senderName: jsonSerialization['senderName'] as String,
      receiverId: jsonSerialization['receiverId'] as int,
      receiverName: jsonSerialization['receiverName'] as String,
      note: jsonSerialization['note'] as String,
      status: jsonSerialization['status'] as String,
      messageCountBeforeAccept:
          jsonSerialization['messageCountBeforeAccept'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int senderId;

  String senderName;

  int receiverId;

  String receiverName;

  String note;

  String status;

  int messageCountBeforeAccept;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [ConnectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ConnectionRequest copyWith({
    int? id,
    int? senderId,
    String? senderName,
    int? receiverId,
    String? receiverName,
    String? note,
    String? status,
    int? messageCountBeforeAccept,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ConnectionRequest',
      if (id != null) 'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'note': note,
      'status': status,
      'messageCountBeforeAccept': messageCountBeforeAccept,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ConnectionRequest',
      if (id != null) 'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'note': note,
      'status': status,
      'messageCountBeforeAccept': messageCountBeforeAccept,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConnectionRequestImpl extends ConnectionRequest {
  _ConnectionRequestImpl({
    int? id,
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
    required String status,
    required int messageCountBeforeAccept,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          senderId: senderId,
          senderName: senderName,
          receiverId: receiverId,
          receiverName: receiverName,
          note: note,
          status: status,
          messageCountBeforeAccept: messageCountBeforeAccept,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [ConnectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ConnectionRequest copyWith({
    Object? id = _Undefined,
    int? senderId,
    String? senderName,
    int? receiverId,
    String? receiverName,
    String? note,
    String? status,
    int? messageCountBeforeAccept,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return ConnectionRequest(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverId: receiverId ?? this.receiverId,
      receiverName: receiverName ?? this.receiverName,
      note: note ?? this.note,
      status: status ?? this.status,
      messageCountBeforeAccept:
          messageCountBeforeAccept ?? this.messageCountBeforeAccept,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
