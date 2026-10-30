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

abstract class UserProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserProfile._({
    this.id,
    required this.userInfoId,
    required this.fullName,
    required this.email,
    this.avatarUrl,
    required this.collegeId,
    required this.collegeName,
    required this.branchId,
    required this.branchName,
    required this.sectionId,
    required this.sectionName,
    required this.year,
    required this.semester,
    this.bio,
    required this.interests,
    required this.skills,
    this.githubUrl,
    this.linkedinUrl,
    required this.role,
    this.sgpaJson,
    required this.notesUploadedCount,
    required this.averageRatingReceived,
    required this.quizRank,
    required this.createdAt,
  });

  factory UserProfile({
    int? id,
    required int userInfoId,
    required String fullName,
    required String email,
    String? avatarUrl,
    required int collegeId,
    required String collegeName,
    required int branchId,
    required String branchName,
    required int sectionId,
    required String sectionName,
    required int year,
    required int semester,
    String? bio,
    required List<String> interests,
    required List<String> skills,
    String? githubUrl,
    String? linkedinUrl,
    required String role,
    String? sgpaJson,
    required int notesUploadedCount,
    required double averageRatingReceived,
    required int quizRank,
    required DateTime createdAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      fullName: jsonSerialization['fullName'] as String,
      email: jsonSerialization['email'] as String,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      collegeId: jsonSerialization['collegeId'] as int,
      collegeName: jsonSerialization['collegeName'] as String,
      branchId: jsonSerialization['branchId'] as int,
      branchName: jsonSerialization['branchName'] as String,
      sectionId: jsonSerialization['sectionId'] as int,
      sectionName: jsonSerialization['sectionName'] as String,
      year: jsonSerialization['year'] as int,
      semester: jsonSerialization['semester'] as int,
      bio: jsonSerialization['bio'] as String?,
      interests: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['interests']),
      skills: _ios9a6x4.Protocol()
          .deserialize<List<String>>(jsonSerialization['skills']),
      githubUrl: jsonSerialization['githubUrl'] as String?,
      linkedinUrl: jsonSerialization['linkedinUrl'] as String?,
      role: jsonSerialization['role'] as String,
      sgpaJson: jsonSerialization['sgpaJson'] as String?,
      notesUploadedCount: jsonSerialization['notesUploadedCount'] as int,
      averageRatingReceived:
          (jsonSerialization['averageRatingReceived'] as num).toDouble(),
      quizRank: jsonSerialization['quizRank'] as int,
      createdAt:
          _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  String fullName;

  String email;

  String? avatarUrl;

  int collegeId;

  String collegeName;

  int branchId;

  String branchName;

  int sectionId;

  String sectionName;

  int year;

  int semester;

  String? bio;

  List<String> interests;

  List<String> skills;

  String? githubUrl;

  String? linkedinUrl;

  String role;

  String? sgpaJson;

  int notesUploadedCount;

  double averageRatingReceived;

  int quizRank;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserProfile copyWith({
    int? id,
    int? userInfoId,
    String? fullName,
    String? email,
    String? avatarUrl,
    int? collegeId,
    String? collegeName,
    int? branchId,
    String? branchName,
    int? sectionId,
    String? sectionName,
    int? year,
    int? semester,
    String? bio,
    List<String>? interests,
    List<String>? skills,
    String? githubUrl,
    String? linkedinUrl,
    String? role,
    String? sgpaJson,
    int? notesUploadedCount,
    double? averageRatingReceived,
    int? quizRank,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'fullName': fullName,
      'email': email,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'collegeId': collegeId,
      'collegeName': collegeName,
      'branchId': branchId,
      'branchName': branchName,
      'sectionId': sectionId,
      'sectionName': sectionName,
      'year': year,
      'semester': semester,
      if (bio != null) 'bio': bio,
      'interests': interests.toJson(),
      'skills': skills.toJson(),
      if (githubUrl != null) 'githubUrl': githubUrl,
      if (linkedinUrl != null) 'linkedinUrl': linkedinUrl,
      'role': role,
      if (sgpaJson != null) 'sgpaJson': sgpaJson,
      'notesUploadedCount': notesUploadedCount,
      'averageRatingReceived': averageRatingReceived,
      'quizRank': quizRank,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'fullName': fullName,
      'email': email,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'collegeId': collegeId,
      'collegeName': collegeName,
      'branchId': branchId,
      'branchName': branchName,
      'sectionId': sectionId,
      'sectionName': sectionName,
      'year': year,
      'semester': semester,
      if (bio != null) 'bio': bio,
      'interests': interests.toJson(),
      'skills': skills.toJson(),
      if (githubUrl != null) 'githubUrl': githubUrl,
      if (linkedinUrl != null) 'linkedinUrl': linkedinUrl,
      'role': role,
      if (sgpaJson != null) 'sgpaJson': sgpaJson,
      'notesUploadedCount': notesUploadedCount,
      'averageRatingReceived': averageRatingReceived,
      'quizRank': quizRank,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required int userInfoId,
    required String fullName,
    required String email,
    String? avatarUrl,
    required int collegeId,
    required String collegeName,
    required int branchId,
    required String branchName,
    required int sectionId,
    required String sectionName,
    required int year,
    required int semester,
    String? bio,
    required List<String> interests,
    required List<String> skills,
    String? githubUrl,
    String? linkedinUrl,
    required String role,
    String? sgpaJson,
    required int notesUploadedCount,
    required double averageRatingReceived,
    required int quizRank,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          fullName: fullName,
          email: email,
          avatarUrl: avatarUrl,
          collegeId: collegeId,
          collegeName: collegeName,
          branchId: branchId,
          branchName: branchName,
          sectionId: sectionId,
          sectionName: sectionName,
          year: year,
          semester: semester,
          bio: bio,
          interests: interests,
          skills: skills,
          githubUrl: githubUrl,
          linkedinUrl: linkedinUrl,
          role: role,
          sgpaJson: sgpaJson,
          notesUploadedCount: notesUploadedCount,
          averageRatingReceived: averageRatingReceived,
          quizRank: quizRank,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? fullName,
    String? email,
    Object? avatarUrl = _Undefined,
    int? collegeId,
    String? collegeName,
    int? branchId,
    String? branchName,
    int? sectionId,
    String? sectionName,
    int? year,
    int? semester,
    Object? bio = _Undefined,
    List<String>? interests,
    List<String>? skills,
    Object? githubUrl = _Undefined,
    Object? linkedinUrl = _Undefined,
    String? role,
    Object? sgpaJson = _Undefined,
    int? notesUploadedCount,
    double? averageRatingReceived,
    int? quizRank,
    DateTime? createdAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      collegeId: collegeId ?? this.collegeId,
      collegeName: collegeName ?? this.collegeName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      sectionId: sectionId ?? this.sectionId,
      sectionName: sectionName ?? this.sectionName,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      bio: bio is String? ? bio : this.bio,
      interests: interests ?? this.interests.map((e0) => e0).toList(),
      skills: skills ?? this.skills.map((e0) => e0).toList(),
      githubUrl: githubUrl is String? ? githubUrl : this.githubUrl,
      linkedinUrl: linkedinUrl is String? ? linkedinUrl : this.linkedinUrl,
      role: role ?? this.role,
      sgpaJson: sgpaJson is String? ? sgpaJson : this.sgpaJson,
      notesUploadedCount: notesUploadedCount ?? this.notesUploadedCount,
      averageRatingReceived:
          averageRatingReceived ?? this.averageRatingReceived,
      quizRank: quizRank ?? this.quizRank,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
