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

abstract class College
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  College._({
    this.id,
    required this.name,
    required this.code,
    required this.city,
    required this.state,
  });

  factory College({
    int? id,
    required String name,
    required String code,
    required String city,
    required String state,
  }) = _CollegeImpl;

  factory College.fromJson(Map<String, dynamic> jsonSerialization) {
    return College(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
    );
  }

  static final t = CollegeTable();

  static const db = CollegeRepository._();

  @override
  int? id;

  String name;

  String code;

  String city;

  String state;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [College]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  College copyWith({
    int? id,
    String? name,
    String? code,
    String? city,
    String? state,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'College',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'city': city,
      'state': state,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'College',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'city': city,
      'state': state,
    };
  }

  static CollegeInclude include() {
    return CollegeInclude._();
  }

  static CollegeIncludeList includeList({
    _is.WhereExpressionBuilder<CollegeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    CollegeInclude? include,
  }) {
    return CollegeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CollegeImpl extends College {
  _CollegeImpl({
    int? id,
    required String name,
    required String code,
    required String city,
    required String state,
  }) : super._(
          id: id,
          name: name,
          code: code,
          city: city,
          state: state,
        );

  /// Returns a shallow copy of this [College]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  College copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    String? city,
    String? state,
  }) {
    return College(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }
}

class CollegeUpdateTable extends _is.UpdateTable<CollegeTable> {
  CollegeUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
        table.name,
        value,
      );

  _is.ColumnValue<String, String> code(String value) => _is.ColumnValue(
        table.code,
        value,
      );

  _is.ColumnValue<String, String> city(String value) => _is.ColumnValue(
        table.city,
        value,
      );

  _is.ColumnValue<String, String> state(String value) => _is.ColumnValue(
        table.state,
        value,
      );
}

class CollegeTable extends _is.Table<int?> {
  CollegeTable({super.tableRelation}) : super(tableName: 'college') {
    updateTable = CollegeUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    code = _is.ColumnString(
      'code',
      this,
    );
    city = _is.ColumnString(
      'city',
      this,
    );
    state = _is.ColumnString(
      'state',
      this,
    );
  }

  late final CollegeUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString code;

  late final _is.ColumnString city;

  late final _is.ColumnString state;

  @override
  List<_is.Column> get columns => [
        id,
        name,
        code,
        city,
        state,
      ];
}

class CollegeInclude extends _is.IncludeObject {
  CollegeInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => College.t;
}

class CollegeIncludeList extends _is.IncludeList {
  CollegeIncludeList._({
    _is.WhereExpressionBuilder<CollegeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(College.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => College.t;
}

class CollegeRepository {
  const CollegeRepository._();

  /// Returns a list of [College]s matching the given query parameters.
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
  Future<List<College>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CollegeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<College>(
      where: where?.call(College.t),
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [College] matching the given query parameters.
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
  Future<College?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CollegeTable>? where,
    int? offset,
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<College>(
      where: where?.call(College.t),
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [College] by its [id] or null if no such row exists.
  Future<College?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<College>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [College]s in the list and returns the inserted rows.
  ///
  /// The returned [College]s will have their `id` fields set.
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
  Future<List<College>> insert(
    _is.DatabaseSession session,
    List<College> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<College>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [College] and returns the inserted row.
  ///
  /// The returned [College] will have its `id` field set.
  Future<College> insertRow(
    _is.DatabaseSession session,
    College row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<College>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [College]s in the list and returns the resulting rows.
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
  /// The returned [College]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<College>> upsert(
    _is.DatabaseSession session,
    List<College> rows, {
    required _is.ColumnSelections<CollegeTable> conflictColumns,
    _is.ColumnSelections<CollegeTable>? updateColumns,
    _is.WhereExpressionBuilder<CollegeTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<College>(
      rows,
      conflictColumns: conflictColumns(College.t),
      updateColumns: updateColumns?.call(College.t),
      updateWhere: updateWhere?.call(College.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [College] and returns the resulting row.
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
  /// The returned [College] will have its `id` field set.
  Future<College?> upsertRow(
    _is.DatabaseSession session,
    College row, {
    required _is.ColumnSelections<CollegeTable> conflictColumns,
    _is.ColumnSelections<CollegeTable>? updateColumns,
    _is.WhereExpressionBuilder<CollegeTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<College>(
      row,
      conflictColumns: conflictColumns(College.t),
      updateColumns: updateColumns?.call(College.t),
      updateWhere: updateWhere?.call(College.t),
      transaction: transaction,
    );
  }

  /// Updates all [College]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<College>> update(
    _is.DatabaseSession session,
    List<College> rows, {
    _is.ColumnSelections<CollegeTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<College>(
      rows,
      columns: columns?.call(College.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [College]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<College> updateRow(
    _is.DatabaseSession session,
    College row, {
    _is.ColumnSelections<CollegeTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<College>(
      row,
      columns: columns?.call(College.t),
      transaction: transaction,
    );
  }

  /// Updates a single [College] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<College?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CollegeUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<College>(
      id,
      columnValues: columnValues(College.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [College]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<College>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CollegeUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CollegeTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<College>(
      columnValues: columnValues(College.t.updateTable),
      where: where(College.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [College]s in the list and returns the deleted rows.
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
  Future<List<College>> delete(
    _is.DatabaseSession session,
    List<College> rows, {
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<College>(
      rows,
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [College].
  Future<College> deleteRow(
    _is.DatabaseSession session,
    College row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<College>(
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
  Future<List<College>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CollegeTable> where,
    _is.OrderByBuilder<CollegeTable>? orderBy,
    _is.OrderByListBuilder<CollegeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<College>(
      where: where(College.t),
      orderBy: orderBy?.call(College.t),
      orderByList: orderByList?.call(College.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CollegeTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<College>(
      where: where?.call(College.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [College] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CollegeTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<College>(
      where: where(College.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
