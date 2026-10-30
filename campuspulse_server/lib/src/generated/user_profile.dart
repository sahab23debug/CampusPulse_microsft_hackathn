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

abstract class UserProfile
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      interests: _i3yc8a0r.Protocol()
          .deserialize<List<String>>(jsonSerialization['interests']),
      skills: _i3yc8a0r.Protocol()
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
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = UserProfileTable();

  static const db = UserProfileRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static UserProfileInclude include() {
    return UserProfileInclude._();
  }

  static UserProfileIncludeList includeList({
    _is.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    UserProfileInclude? include,
  }) {
    return UserProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class UserProfileUpdateTable extends _is.UpdateTable<UserProfileTable> {
  UserProfileUpdateTable(super.table);

  _is.ColumnValue<int, int> userInfoId(int value) => _is.ColumnValue(
        table.userInfoId,
        value,
      );

  _is.ColumnValue<String, String> fullName(String value) => _is.ColumnValue(
        table.fullName,
        value,
      );

  _is.ColumnValue<String, String> email(String value) => _is.ColumnValue(
        table.email,
        value,
      );

  _is.ColumnValue<String, String> avatarUrl(String? value) => _is.ColumnValue(
        table.avatarUrl,
        value,
      );

  _is.ColumnValue<int, int> collegeId(int value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<String, String> collegeName(String value) => _is.ColumnValue(
        table.collegeName,
        value,
      );

  _is.ColumnValue<int, int> branchId(int value) => _is.ColumnValue(
        table.branchId,
        value,
      );

  _is.ColumnValue<String, String> branchName(String value) => _is.ColumnValue(
        table.branchName,
        value,
      );

  _is.ColumnValue<int, int> sectionId(int value) => _is.ColumnValue(
        table.sectionId,
        value,
      );

  _is.ColumnValue<String, String> sectionName(String value) => _is.ColumnValue(
        table.sectionName,
        value,
      );

  _is.ColumnValue<int, int> year(int value) => _is.ColumnValue(
        table.year,
        value,
      );

  _is.ColumnValue<int, int> semester(int value) => _is.ColumnValue(
        table.semester,
        value,
      );

  _is.ColumnValue<String, String> bio(String? value) => _is.ColumnValue(
        table.bio,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> interests(List<String> value) =>
      _is.ColumnValue(
        table.interests,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> skills(List<String> value) =>
      _is.ColumnValue(
        table.skills,
        value,
      );

  _is.ColumnValue<String, String> githubUrl(String? value) => _is.ColumnValue(
        table.githubUrl,
        value,
      );

  _is.ColumnValue<String, String> linkedinUrl(String? value) => _is.ColumnValue(
        table.linkedinUrl,
        value,
      );

  _is.ColumnValue<String, String> role(String value) => _is.ColumnValue(
        table.role,
        value,
      );

  _is.ColumnValue<String, String> sgpaJson(String? value) => _is.ColumnValue(
        table.sgpaJson,
        value,
      );

  _is.ColumnValue<int, int> notesUploadedCount(int value) => _is.ColumnValue(
        table.notesUploadedCount,
        value,
      );

  _is.ColumnValue<double, double> averageRatingReceived(double value) =>
      _is.ColumnValue(
        table.averageRatingReceived,
        value,
      );

  _is.ColumnValue<int, int> quizRank(int value) => _is.ColumnValue(
        table.quizRank,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class UserProfileTable extends _is.Table<int?> {
  UserProfileTable({super.tableRelation}) : super(tableName: 'user_profile') {
    updateTable = UserProfileUpdateTable(this);
    userInfoId = _is.ColumnInt(
      'userInfoId',
      this,
    );
    fullName = _is.ColumnString(
      'fullName',
      this,
    );
    email = _is.ColumnString(
      'email',
      this,
    );
    avatarUrl = _is.ColumnString(
      'avatarUrl',
      this,
    );
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    collegeName = _is.ColumnString(
      'collegeName',
      this,
    );
    branchId = _is.ColumnInt(
      'branchId',
      this,
    );
    branchName = _is.ColumnString(
      'branchName',
      this,
    );
    sectionId = _is.ColumnInt(
      'sectionId',
      this,
    );
    sectionName = _is.ColumnString(
      'sectionName',
      this,
    );
    year = _is.ColumnInt(
      'year',
      this,
    );
    semester = _is.ColumnInt(
      'semester',
      this,
    );
    bio = _is.ColumnString(
      'bio',
      this,
    );
    interests = _is.ColumnSerializable<List<String>>(
      'interests',
      this,
    );
    skills = _is.ColumnSerializable<List<String>>(
      'skills',
      this,
    );
    githubUrl = _is.ColumnString(
      'githubUrl',
      this,
    );
    linkedinUrl = _is.ColumnString(
      'linkedinUrl',
      this,
    );
    role = _is.ColumnString(
      'role',
      this,
    );
    sgpaJson = _is.ColumnString(
      'sgpaJson',
      this,
    );
    notesUploadedCount = _is.ColumnInt(
      'notesUploadedCount',
      this,
    );
    averageRatingReceived = _is.ColumnDouble(
      'averageRatingReceived',
      this,
    );
    quizRank = _is.ColumnInt(
      'quizRank',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final UserProfileUpdateTable updateTable;

  late final _is.ColumnInt userInfoId;

  late final _is.ColumnString fullName;

  late final _is.ColumnString email;

  late final _is.ColumnString avatarUrl;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnString collegeName;

  late final _is.ColumnInt branchId;

  late final _is.ColumnString branchName;

  late final _is.ColumnInt sectionId;

  late final _is.ColumnString sectionName;

  late final _is.ColumnInt year;

  late final _is.ColumnInt semester;

  late final _is.ColumnString bio;

  late final _is.ColumnSerializable<List<String>> interests;

  late final _is.ColumnSerializable<List<String>> skills;

  late final _is.ColumnString githubUrl;

  late final _is.ColumnString linkedinUrl;

  late final _is.ColumnString role;

  late final _is.ColumnString sgpaJson;

  late final _is.ColumnInt notesUploadedCount;

  late final _is.ColumnDouble averageRatingReceived;

  late final _is.ColumnInt quizRank;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        userInfoId,
        fullName,
        email,
        avatarUrl,
        collegeId,
        collegeName,
        branchId,
        branchName,
        sectionId,
        sectionName,
        year,
        semester,
        bio,
        interests,
        skills,
        githubUrl,
        linkedinUrl,
        role,
        sgpaJson,
        notesUploadedCount,
        averageRatingReceived,
        quizRank,
        createdAt,
      ];
}

class UserProfileInclude extends _is.IncludeObject {
  UserProfileInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => UserProfile.t;
}

class UserProfileIncludeList extends _is.IncludeList {
  UserProfileIncludeList._({
    _is.WhereExpressionBuilder<UserProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserProfile.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => UserProfile.t;
}

class UserProfileRepository {
  const UserProfileRepository._();

  /// Returns a list of [UserProfile]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<UserProfile>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [UserProfile] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<UserProfile?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserProfileTable>? where,
    int? offset,
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserProfile] by its [id] or null if no such row exists.
  Future<UserProfile?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [UserProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> insert(
    _is.DatabaseSession session,
    List<UserProfile> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<UserProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [UserProfile] and returns the inserted row.
  ///
  /// The returned [UserProfile] will have its `id` field set.
  Future<UserProfile> insertRow(
    _is.DatabaseSession session,
    UserProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [UserProfile]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [UserProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> upsert(
    _is.DatabaseSession session,
    List<UserProfile> rows, {
    required _is.ColumnSelections<UserProfileTable> conflictColumns,
    _is.ColumnSelections<UserProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<UserProfileTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<UserProfile>(
      rows,
      conflictColumns: conflictColumns(UserProfile.t),
      updateColumns: updateColumns?.call(UserProfile.t),
      updateWhere: updateWhere?.call(UserProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [UserProfile] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [UserProfile] will have its `id` field set.
  Future<UserProfile?> upsertRow(
    _is.DatabaseSession session,
    UserProfile row, {
    required _is.ColumnSelections<UserProfileTable> conflictColumns,
    _is.ColumnSelections<UserProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<UserProfileTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<UserProfile>(
      row,
      conflictColumns: conflictColumns(UserProfile.t),
      updateColumns: updateColumns?.call(UserProfile.t),
      updateWhere: updateWhere?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  /// Updates all [UserProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> update(
    _is.DatabaseSession session,
    List<UserProfile> rows, {
    _is.ColumnSelections<UserProfileTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<UserProfile>(
      rows,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [UserProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserProfile> updateRow(
    _is.DatabaseSession session,
    UserProfile row, {
    _is.ColumnSelections<UserProfileTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserProfile>(
      row,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserProfile?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<UserProfileUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<UserProfile>(
      id,
      columnValues: columnValues(UserProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<UserProfileUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<UserProfileTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<UserProfile>(
      columnValues: columnValues(UserProfile.t.updateTable),
      where: where(UserProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [UserProfile]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> delete(
    _is.DatabaseSession session,
    List<UserProfile> rows, {
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<UserProfile>(
      rows,
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [UserProfile].
  Future<UserProfile> deleteRow(
    _is.DatabaseSession session,
    UserProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserProfile>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserProfileTable> where,
    _is.OrderByBuilder<UserProfileTable>? orderBy,
    _is.OrderByListBuilder<UserProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<UserProfile>(
      where: where(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<UserProfile>(
      where: where?.call(UserProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserProfileTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserProfile>(
      where: where(UserProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
