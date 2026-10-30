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

abstract class AbuseReport
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  AbuseReport._({
    this.id,
    required this.reporterUserId,
    required this.reporterUserName,
    required this.targetType,
    required this.targetId,
    required this.reason,
    required this.status,
    required this.createdAt,
  });

  factory AbuseReport({
    int? id,
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
    required String status,
    required DateTime createdAt,
  }) = _AbuseReportImpl;

  factory AbuseReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return AbuseReport(
      id: jsonSerialization['id'] as int?,
      reporterUserId: jsonSerialization['reporterUserId'] as int,
      reporterUserName: jsonSerialization['reporterUserName'] as String,
      targetType: jsonSerialization['targetType'] as String,
      targetId: jsonSerialization['targetId'] as int,
      reason: jsonSerialization['reason'] as String,
      status: jsonSerialization['status'] as String,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = AbuseReportTable();

  static const db = AbuseReportRepository._();

  @override
  int? id;

  int reporterUserId;

  String reporterUserName;

  String targetType;

  int targetId;

  String reason;

  String status;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [AbuseReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AbuseReport copyWith({
    int? id,
    int? reporterUserId,
    String? reporterUserName,
    String? targetType,
    int? targetId,
    String? reason,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AbuseReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'reporterUserName': reporterUserName,
      'targetType': targetType,
      'targetId': targetId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AbuseReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'reporterUserName': reporterUserName,
      'targetType': targetType,
      'targetId': targetId,
      'reason': reason,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  static AbuseReportInclude include() {
    return AbuseReportInclude._();
  }

  static AbuseReportIncludeList includeList({
    _is.WhereExpressionBuilder<AbuseReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    AbuseReportInclude? include,
  }) {
    return AbuseReportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AbuseReportImpl extends AbuseReport {
  _AbuseReportImpl({
    int? id,
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
    required String status,
    required DateTime createdAt,
  }) : super._(
          id: id,
          reporterUserId: reporterUserId,
          reporterUserName: reporterUserName,
          targetType: targetType,
          targetId: targetId,
          reason: reason,
          status: status,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [AbuseReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AbuseReport copyWith({
    Object? id = _Undefined,
    int? reporterUserId,
    String? reporterUserName,
    String? targetType,
    int? targetId,
    String? reason,
    String? status,
    DateTime? createdAt,
  }) {
    return AbuseReport(
      id: id is int? ? id : this.id,
      reporterUserId: reporterUserId ?? this.reporterUserId,
      reporterUserName: reporterUserName ?? this.reporterUserName,
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AbuseReportUpdateTable extends _is.UpdateTable<AbuseReportTable> {
  AbuseReportUpdateTable(super.table);

  _is.ColumnValue<int, int> reporterUserId(int value) => _is.ColumnValue(
        table.reporterUserId,
        value,
      );

  _is.ColumnValue<String, String> reporterUserName(String value) =>
      _is.ColumnValue(
        table.reporterUserName,
        value,
      );

  _is.ColumnValue<String, String> targetType(String value) => _is.ColumnValue(
        table.targetType,
        value,
      );

  _is.ColumnValue<int, int> targetId(int value) => _is.ColumnValue(
        table.targetId,
        value,
      );

  _is.ColumnValue<String, String> reason(String value) => _is.ColumnValue(
        table.reason,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
        table.status,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class AbuseReportTable extends _is.Table<int?> {
  AbuseReportTable({super.tableRelation}) : super(tableName: 'abuse_report') {
    updateTable = AbuseReportUpdateTable(this);
    reporterUserId = _is.ColumnInt(
      'reporterUserId',
      this,
    );
    reporterUserName = _is.ColumnString(
      'reporterUserName',
      this,
    );
    targetType = _is.ColumnString(
      'targetType',
      this,
    );
    targetId = _is.ColumnInt(
      'targetId',
      this,
    );
    reason = _is.ColumnString(
      'reason',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final AbuseReportUpdateTable updateTable;

  late final _is.ColumnInt reporterUserId;

  late final _is.ColumnString reporterUserName;

  late final _is.ColumnString targetType;

  late final _is.ColumnInt targetId;

  late final _is.ColumnString reason;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        reporterUserId,
        reporterUserName,
        targetType,
        targetId,
        reason,
        status,
        createdAt,
      ];
}

class AbuseReportInclude extends _is.IncludeObject {
  AbuseReportInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => AbuseReport.t;
}

class AbuseReportIncludeList extends _is.IncludeList {
  AbuseReportIncludeList._({
    _is.WhereExpressionBuilder<AbuseReportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AbuseReport.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => AbuseReport.t;
}

class AbuseReportRepository {
  const AbuseReportRepository._();

  /// Returns a list of [AbuseReport]s matching the given query parameters.
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
  Future<List<AbuseReport>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AbuseReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AbuseReport>(
      where: where?.call(AbuseReport.t),
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AbuseReport] matching the given query parameters.
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
  Future<AbuseReport?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AbuseReportTable>? where,
    int? offset,
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AbuseReport>(
      where: where?.call(AbuseReport.t),
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AbuseReport] by its [id] or null if no such row exists.
  Future<AbuseReport?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AbuseReport>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AbuseReport]s in the list and returns the inserted rows.
  ///
  /// The returned [AbuseReport]s will have their `id` fields set.
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
  Future<List<AbuseReport>> insert(
    _is.DatabaseSession session,
    List<AbuseReport> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<AbuseReport>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [AbuseReport] and returns the inserted row.
  ///
  /// The returned [AbuseReport] will have its `id` field set.
  Future<AbuseReport> insertRow(
    _is.DatabaseSession session,
    AbuseReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<AbuseReport>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [AbuseReport]s in the list and returns the resulting rows.
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
  /// The returned [AbuseReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AbuseReport>> upsert(
    _is.DatabaseSession session,
    List<AbuseReport> rows, {
    required _is.ColumnSelections<AbuseReportTable> conflictColumns,
    _is.ColumnSelections<AbuseReportTable>? updateColumns,
    _is.WhereExpressionBuilder<AbuseReportTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<AbuseReport>(
      rows,
      conflictColumns: conflictColumns(AbuseReport.t),
      updateColumns: updateColumns?.call(AbuseReport.t),
      updateWhere: updateWhere?.call(AbuseReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [AbuseReport] and returns the resulting row.
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
  /// The returned [AbuseReport] will have its `id` field set.
  Future<AbuseReport?> upsertRow(
    _is.DatabaseSession session,
    AbuseReport row, {
    required _is.ColumnSelections<AbuseReportTable> conflictColumns,
    _is.ColumnSelections<AbuseReportTable>? updateColumns,
    _is.WhereExpressionBuilder<AbuseReportTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<AbuseReport>(
      row,
      conflictColumns: conflictColumns(AbuseReport.t),
      updateColumns: updateColumns?.call(AbuseReport.t),
      updateWhere: updateWhere?.call(AbuseReport.t),
      transaction: transaction,
    );
  }

  /// Updates all [AbuseReport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AbuseReport>> update(
    _is.DatabaseSession session,
    List<AbuseReport> rows, {
    _is.ColumnSelections<AbuseReportTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<AbuseReport>(
      rows,
      columns: columns?.call(AbuseReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [AbuseReport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AbuseReport> updateRow(
    _is.DatabaseSession session,
    AbuseReport row, {
    _is.ColumnSelections<AbuseReportTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<AbuseReport>(
      row,
      columns: columns?.call(AbuseReport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AbuseReport] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AbuseReport?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<AbuseReportUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<AbuseReport>(
      id,
      columnValues: columnValues(AbuseReport.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AbuseReport]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AbuseReport>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AbuseReportUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<AbuseReportTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<AbuseReport>(
      columnValues: columnValues(AbuseReport.t.updateTable),
      where: where(AbuseReport.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [AbuseReport]s in the list and returns the deleted rows.
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
  Future<List<AbuseReport>> delete(
    _is.DatabaseSession session,
    List<AbuseReport> rows, {
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<AbuseReport>(
      rows,
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [AbuseReport].
  Future<AbuseReport> deleteRow(
    _is.DatabaseSession session,
    AbuseReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AbuseReport>(
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
  Future<List<AbuseReport>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AbuseReportTable> where,
    _is.OrderByBuilder<AbuseReportTable>? orderBy,
    _is.OrderByListBuilder<AbuseReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<AbuseReport>(
      where: where(AbuseReport.t),
      orderBy: orderBy?.call(AbuseReport.t),
      orderByList: orderByList?.call(AbuseReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AbuseReportTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<AbuseReport>(
      where: where?.call(AbuseReport.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AbuseReport] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AbuseReportTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AbuseReport>(
      where: where(AbuseReport.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
