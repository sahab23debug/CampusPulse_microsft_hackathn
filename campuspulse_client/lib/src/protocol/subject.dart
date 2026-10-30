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

abstract class Subject
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Subject._({
    this.id,
    required this.branchId,
    required this.semester,
    required this.name,
    required this.code,
    required this.credits,
  });

  factory Subject({
    int? id,
    required int branchId,
    required int semester,
    required String name,
    required String code,
    required int credits,
  }) = _SubjectImpl;

  factory Subject.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subject(
      id: jsonSerialization['id'] as int?,
      branchId: jsonSerialization['branchId'] as int,
      semester: jsonSerialization['semester'] as int,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      credits: jsonSerialization['credits'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int branchId;

  int semester;

  String name;

  String code;

  int credits;

  /// Returns a shallow copy of this [Subject]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Subject copyWith({
    int? id,
    int? branchId,
    int? semester,
    String? name,
    String? code,
    int? credits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Subject',
      if (id != null) 'id': id,
      'branchId': branchId,
      'semester': semester,
      'name': name,
      'code': code,
      'credits': credits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Subject',
      if (id != null) 'id': id,
      'branchId': branchId,
      'semester': semester,
      'name': name,
      'code': code,
      'credits': credits,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubjectImpl extends Subject {
  _SubjectImpl({
    int? id,
    required int branchId,
    required int semester,
    required String name,
    required String code,
    required int credits,
  }) : super._(
          id: id,
          branchId: branchId,
          semester: semester,
          name: name,
          code: code,
          credits: credits,
        );

  /// Returns a shallow copy of this [Subject]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Subject copyWith({
    Object? id = _Undefined,
    int? branchId,
    int? semester,
    String? name,
    String? code,
    int? credits,
  }) {
    return Subject(
      id: id is int? ? id : this.id,
      branchId: branchId ?? this.branchId,
      semester: semester ?? this.semester,
      name: name ?? this.name,
      code: code ?? this.code,
      credits: credits ?? this.credits,
    );
  }
}
