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
import 'package:serverpod/serverpod.dart' as _is;

abstract class CommunityMember
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CommunityMember._({
    this.id,
    required this.communityId,
    required this.userId,
    required this.userName,
    required this.role,
    required this.joinedAt,
    required this.isApproved,
  });

  factory CommunityMember({
    int? id,
    required int communityId,
    required int userId,
    required String userName,
    required String role,
    required DateTime joinedAt,
    required bool isApproved,
  }) = _CommunityMemberImpl;

  factory CommunityMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityMember(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      role: jsonSerialization['role'] as String,
      joinedAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
      isApproved:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isApproved']),
    );
  }

  static final t = CommunityMemberTable();

  static const db = CommunityMemberRepository._();

  @override
  int? id;

  int communityId;

  int userId;

  String userName;

  String role;

  DateTime joinedAt;

  bool isApproved;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CommunityMember copyWith({
    int? id,
    int? communityId,
    int? userId,
    String? userName,
    String? role,
    DateTime? joinedAt,
    bool? isApproved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'userId': userId,
      'userName': userName,
      'role': role,
      'joinedAt': joinedAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'userId': userId,
      'userName': userName,
      'role': role,
      'joinedAt': joinedAt.toJson(),
      'isApproved': isApproved,
    };
  }

  static CommunityMemberInclude include() {
    return CommunityMemberInclude._();
  }

  static CommunityMemberIncludeList includeList({
    _is.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    CommunityMemberInclude? include,
  }) {
    return CommunityMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityMemberImpl extends CommunityMember {
  _CommunityMemberImpl({
    int? id,
    required int communityId,
    required int userId,
    required String userName,
    required String role,
    required DateTime joinedAt,
    required bool isApproved,
  }) : super._(
          id: id,
          communityId: communityId,
          userId: userId,
          userName: userName,
          role: role,
          joinedAt: joinedAt,
          isApproved: isApproved,
        );

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CommunityMember copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? userId,
    String? userName,
    String? role,
    DateTime? joinedAt,
    bool? isApproved,
  }) {
    return CommunityMember(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
      isApproved: isApproved ?? this.isApproved,
    );
  }
}

class CommunityMemberUpdateTable extends _is.UpdateTable<CommunityMemberTable> {
  CommunityMemberUpdateTable(super.table);

  _is.ColumnValue<int, int> communityId(int value) => _is.ColumnValue(
        table.communityId,
        value,
      );

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> userName(String value) => _is.ColumnValue(
        table.userName,
        value,
      );

  _is.ColumnValue<String, String> role(String value) => _is.ColumnValue(
        table.role,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> joinedAt(DateTime value) =>
      _is.ColumnValue(
        table.joinedAt,
        value,
      );

  _is.ColumnValue<bool, bool> isApproved(bool value) => _is.ColumnValue(
        table.isApproved,
        value,
      );
}

class CommunityMemberTable extends _is.Table<int?> {
  CommunityMemberTable({super.tableRelation})
      : super(tableName: 'community_member') {
    updateTable = CommunityMemberUpdateTable(this);
    communityId = _is.ColumnInt(
      'communityId',
      this,
    );
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    userName = _is.ColumnString(
      'userName',
      this,
    );
    role = _is.ColumnString(
      'role',
      this,
    );
    joinedAt = _is.ColumnDateTime(
      'joinedAt',
      this,
    );
    isApproved = _is.ColumnBool(
      'isApproved',
      this,
    );
  }

  late final CommunityMemberUpdateTable updateTable;

  late final _is.ColumnInt communityId;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userName;

  late final _is.ColumnString role;

  late final _is.ColumnDateTime joinedAt;

  late final _is.ColumnBool isApproved;

