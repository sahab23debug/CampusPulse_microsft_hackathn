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

abstract class Requirement
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Requirement._({
    this.id,
    required this.creatorId,
    required this.creatorName,
    required this.creatorCollege,
    required this.creatorBranch,
    required this.creatorYear,
    required this.purpose,
    required this.title,
    required this.description,
    required this.requiredSkills,
    required this.preferredSkills,
    required this.teamSizeNeeded,
    this.deadline,
    this.preferredBranch,
    this.preferredYear,
    this.proximity,
    required this.isActive,
    required this.createdAt,
  });

  factory Requirement({
    int? id,
    required int creatorId,
    required String creatorName,
    required String creatorCollege,
    required String creatorBranch,
    required int creatorYear,
    required String purpose,
    required String title,
    required String description,
    required List<String> requiredSkills,
    required List<String> preferredSkills,
    required int teamSizeNeeded,
    DateTime? deadline,
    String? preferredBranch,
    int? preferredYear,
    String? proximity,
    required bool isActive,
    required DateTime createdAt,
  }) = _RequirementImpl;

  factory Requirement.fromJson(Map<String, dynamic> jsonSerialization) {
    return Requirement(
      id: jsonSerialization['id'] as int?,
      creatorId: jsonSerialization['creatorId'] as int,
      creatorName: jsonSerialization['creatorName'] as String,
      creatorCollege: jsonSerialization['creatorCollege'] as String,
      creatorBranch: jsonSerialization['creatorBranch'] as String,
      creatorYear: jsonSerialization['creatorYear'] as int,
      purpose: jsonSerialization['purpose'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      requiredSkills: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['requiredSkills']),
      preferredSkills: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['preferredSkills']),
      teamSizeNeeded: jsonSerialization['teamSizeNeeded'] as int,
      deadline: jsonSerialization['deadline'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      preferredBranch: jsonSerialization['preferredBranch'] as String?,
      preferredYear: jsonSerialization['preferredYear'] as int?,
      proximity: jsonSerialization['proximity'] as String?,
      isActive: _isc.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int creatorId;

  String creatorName;

  String creatorCollege;

  String creatorBranch;

  int creatorYear;

  String purpose;

  String title;

  String description;

  List<String> requiredSkills;

  List<String> preferredSkills;

  int teamSizeNeeded;

  DateTime? deadline;

  String? preferredBranch;

  int? preferredYear;

  String? proximity;

  bool isActive;

  DateTime createdAt;

  /// Returns a shallow copy of this [Requirement]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Requirement copyWith({
    int? id,
    int? creatorId,
    String? creatorName,
    String? creatorCollege,
    String? creatorBranch,
    int? creatorYear,
    String? purpose,
    String? title,
    String? description,
    List<String>? requiredSkills,
    List<String>? preferredSkills,
    int? teamSizeNeeded,
    DateTime? deadline,
    String? preferredBranch,
    int? preferredYear,
    String? proximity,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Requirement',
      if (id != null) 'id': id,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'creatorCollege': creatorCollege,
      'creatorBranch': creatorBranch,
      'creatorYear': creatorYear,
      'purpose': purpose,
      'title': title,
      'description': description,
      'requiredSkills': requiredSkills.toJson(),
      'preferredSkills': preferredSkills.toJson(),
      'teamSizeNeeded': teamSizeNeeded,
      if (deadline != null) 'deadline': deadline?.toJson(),
      if (preferredBranch != null) 'preferredBranch': preferredBranch,
      if (preferredYear != null) 'preferredYear': preferredYear,
      if (proximity != null) 'proximity': proximity,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Requirement',
      if (id != null) 'id': id,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'creatorCollege': creatorCollege,
      'creatorBranch': creatorBranch,
      'creatorYear': creatorYear,
      'purpose': purpose,
      'title': title,
      'description': description,
      'requiredSkills': requiredSkills.toJson(),
      'preferredSkills': preferredSkills.toJson(),
      'teamSizeNeeded': teamSizeNeeded,
      if (deadline != null) 'deadline': deadline?.toJson(),
      if (preferredBranch != null) 'preferredBranch': preferredBranch,
      if (preferredYear != null) 'preferredYear': preferredYear,
      if (proximity != null) 'proximity': proximity,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequirementImpl extends Requirement {
  _RequirementImpl({
    int? id,
    required int creatorId,
    required String creatorName,
    required String creatorCollege,
    required String creatorBranch,
    required int creatorYear,
    required String purpose,
    required String title,
    required String description,
    required List<String> requiredSkills,
    required List<String> preferredSkills,
    required int teamSizeNeeded,
    DateTime? deadline,
    String? preferredBranch,
    int? preferredYear,
    String? proximity,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
          id: id,
          creatorId: creatorId,
          creatorName: creatorName,
          creatorCollege: creatorCollege,
          creatorBranch: creatorBranch,
          creatorYear: creatorYear,
          purpose: purpose,
          title: title,
          description: description,
          requiredSkills: requiredSkills,
          preferredSkills: preferredSkills,
          teamSizeNeeded: teamSizeNeeded,
          deadline: deadline,
          preferredBranch: preferredBranch,
          preferredYear: preferredYear,
          proximity: proximity,
          isActive: isActive,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Requirement]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Requirement copyWith({
    Object? id = _Undefined,
    int? creatorId,
    String? creatorName,
    String? creatorCollege,
    String? creatorBranch,
    int? creatorYear,
    String? purpose,
    String? title,
    String? description,
    List<String>? requiredSkills,
    List<String>? preferredSkills,
    int? teamSizeNeeded,
    Object? deadline = _Undefined,
    Object? preferredBranch = _Undefined,
    Object? preferredYear = _Undefined,
    Object? proximity = _Undefined,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Requirement(
      id: id is int? ? id : this.id,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      creatorCollege: creatorCollege ?? this.creatorCollege,
      creatorBranch: creatorBranch ?? this.creatorBranch,
      creatorYear: creatorYear ?? this.creatorYear,
      purpose: purpose ?? this.purpose,
      title: title ?? this.title,
      description: description ?? this.description,
      requiredSkills:
          requiredSkills ?? this.requiredSkills.map((e0) => e0).toList(),
      preferredSkills:
          preferredSkills ?? this.preferredSkills.map((e0) => e0).toList(),
      teamSizeNeeded: teamSizeNeeded ?? this.teamSizeNeeded,
      deadline: deadline is DateTime? ? deadline : this.deadline,
      preferredBranch:
          preferredBranch is String? ? preferredBranch : this.preferredBranch,
      preferredYear: preferredYear is int? ? preferredYear : this.preferredYear,
      proximity: proximity is String? ? proximity : this.proximity,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
