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

abstract class College
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  College._({
    this.id,
    required this.name,
    required this.code,
    required this.city,
    required this.state,
  });

  factory College({
    int? id,
    required String name,
    required String code,
    required String city,
    required String state,
  }) = _CollegeImpl;

  factory College.fromJson(Map<String, dynamic> jsonSerialization) {
    return College(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String code;

  String city;

  String state;

  /// Returns a shallow copy of this [College]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  College copyWith({
    int? id,
    String? name,
    String? code,
    String? city,
    String? state,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'College',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'city': city,
      'state': state,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'College',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'city': city,
      'state': state,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CollegeImpl extends College {
  _CollegeImpl({
    int? id,
    required String name,
    required String code,
    required String city,
    required String state,
  }) : super._(
          id: id,
          name: name,
          code: code,
          city: city,
          state: state,
        );

  /// Returns a shallow copy of this [College]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  College copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    String? city,
    String? state,
  }) {
    return College(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }
}
