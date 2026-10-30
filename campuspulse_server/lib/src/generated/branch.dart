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

abstract class Branch implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Branch._({
    this.id,
    required this.collegeId,
    required this.name,
    required this.code,
    required this.degree,
  });

  factory Branch({
    int? id,
    required int collegeId,
    required String name,
    required String code,
    required String degree,
  }) = _BranchImpl;

  factory Branch.fromJson(Map<String, dynamic> jsonSerialization) {
    return Branch(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      degree: jsonSerialization['degree'] as String,
    );
  }

  static final t = BranchTable();

  static const db = BranchRepository._();

  @override
  int? id;

  int collegeId;

  String name;

  String code;

  String degree;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Branch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Branch copyWith({
    int? id,
    int? collegeId,
    String? name,
    String? code,
    String? degree,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Branch',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'name': name,
      'code': code,
      'degree': degree,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Branch',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'name': name,
      'code': code,
      'degree': degree,
    };
  }

  static BranchInclude include() {
    return BranchInclude._();
  }

  static BranchIncludeList includeList({
    _is.WhereExpressionBuilder<BranchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    BranchInclude? include,
  }) {
    return BranchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BranchImpl extends Branch {
  _BranchImpl({
    int? id,
    required int collegeId,
    required String name,
    required String code,
    required String degree,
  }) : super._(
          id: id,
          collegeId: collegeId,
          name: name,
          code: code,
          degree: degree,
        );

  /// Returns a shallow copy of this [Branch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Branch copyWith({
    Object? id = _Undefined,
    int? collegeId,
    String? name,
    String? code,
    String? degree,
  }) {
    return Branch(
      id: id is int? ? id : this.id,
      collegeId: collegeId ?? this.collegeId,
      name: name ?? this.name,
      code: code ?? this.code,
      degree: degree ?? this.degree,
    );
  }
}

class BranchUpdateTable extends _is.UpdateTable<BranchTable> {
  BranchUpdateTable(super.table);

  _is.ColumnValue<int, int> collegeId(int value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
        table.name,
        value,
      );

  _is.ColumnValue<String, String> code(String value) => _is.ColumnValue(
        table.code,
        value,
      );

  _is.ColumnValue<String, String> degree(String value) => _is.ColumnValue(
        table.degree,
        value,
      );
}

class BranchTable extends _is.Table<int?> {
  BranchTable({super.tableRelation}) : super(tableName: 'branch') {
    updateTable = BranchUpdateTable(this);
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    code = _is.ColumnString(
      'code',
      this,
    );
    degree = _is.ColumnString(
      'degree',
      this,
    );
  }

  late final BranchUpdateTable updateTable;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnString name;

  late final _is.ColumnString code;

  late final _is.ColumnString degree;

  @override
  List<_is.Column> get columns => [
        id,
        collegeId,
        name,
        code,
        degree,
      ];
}

class BranchInclude extends _is.IncludeObject {
  BranchInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Branch.t;
}

class BranchIncludeList extends _is.IncludeList {
  BranchIncludeList._({
    _is.WhereExpressionBuilder<BranchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Branch.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Branch.t;
}

class BranchRepository {
  const BranchRepository._();

  /// Returns a list of [Branch]s matching the given query parameters.
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
  Future<List<Branch>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BranchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Branch>(
      where: where?.call(Branch.t),
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Branch] matching the given query parameters.
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
  Future<Branch?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BranchTable>? where,
    int? offset,
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Branch>(
      where: where?.call(Branch.t),
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Branch] by its [id] or null if no such row exists.
  Future<Branch?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Branch>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Branch]s in the list and returns the inserted rows.
  ///
  /// The returned [Branch]s will have their `id` fields set.
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
  Future<List<Branch>> insert(
    _is.DatabaseSession session,
    List<Branch> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Branch>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Branch] and returns the inserted row.
  ///
  /// The returned [Branch] will have its `id` field set.
  Future<Branch> insertRow(
    _is.DatabaseSession session,
    Branch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Branch>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Branch]s in the list and returns the resulting rows.
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
  /// The returned [Branch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Branch>> upsert(
    _is.DatabaseSession session,
    List<Branch> rows, {
    required _is.ColumnSelections<BranchTable> conflictColumns,
    _is.ColumnSelections<BranchTable>? updateColumns,
    _is.WhereExpressionBuilder<BranchTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Branch>(
      rows,
      conflictColumns: conflictColumns(Branch.t),
      updateColumns: updateColumns?.call(Branch.t),
      updateWhere: updateWhere?.call(Branch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Branch] and returns the resulting row.
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
  /// The returned [Branch] will have its `id` field set.
  Future<Branch?> upsertRow(
    _is.DatabaseSession session,
    Branch row, {
    required _is.ColumnSelections<BranchTable> conflictColumns,
    _is.ColumnSelections<BranchTable>? updateColumns,
    _is.WhereExpressionBuilder<BranchTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Branch>(
      row,
      conflictColumns: conflictColumns(Branch.t),
      updateColumns: updateColumns?.call(Branch.t),
      updateWhere: updateWhere?.call(Branch.t),
      transaction: transaction,
    );
  }

  /// Updates all [Branch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Branch>> update(
    _is.DatabaseSession session,
    List<Branch> rows, {
    _is.ColumnSelections<BranchTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Branch>(
      rows,
      columns: columns?.call(Branch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Branch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Branch> updateRow(
    _is.DatabaseSession session,
    Branch row, {
    _is.ColumnSelections<BranchTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Branch>(
      row,
      columns: columns?.call(Branch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Branch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Branch?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BranchUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Branch>(
      id,
      columnValues: columnValues(Branch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Branch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Branch>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BranchUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BranchTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Branch>(
      columnValues: columnValues(Branch.t.updateTable),
      where: where(Branch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Branch]s in the list and returns the deleted rows.
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
  Future<List<Branch>> delete(
    _is.DatabaseSession session,
    List<Branch> rows, {
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Branch>(
      rows,
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Branch].
  Future<Branch> deleteRow(
    _is.DatabaseSession session,
    Branch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Branch>(
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
  Future<List<Branch>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BranchTable> where,
    _is.OrderByBuilder<BranchTable>? orderBy,
    _is.OrderByListBuilder<BranchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Branch>(
      where: where(Branch.t),
      orderBy: orderBy?.call(Branch.t),
      orderByList: orderByList?.call(Branch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BranchTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Branch>(
      where: where?.call(Branch.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Branch] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BranchTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Branch>(
      where: where(Branch.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
