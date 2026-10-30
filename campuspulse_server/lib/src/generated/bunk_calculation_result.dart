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
import 'package:campuspulse_server/src/generated/protocol.dart' as _i3yc8a0r;
import 'package:serverpod/serverpod.dart' as _is;

abstract class BunkCalculationResult
    implements _is.SerializableModel, _is.ProtocolSerialization {
  BunkCalculationResult._({
    this.subjectId,
    this.subjectName,
    required this.classesAttended,
    required this.totalClassesHeld,
    required this.currentPercentage,
    required this.requiredPercentage,
    required this.safeBunks,
    required this.recoveryClassesNeeded,
    required this.statusColor,
    this.whatIfBunkScenarios,
  });

  factory BunkCalculationResult({
    int? subjectId,
    String? subjectName,
    required int classesAttended,
    required int totalClassesHeld,
    required double currentPercentage,
    required double requiredPercentage,
    required int safeBunks,
    required int recoveryClassesNeeded,
    required String statusColor,
    List<String>? whatIfBunkScenarios,
  }) = _BunkCalculationResultImpl;

  factory BunkCalculationResult.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BunkCalculationResult(
      subjectId: jsonSerialization['subjectId'] as int?,
      subjectName: jsonSerialization['subjectName'] as String?,
      classesAttended: jsonSerialization['classesAttended'] as int,
      totalClassesHeld: jsonSerialization['totalClassesHeld'] as int,
      currentPercentage:
          (jsonSerialization['currentPercentage'] as num).toDouble(),
      requiredPercentage:
          (jsonSerialization['requiredPercentage'] as num).toDouble(),
      safeBunks: jsonSerialization['safeBunks'] as int,
      recoveryClassesNeeded: jsonSerialization['recoveryClassesNeeded'] as int,
      statusColor: jsonSerialization['statusColor'] as String,
      whatIfBunkScenarios: jsonSerialization['whatIfBunkScenarios'] == null
          ? null
          : _i3yc8a0r.Protocol().deserialize<List<String>>(
              jsonSerialization['whatIfBunkScenarios']),
    );
  }

  int? subjectId;

  String? subjectName;

  int classesAttended;

  int totalClassesHeld;

  double currentPercentage;

  double requiredPercentage;

  int safeBunks;

  int recoveryClassesNeeded;

  String statusColor;

  List<String>? whatIfBunkScenarios;

  /// Returns a shallow copy of this [BunkCalculationResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BunkCalculationResult copyWith({
    int? subjectId,
    String? subjectName,
    int? classesAttended,
    int? totalClassesHeld,
    double? currentPercentage,
    double? requiredPercentage,
    int? safeBunks,
    int? recoveryClassesNeeded,
    String? statusColor,
    List<String>? whatIfBunkScenarios,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BunkCalculationResult',
      if (subjectId != null) 'subjectId': subjectId,
      if (subjectName != null) 'subjectName': subjectName,
      'classesAttended': classesAttended,
      'totalClassesHeld': totalClassesHeld,
      'currentPercentage': currentPercentage,
      'requiredPercentage': requiredPercentage,
      'safeBunks': safeBunks,
      'recoveryClassesNeeded': recoveryClassesNeeded,
      'statusColor': statusColor,
      if (whatIfBunkScenarios != null)
        'whatIfBunkScenarios': whatIfBunkScenarios?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BunkCalculationResult',
      if (subjectId != null) 'subjectId': subjectId,
      if (subjectName != null) 'subjectName': subjectName,
      'classesAttended': classesAttended,
      'totalClassesHeld': totalClassesHeld,
      'currentPercentage': currentPercentage,
      'requiredPercentage': requiredPercentage,
      'safeBunks': safeBunks,
      'recoveryClassesNeeded': recoveryClassesNeeded,
      'statusColor': statusColor,
      if (whatIfBunkScenarios != null)
        'whatIfBunkScenarios': whatIfBunkScenarios?.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BunkCalculationResultImpl extends BunkCalculationResult {
  _BunkCalculationResultImpl({
    int? subjectId,
    String? subjectName,
    required int classesAttended,
    required int totalClassesHeld,
    required double currentPercentage,
    required double requiredPercentage,
    required int safeBunks,
    required int recoveryClassesNeeded,
    required String statusColor,
    List<String>? whatIfBunkScenarios,
  }) : super._(
          subjectId: subjectId,
          subjectName: subjectName,
          classesAttended: classesAttended,
          totalClassesHeld: totalClassesHeld,
          currentPercentage: currentPercentage,
          requiredPercentage: requiredPercentage,
          safeBunks: safeBunks,
          recoveryClassesNeeded: recoveryClassesNeeded,
          statusColor: statusColor,
          whatIfBunkScenarios: whatIfBunkScenarios,
        );

  /// Returns a shallow copy of this [BunkCalculationResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BunkCalculationResult copyWith({
    Object? subjectId = _Undefined,
    Object? subjectName = _Undefined,
    int? classesAttended,
    int? totalClassesHeld,
    double? currentPercentage,
    double? requiredPercentage,
    int? safeBunks,
    int? recoveryClassesNeeded,
    String? statusColor,
    Object? whatIfBunkScenarios = _Undefined,
  }) {
    return BunkCalculationResult(
      subjectId: subjectId is int? ? subjectId : this.subjectId,
      subjectName: subjectName is String? ? subjectName : this.subjectName,
      classesAttended: classesAttended ?? this.classesAttended,
      totalClassesHeld: totalClassesHeld ?? this.totalClassesHeld,
      currentPercentage: currentPercentage ?? this.currentPercentage,
      requiredPercentage: requiredPercentage ?? this.requiredPercentage,
      safeBunks: safeBunks ?? this.safeBunks,
      recoveryClassesNeeded:
          recoveryClassesNeeded ?? this.recoveryClassesNeeded,
      statusColor: statusColor ?? this.statusColor,
      whatIfBunkScenarios: whatIfBunkScenarios is List<String>?
          ? whatIfBunkScenarios
          : this.whatIfBunkScenarios?.map((e0) => e0).toList(),
    );
  }
}
