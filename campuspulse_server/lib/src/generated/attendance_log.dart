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

abstract class AttendanceLog
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  AttendanceLog._({
    this.id,
    required this.userId,
    required this.subjectId,
    required this.date,
    required this.status,
    required this.source,
  });

  factory AttendanceLog({
    int? id,
    required int userId,
    required int subjectId,
    required DateTime date,
    required String status,
    required String source,
  }) = _AttendanceLogImpl;

  factory AttendanceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return AttendanceLog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      subjectId: jsonSerialization['subjectId'] as int,
      date: _is.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      status: jsonSerialization['status'] as String,
      source: jsonSerialization['source'] as String,
    );
  }

  static final t = AttendanceLogTable();

  static const db = AttendanceLogRepository._();

  @override
  int? id;

  int userId;

  int subjectId;

  DateTime date;

  String status;

  String source;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [AttendanceLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AttendanceLog copyWith({
    int? id,
    int? userId,
    int? subjectId,
    DateTime? date,
    String? status,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AttendanceLog',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'date': date.toJson(),
      'status': status,
      'source': source,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AttendanceLog',
      if (id != null) 'id': id,
      'userId': userId,
      'subjectId': subjectId,
      'date': date.toJson(),
      'status': status,
      'source': source,
    };
  }

  static AttendanceLogInclude include() {
    return AttendanceLogInclude._();
  }

  static AttendanceLogIncludeList includeList({
    _is.WhereExpressionBuilder<AttendanceLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    AttendanceLogInclude? include,
  }) {
    return AttendanceLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AttendanceLogImpl extends AttendanceLog {
  _AttendanceLogImpl({
    int? id,
    required int userId,
    required int subjectId,
    required DateTime date,
    required String status,
    required String source,
  }) : super._(
          id: id,
          userId: userId,
          subjectId: subjectId,
          date: date,
          status: status,
          source: source,
        );

  /// Returns a shallow copy of this [AttendanceLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AttendanceLog copyWith({
    Object? id = _Undefined,
    int? userId,
    int? subjectId,
    DateTime? date,
    String? status,
    String? source,
  }) {
    return AttendanceLog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      subjectId: subjectId ?? this.subjectId,
      date: date ?? this.date,
      status: status ?? this.status,
      source: source ?? this.source,
    );
  }
}

