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

abstract class Requirement
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      requiredSkills: _i3yc8a0r.Protocol()
          .deserialize<List<String>>(jsonSerialization['requiredSkills']),
      preferredSkills: _i3yc8a0r.Protocol()
          .deserialize<List<String>>(jsonSerialization['preferredSkills']),
      teamSizeNeeded: jsonSerialization['teamSizeNeeded'] as int,
      deadline: jsonSerialization['deadline'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      preferredBranch: jsonSerialization['preferredBranch'] as String?,
      preferredYear: jsonSerialization['preferredYear'] as int?,
      proximity: jsonSerialization['proximity'] as String?,
      isActive: _is.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = RequirementTable();

  static const db = RequirementRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Requirement]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static RequirementInclude include() {
    return RequirementInclude._();
  }

  static RequirementIncludeList includeList({
    _is.WhereExpressionBuilder<RequirementTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    RequirementInclude? include,
  }) {
    return RequirementIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class RequirementUpdateTable extends _is.UpdateTable<RequirementTable> {
  RequirementUpdateTable(super.table);

  _is.ColumnValue<int, int> creatorId(int value) => _is.ColumnValue(
        table.creatorId,
        value,
      );

  _is.ColumnValue<String, String> creatorName(String value) => _is.ColumnValue(
        table.creatorName,
        value,
      );

  _is.ColumnValue<String, String> creatorCollege(String value) =>
      _is.ColumnValue(
        table.creatorCollege,
        value,
      );

  _is.ColumnValue<String, String> creatorBranch(String value) =>
      _is.ColumnValue(
        table.creatorBranch,
        value,
      );

  _is.ColumnValue<int, int> creatorYear(int value) => _is.ColumnValue(
        table.creatorYear,
        value,
      );

  _is.ColumnValue<String, String> purpose(String value) => _is.ColumnValue(
        table.purpose,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
        table.title,
        value,
      );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
        table.description,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> requiredSkills(
          List<String> value) =>
      _is.ColumnValue(
        table.requiredSkills,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> preferredSkills(
          List<String> value) =>
      _is.ColumnValue(
        table.preferredSkills,
        value,
      );

  _is.ColumnValue<int, int> teamSizeNeeded(int value) => _is.ColumnValue(
        table.teamSizeNeeded,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> deadline(DateTime? value) =>
      _is.ColumnValue(
        table.deadline,
        value,
      );

  _is.ColumnValue<String, String> preferredBranch(String? value) =>
      _is.ColumnValue(
        table.preferredBranch,
        value,
      );

  _is.ColumnValue<int, int> preferredYear(int? value) => _is.ColumnValue(
        table.preferredYear,
        value,
      );

  _is.ColumnValue<String, String> proximity(String? value) => _is.ColumnValue(
        table.proximity,
        value,
      );

  _is.ColumnValue<bool, bool> isActive(bool value) => _is.ColumnValue(
        table.isActive,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RequirementTable extends _is.Table<int?> {
  RequirementTable({super.tableRelation}) : super(tableName: 'requirement') {
    updateTable = RequirementUpdateTable(this);
    creatorId = _is.ColumnInt(
      'creatorId',
      this,
    );
    creatorName = _is.ColumnString(
      'creatorName',
      this,
    );
    creatorCollege = _is.ColumnString(
      'creatorCollege',
      this,
    );
    creatorBranch = _is.ColumnString(
      'creatorBranch',
      this,
    );
    creatorYear = _is.ColumnInt(
      'creatorYear',
      this,
    );
    purpose = _is.ColumnString(
      'purpose',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    requiredSkills = _is.ColumnSerializable<List<String>>(
      'requiredSkills',
      this,
    );
    preferredSkills = _is.ColumnSerializable<List<String>>(
      'preferredSkills',
      this,
    );
    teamSizeNeeded = _is.ColumnInt(
      'teamSizeNeeded',
      this,
    );
    deadline = _is.ColumnDateTime(
      'deadline',
      this,
    );
    preferredBranch = _is.ColumnString(
      'preferredBranch',
      this,
    );
    preferredYear = _is.ColumnInt(
      'preferredYear',
      this,
    );
    proximity = _is.ColumnString(
      'proximity',
      this,
    );
    isActive = _is.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RequirementUpdateTable updateTable;

  late final _is.ColumnInt creatorId;

  late final _is.ColumnString creatorName;

  late final _is.ColumnString creatorCollege;

  late final _is.ColumnString creatorBranch;

  late final _is.ColumnInt creatorYear;

  late final _is.ColumnString purpose;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnSerializable<List<String>> requiredSkills;

  late final _is.ColumnSerializable<List<String>> preferredSkills;

  late final _is.ColumnInt teamSizeNeeded;

  late final _is.ColumnDateTime deadline;

  late final _is.ColumnString preferredBranch;

  late final _is.ColumnInt preferredYear;

  late final _is.ColumnString proximity;

  late final _is.ColumnBool isActive;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        creatorId,
        creatorName,
        creatorCollege,
        creatorBranch,
        creatorYear,
        purpose,
        title,
        description,
        requiredSkills,
        preferredSkills,
        teamSizeNeeded,
        deadline,
        preferredBranch,
        preferredYear,
        proximity,
        isActive,
        createdAt,
      ];
}

class RequirementInclude extends _is.IncludeObject {
  RequirementInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Requirement.t;
}

class RequirementIncludeList extends _is.IncludeList {
  RequirementIncludeList._({
    _is.WhereExpressionBuilder<RequirementTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Requirement.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Requirement.t;
}

class RequirementRepository {
  const RequirementRepository._();

  /// Returns a list of [Requirement]s matching the given query parameters.
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
  Future<List<Requirement>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequirementTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Requirement>(
      where: where?.call(Requirement.t),
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Requirement] matching the given query parameters.
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
  Future<Requirement?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequirementTable>? where,
    int? offset,
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Requirement>(
      where: where?.call(Requirement.t),
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Requirement] by its [id] or null if no such row exists.
  Future<Requirement?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Requirement>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Requirement]s in the list and returns the inserted rows.
  ///
  /// The returned [Requirement]s will have their `id` fields set.
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
  Future<List<Requirement>> insert(
    _is.DatabaseSession session,
    List<Requirement> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Requirement>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Requirement] and returns the inserted row.
  ///
  /// The returned [Requirement] will have its `id` field set.
  Future<Requirement> insertRow(
    _is.DatabaseSession session,
    Requirement row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Requirement>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Requirement]s in the list and returns the resulting rows.
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
  /// The returned [Requirement]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Requirement>> upsert(
    _is.DatabaseSession session,
    List<Requirement> rows, {
    required _is.ColumnSelections<RequirementTable> conflictColumns,
    _is.ColumnSelections<RequirementTable>? updateColumns,
    _is.WhereExpressionBuilder<RequirementTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Requirement>(
      rows,
      conflictColumns: conflictColumns(Requirement.t),
      updateColumns: updateColumns?.call(Requirement.t),
      updateWhere: updateWhere?.call(Requirement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Requirement] and returns the resulting row.
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
  /// The returned [Requirement] will have its `id` field set.
  Future<Requirement?> upsertRow(
    _is.DatabaseSession session,
    Requirement row, {
    required _is.ColumnSelections<RequirementTable> conflictColumns,
    _is.ColumnSelections<RequirementTable>? updateColumns,
    _is.WhereExpressionBuilder<RequirementTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Requirement>(
      row,
      conflictColumns: conflictColumns(Requirement.t),
      updateColumns: updateColumns?.call(Requirement.t),
      updateWhere: updateWhere?.call(Requirement.t),
      transaction: transaction,
    );
  }

  /// Updates all [Requirement]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Requirement>> update(
    _is.DatabaseSession session,
    List<Requirement> rows, {
    _is.ColumnSelections<RequirementTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Requirement>(
      rows,
      columns: columns?.call(Requirement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Requirement]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Requirement> updateRow(
    _is.DatabaseSession session,
    Requirement row, {
    _is.ColumnSelections<RequirementTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Requirement>(
      row,
      columns: columns?.call(Requirement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Requirement] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Requirement?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RequirementUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Requirement>(
      id,
      columnValues: columnValues(Requirement.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Requirement]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Requirement>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RequirementUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RequirementTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Requirement>(
      columnValues: columnValues(Requirement.t.updateTable),
      where: where(Requirement.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Requirement]s in the list and returns the deleted rows.
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
  Future<List<Requirement>> delete(
    _is.DatabaseSession session,
    List<Requirement> rows, {
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Requirement>(
      rows,
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Requirement].
  Future<Requirement> deleteRow(
    _is.DatabaseSession session,
    Requirement row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Requirement>(
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
  Future<List<Requirement>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RequirementTable> where,
    _is.OrderByBuilder<RequirementTable>? orderBy,
    _is.OrderByListBuilder<RequirementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Requirement>(
      where: where(Requirement.t),
      orderBy: orderBy?.call(Requirement.t),
      orderByList: orderByList?.call(Requirement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequirementTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Requirement>(
      where: where?.call(Requirement.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Requirement] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RequirementTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Requirement>(
      where: where(Requirement.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
