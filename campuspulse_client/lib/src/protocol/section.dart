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

abstract class Section
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Section._({
    this.id,
    required this.branchId,
    required this.name,
    required this.year,
    required this.semester,
  });

  factory Section({
    int? id,
    required int branchId,
    required String name,
    required int year,
    required int semester,
  }) = _SectionImpl;

  factory Section.fromJson(Map<String, dynamic> jsonSerialization) {
    return Section(
      id: jsonSerialization['id'] as int?,
      branchId: jsonSerialization['branchId'] as int,
      name: jsonSerialization['name'] as String,
      year: jsonSerialization['year'] as int,
      semester: jsonSerialization['semester'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int branchId;

  String name;

  int year;

  int semester;

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Section copyWith({
    int? id,
    int? branchId,
    String? name,
    int? year,
    int? semester,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Section',
      if (id != null) 'id': id,
      'branchId': branchId,
      'name': name,
      'year': year,
      'semester': semester,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Section',
      if (id != null) 'id': id,
      'branchId': branchId,
      'name': name,
      'year': year,
      'semester': semester,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionImpl extends Section {
  _SectionImpl({
    int? id,
    required int branchId,
    required String name,
    required int year,
    required int semester,
  }) : super._(
          id: id,
          branchId: branchId,
          name: name,
          year: year,
          semester: semester,
        );

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Section copyWith({
    Object? id = _Undefined,
    int? branchId,
    String? name,
    int? year,
    int? semester,
  }) {
    return Section(
      id: id is int? ? id : this.id,
      branchId: branchId ?? this.branchId,
      name: name ?? this.name,
      year: year ?? this.year,
      semester: semester ?? this.semester,
    );
  }
}