class AttendanceLogUpdateTable extends _is.UpdateTable<AttendanceLogTable> {
  AttendanceLogUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<int, int> subjectId(int value) => _is.ColumnValue(
        table.subjectId,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> date(DateTime value) => _is.ColumnValue(
        table.date,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
        table.status,
        value,
      );

  _is.ColumnValue<String, String> source(String value) => _is.ColumnValue(
        table.source,
        value,
      );
}

class AttendanceLogTable extends _is.Table<int?> {
  AttendanceLogTable({super.tableRelation})
      : super(tableName: 'attendance_log') {
    updateTable = AttendanceLogUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    subjectId = _is.ColumnInt(
      'subjectId',
      this,
    );
    date = _is.ColumnDateTime(
      'date',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    source = _is.ColumnString(
      'source',
      this,
    );
  }

  late final AttendanceLogUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnInt subjectId;

  late final _is.ColumnDateTime date;

  late final _is.ColumnString status;

  late final _is.ColumnString source;

  @override
  List<_is.Column> get columns => [
        id,
        userId,
        subjectId,
        date,
        status,
        source,
      ];
}

class AttendanceLogInclude extends _is.IncludeObject {
  AttendanceLogInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => AttendanceLog.t;
}

class AttendanceLogIncludeList extends _is.IncludeList {
  AttendanceLogIncludeList._({
    _is.WhereExpressionBuilder<AttendanceLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AttendanceLog.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => AttendanceLog.t;
}

class AttendanceLogRepository {
  const AttendanceLogRepository._();

  /// Returns a list of [AttendanceLog]s matching the given query parameters.
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
  Future<List<AttendanceLog>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AttendanceLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AttendanceLog>(
      where: where?.call(AttendanceLog.t),
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AttendanceLog] matching the given query parameters.
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
  Future<AttendanceLog?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AttendanceLogTable>? where,
    int? offset,
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AttendanceLog>(
      where: where?.call(AttendanceLog.t),
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AttendanceLog] by its [id] or null if no such row exists.
  Future<AttendanceLog?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AttendanceLog>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AttendanceLog]s in the list and returns the inserted rows.
  ///
  /// The returned [AttendanceLog]s will have their `id` fields set.
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
  Future<List<AttendanceLog>> insert(
    _is.DatabaseSession session,
    List<AttendanceLog> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<AttendanceLog>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [AttendanceLog] and returns the inserted row.
  ///
  /// The returned [AttendanceLog] will have its `id` field set.
  Future<AttendanceLog> insertRow(
    _is.DatabaseSession session,
    AttendanceLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<AttendanceLog>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [AttendanceLog]s in the list and returns the resulting rows.
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
  /// The returned [AttendanceLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AttendanceLog>> upsert(
    _is.DatabaseSession session,
    List<AttendanceLog> rows, {
    required _is.ColumnSelections<AttendanceLogTable> conflictColumns,
    _is.ColumnSelections<AttendanceLogTable>? updateColumns,
    _is.WhereExpressionBuilder<AttendanceLogTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<AttendanceLog>(
      rows,
      conflictColumns: conflictColumns(AttendanceLog.t),
      updateColumns: updateColumns?.call(AttendanceLog.t),
      updateWhere: updateWhere?.call(AttendanceLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [AttendanceLog] and returns the resulting row.
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
  /// The returned [AttendanceLog] will have its `id` field set.
  Future<AttendanceLog?> upsertRow(
    _is.DatabaseSession session,
    AttendanceLog row, {
    required _is.ColumnSelections<AttendanceLogTable> conflictColumns,
    _is.ColumnSelections<AttendanceLogTable>? updateColumns,
    _is.WhereExpressionBuilder<AttendanceLogTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<AttendanceLog>(
      row,
      conflictColumns: conflictColumns(AttendanceLog.t),
      updateColumns: updateColumns?.call(AttendanceLog.t),
      updateWhere: updateWhere?.call(AttendanceLog.t),
      transaction: transaction,
    );
  }

  /// Updates all [AttendanceLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AttendanceLog>> update(
    _is.DatabaseSession session,
    List<AttendanceLog> rows, {
    _is.ColumnSelections<AttendanceLogTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<AttendanceLog>(
      rows,
      columns: columns?.call(AttendanceLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [AttendanceLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AttendanceLog> updateRow(
    _is.DatabaseSession session,
    AttendanceLog row, {
    _is.ColumnSelections<AttendanceLogTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<AttendanceLog>(
      row,
      columns: columns?.call(AttendanceLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AttendanceLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AttendanceLog?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<AttendanceLogUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<AttendanceLog>(
      id,
      columnValues: columnValues(AttendanceLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AttendanceLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AttendanceLog>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AttendanceLogUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<AttendanceLogTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<AttendanceLog>(
      columnValues: columnValues(AttendanceLog.t.updateTable),
      where: where(AttendanceLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [AttendanceLog]s in the list and returns the deleted rows.
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
  Future<List<AttendanceLog>> delete(
    _is.DatabaseSession session,
    List<AttendanceLog> rows, {
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<AttendanceLog>(
      rows,
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [AttendanceLog].
  Future<AttendanceLog> deleteRow(
    _is.DatabaseSession session,
    AttendanceLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AttendanceLog>(
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
  Future<List<AttendanceLog>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AttendanceLogTable> where,
    _is.OrderByBuilder<AttendanceLogTable>? orderBy,
    _is.OrderByListBuilder<AttendanceLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<AttendanceLog>(
      where: where(AttendanceLog.t),
      orderBy: orderBy?.call(AttendanceLog.t),
      orderByList: orderByList?.call(AttendanceLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AttendanceLogTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<AttendanceLog>(
      where: where?.call(AttendanceLog.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AttendanceLog] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AttendanceLogTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AttendanceLog>(
      where: where(AttendanceLog.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
