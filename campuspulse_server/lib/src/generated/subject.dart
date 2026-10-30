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

abstract class Subject
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Subject._({
    this.id,
    required this.branchId,
    required this.semester,
    required this.name,
    required this.code,
    required this.credits,
  });

  factory Subject({
    int? id,
    required int branchId,
    required int semester,
    required String name,
    required String code,
    required int credits,
  }) = _SubjectImpl;

  factory Subject.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subject(
      id: jsonSerialization['id'] as int?,
      branchId: jsonSerialization['branchId'] as int,
      semester: jsonSerialization['semester'] as int,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      credits: jsonSerialization['credits'] as int,
    );
  }

  static final t = SubjectTable();

  static const db = SubjectRepository._();

  @override
  int? id;

  int branchId;

  int semester;

  String name;

  String code;

  int credits;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Subject]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Subject copyWith({
    int? id,
    int? branchId,
    int? semester,
    String? name,
    String? code,
    int? credits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Subject',
      if (id != null) 'id': id,
      'branchId': branchId,
      'semester': semester,
      'name': name,
      'code': code,
      'credits': credits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Subject',
      if (id != null) 'id': id,
      'branchId': branchId,
      'semester': semester,
      'name': name,
      'code': code,
      'credits': credits,
    };
  }

  static SubjectInclude include() {
    return SubjectInclude._();
  }

  static SubjectIncludeList includeList({
    _is.WhereExpressionBuilder<SubjectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    SubjectInclude? include,
  }) {
    return SubjectIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubjectImpl extends Subject {
  _SubjectImpl({
    int? id,
    required int branchId,
    required int semester,
    required String name,
    required String code,
    required int credits,
  }) : super._(
          id: id,
          branchId: branchId,
          semester: semester,
          name: name,
          code: code,
          credits: credits,
        );

  /// Returns a shallow copy of this [Subject]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Subject copyWith({
    Object? id = _Undefined,
    int? branchId,
    int? semester,
    String? name,
    String? code,
    int? credits,
  }) {
    return Subject(
      id: id is int? ? id : this.id,
      branchId: branchId ?? this.branchId,
      semester: semester ?? this.semester,
      name: name ?? this.name,
      code: code ?? this.code,
      credits: credits ?? this.credits,
    );
  }
}

class SubjectUpdateTable extends _is.UpdateTable<SubjectTable> {
  SubjectUpdateTable(super.table);

  _is.ColumnValue<int, int> branchId(int value) => _is.ColumnValue(
        table.branchId,
        value,
      );

  _is.ColumnValue<int, int> semester(int value) => _is.ColumnValue(
        table.semester,
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

  _is.ColumnValue<int, int> credits(int value) => _is.ColumnValue(
        table.credits,
        value,
      );
}

class SubjectTable extends _is.Table<int?> {
  SubjectTable({super.tableRelation}) : super(tableName: 'subject') {
    updateTable = SubjectUpdateTable(this);
    branchId = _is.ColumnInt(
      'branchId',
      this,
    );
    semester = _is.ColumnInt(
      'semester',
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
    credits = _is.ColumnInt(
      'credits',
      this,
    );
  }

  late final SubjectUpdateTable updateTable;

  late final _is.ColumnInt branchId;

  late final _is.ColumnInt semester;

  late final _is.ColumnString name;

  late final _is.ColumnString code;

  late final _is.ColumnInt credits;

  @override
  List<_is.Column> get columns => [
        id,
        branchId,
        semester,
        name,
        code,
        credits,
      ];
}

class SubjectInclude extends _is.IncludeObject {
  SubjectInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Subject.t;
}

class SubjectIncludeList extends _is.IncludeList {
  SubjectIncludeList._({
    _is.WhereExpressionBuilder<SubjectTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Subject.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Subject.t;
}

class SubjectRepository {
  const SubjectRepository._();

  /// Returns a list of [Subject]s matching the given query parameters.
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
  Future<List<Subject>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubjectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Subject>(
      where: where?.call(Subject.t),
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Subject] matching the given query parameters.
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
  Future<Subject?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubjectTable>? where,
    int? offset,
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Subject>(
      where: where?.call(Subject.t),
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Subject] by its [id] or null if no such row exists.
  Future<Subject?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Subject>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Subject]s in the list and returns the inserted rows.
  ///
  /// The returned [Subject]s will have their `id` fields set.
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
  Future<List<Subject>> insert(
    _is.DatabaseSession session,
    List<Subject> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Subject>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Subject] and returns the inserted row.
  ///
  /// The returned [Subject] will have its `id` field set.
  Future<Subject> insertRow(
    _is.DatabaseSession session,
    Subject row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Subject>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Subject]s in the list and returns the resulting rows.
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
  /// The returned [Subject]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subject>> upsert(
    _is.DatabaseSession session,
    List<Subject> rows, {
    required _is.ColumnSelections<SubjectTable> conflictColumns,
    _is.ColumnSelections<SubjectTable>? updateColumns,
    _is.WhereExpressionBuilder<SubjectTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Subject>(
      rows,
      conflictColumns: conflictColumns(Subject.t),
      updateColumns: updateColumns?.call(Subject.t),
      updateWhere: updateWhere?.call(Subject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Subject] and returns the resulting row.
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
  /// The returned [Subject] will have its `id` field set.
  Future<Subject?> upsertRow(
    _is.DatabaseSession session,
    Subject row, {
    required _is.ColumnSelections<SubjectTable> conflictColumns,
    _is.ColumnSelections<SubjectTable>? updateColumns,
    _is.WhereExpressionBuilder<SubjectTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Subject>(
      row,
      conflictColumns: conflictColumns(Subject.t),
      updateColumns: updateColumns?.call(Subject.t),
      updateWhere: updateWhere?.call(Subject.t),
      transaction: transaction,
    );
  }

  /// Updates all [Subject]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subject>> update(
    _is.DatabaseSession session,
    List<Subject> rows, {
    _is.ColumnSelections<SubjectTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Subject>(
      rows,
      columns: columns?.call(Subject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Subject]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Subject> updateRow(
    _is.DatabaseSession session,
    Subject row, {
    _is.ColumnSelections<SubjectTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Subject>(
      row,
      columns: columns?.call(Subject.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Subject] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Subject?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SubjectUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Subject>(
      id,
      columnValues: columnValues(Subject.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Subject]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subject>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SubjectUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SubjectTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Subject>(
      columnValues: columnValues(Subject.t.updateTable),
      where: where(Subject.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Subject]s in the list and returns the deleted rows.
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
  Future<List<Subject>> delete(
    _is.DatabaseSession session,
    List<Subject> rows, {
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Subject>(
      rows,
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Subject].
  Future<Subject> deleteRow(
    _is.DatabaseSession session,
    Subject row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Subject>(
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
  Future<List<Subject>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SubjectTable> where,
    _is.OrderByBuilder<SubjectTable>? orderBy,
    _is.OrderByListBuilder<SubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Subject>(
      where: where(Subject.t),
      orderBy: orderBy?.call(Subject.t),
      orderByList: orderByList?.call(Subject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubjectTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Subject>(
      where: where?.call(Subject.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Subject] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SubjectTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Subject>(
      where: where(Subject.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
