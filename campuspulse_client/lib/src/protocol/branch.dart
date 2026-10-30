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

abstract class Branch
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Branch._({
    this.id,
    required this.collegeId,
    required this.name,
    required this.code,
    required this.degree,
  });

  factory Branch({
    int? id,
    required int collegeId,
    required String name,
    required String code,
    required String degree,
  }) = _BranchImpl;

  factory Branch.fromJson(Map<String, dynamic> jsonSerialization) {
    return Branch(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      degree: jsonSerialization['degree'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int collegeId;

  String name;

  String code;

  String degree;

  /// Returns a shallow copy of this [Branch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Branch copyWith({
    int? id,
    int? collegeId,
    String? name,
    String? code,
    String? degree,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Branch',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'name': name,
      'code': code,
      'degree': degree,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Branch',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'name': name,
      'code': code,
      'degree': degree,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BranchImpl extends Branch {
  _BranchImpl({
    int? id,
    required int collegeId,
    required String name,
    required String code,
    required String degree,
  }) : super._(
          id: id,
          collegeId: collegeId,
          name: name,
          code: code,
          degree: degree,
        );

  /// Returns a shallow copy of this [Branch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Branch copyWith({
    Object? id = _Undefined,
    int? collegeId,
    String? name,
    String? code,
    String? degree,
  }) {
    return Branch(
      id: id is int? ? id : this.id,
      collegeId: collegeId ?? this.collegeId,
      name: name ?? this.name,
      code: code ?? this.code,
      degree: degree ?? this.degree,
    );
  }
}