  @override
  List<_is.Column> get columns => [
        id,
        communityId,
        userId,
        userName,
        role,
        joinedAt,
        isApproved,
      ];
}

class CommunityMemberInclude extends _is.IncludeObject {
  CommunityMemberInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CommunityMember.t;
}

class CommunityMemberIncludeList extends _is.IncludeList {
  CommunityMemberIncludeList._({
    _is.WhereExpressionBuilder<CommunityMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityMember.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CommunityMember.t;
}

class CommunityMemberRepository {
  const CommunityMemberRepository._();

  /// Returns a list of [CommunityMember]s matching the given query parameters.
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
  Future<List<CommunityMember>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityMember>(
      where: where?.call(CommunityMember.t),
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityMember] matching the given query parameters.
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
  Future<CommunityMember?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? offset,
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityMember>(
      where: where?.call(CommunityMember.t),
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityMember] by its [id] or null if no such row exists.
  Future<CommunityMember?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityMember>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityMember]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityMember]s will have their `id` fields set.
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
  Future<List<CommunityMember>> insert(
    _is.DatabaseSession session,
    List<CommunityMember> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CommunityMember>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CommunityMember] and returns the inserted row.
  ///
  /// The returned [CommunityMember] will have its `id` field set.
  Future<CommunityMember> insertRow(
    _is.DatabaseSession session,
    CommunityMember row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityMember>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CommunityMember]s in the list and returns the resulting rows.
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
  /// The returned [CommunityMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityMember>> upsert(
    _is.DatabaseSession session,
    List<CommunityMember> rows, {
    required _is.ColumnSelections<CommunityMemberTable> conflictColumns,
    _is.ColumnSelections<CommunityMemberTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityMemberTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CommunityMember>(
      rows,
      conflictColumns: conflictColumns(CommunityMember.t),
      updateColumns: updateColumns?.call(CommunityMember.t),
      updateWhere: updateWhere?.call(CommunityMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CommunityMember] and returns the resulting row.
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
  /// The returned [CommunityMember] will have its `id` field set.
  Future<CommunityMember?> upsertRow(
    _is.DatabaseSession session,
    CommunityMember row, {
    required _is.ColumnSelections<CommunityMemberTable> conflictColumns,
    _is.ColumnSelections<CommunityMemberTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityMemberTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CommunityMember>(
      row,
      conflictColumns: conflictColumns(CommunityMember.t),
      updateColumns: updateColumns?.call(CommunityMember.t),
      updateWhere: updateWhere?.call(CommunityMember.t),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityMember>> update(
    _is.DatabaseSession session,
    List<CommunityMember> rows, {
    _is.ColumnSelections<CommunityMemberTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CommunityMember>(
      rows,
      columns: columns?.call(CommunityMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CommunityMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityMember> updateRow(
    _is.DatabaseSession session,
    CommunityMember row, {
    _is.ColumnSelections<CommunityMemberTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityMember>(
      row,
      columns: columns?.call(CommunityMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityMember] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityMember?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommunityMemberUpdateTable>
        columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityMember>(
      id,
      columnValues: columnValues(CommunityMember.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityMember]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityMember>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommunityMemberUpdateTable>
        columnValues,
    required _is.WhereExpressionBuilder<CommunityMemberTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CommunityMember>(
      columnValues: columnValues(CommunityMember.t.updateTable),
      where: where(CommunityMember.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CommunityMember]s in the list and returns the deleted rows.
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
  Future<List<CommunityMember>> delete(
    _is.DatabaseSession session,
    List<CommunityMember> rows, {
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CommunityMember>(
      rows,
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CommunityMember].
  Future<CommunityMember> deleteRow(
    _is.DatabaseSession session,
    CommunityMember row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityMember>(
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
  Future<List<CommunityMember>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityMemberTable> where,
    _is.OrderByBuilder<CommunityMemberTable>? orderBy,
    _is.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CommunityMember>(
      where: where(CommunityMember.t),
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CommunityMember>(
      where: where?.call(CommunityMember.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityMember] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityMemberTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityMember>(
      where: where(CommunityMember.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
