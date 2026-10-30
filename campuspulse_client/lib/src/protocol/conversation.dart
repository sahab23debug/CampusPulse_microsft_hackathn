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

abstract class Conversation
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Conversation._({
    this.id,
    required this.user1Id,
    required this.user2Id,
    this.lastMessageSnippet,
    this.lastMessageAt,
    required this.user1UnreadCount,
    required this.user2UnreadCount,
    required this.isAccepted,
  });

  factory Conversation({
    int? id,
    required int user1Id,
    required int user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    required int user1UnreadCount,
    required int user2UnreadCount,
    required bool isAccepted,
  }) = _ConversationImpl;

  factory Conversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Conversation(
      id: jsonSerialization['id'] as int?,
      user1Id: jsonSerialization['user1Id'] as int,
      user2Id: jsonSerialization['user2Id'] as int,
      lastMessageSnippet: jsonSerialization['lastMessageSnippet'] as String?,
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt']),
      user1UnreadCount: jsonSerialization['user1UnreadCount'] as int,
      user2UnreadCount: jsonSerialization['user2UnreadCount'] as int,
      isAccepted:
          _isc.BoolJsonExtension.fromJson(jsonSerialization['isAccepted']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int user1Id;

  int user2Id;

  String? lastMessageSnippet;

  DateTime? lastMessageAt;

  int user1UnreadCount;

  int user2UnreadCount;

  bool isAccepted;

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Conversation copyWith({
    int? id,
    int? user1Id,
    int? user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    int? user1UnreadCount,
    int? user2UnreadCount,
    bool? isAccepted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Conversation',
      if (id != null) 'id': id,
      'user1Id': user1Id,
      'user2Id': user2Id,
      if (lastMessageSnippet != null) 'lastMessageSnippet': lastMessageSnippet,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      'user1UnreadCount': user1UnreadCount,
      'user2UnreadCount': user2UnreadCount,
      'isAccepted': isAccepted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Conversation',
      if (id != null) 'id': id,
      'user1Id': user1Id,
      'user2Id': user2Id,
      if (lastMessageSnippet != null) 'lastMessageSnippet': lastMessageSnippet,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      'user1UnreadCount': user1UnreadCount,
      'user2UnreadCount': user2UnreadCount,
      'isAccepted': isAccepted,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConversationImpl extends Conversation {
  _ConversationImpl({
    int? id,
    required int user1Id,
    required int user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    required int user1UnreadCount,
    required int user2UnreadCount,
    required bool isAccepted,
  }) : super._(
          id: id,
          user1Id: user1Id,
          user2Id: user2Id,
          lastMessageSnippet: lastMessageSnippet,
          lastMessageAt: lastMessageAt,
          user1UnreadCount: user1UnreadCount,
          user2UnreadCount: user2UnreadCount,
          isAccepted: isAccepted,
        );

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Conversation copyWith({
    Object? id = _Undefined,
    int? user1Id,
    int? user2Id,
    Object? lastMessageSnippet = _Undefined,
    Object? lastMessageAt = _Undefined,
    int? user1UnreadCount,
    int? user2UnreadCount,
    bool? isAccepted,
  }) {
    return Conversation(
      id: id is int? ? id : this.id,
      user1Id: user1Id ?? this.user1Id,
      user2Id: user2Id ?? this.user2Id,
      lastMessageSnippet: lastMessageSnippet is String?
          ? lastMessageSnippet
          : this.lastMessageSnippet,
      lastMessageAt:
          lastMessageAt is DateTime? ? lastMessageAt : this.lastMessageAt,
      user1UnreadCount: user1UnreadCount ?? this.user1UnreadCount,
      user2UnreadCount: user2UnreadCount ?? this.user2UnreadCount,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}
