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

abstract class TimetableEntry
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  TimetableEntry._({
    this.id,
    required this.sectionId,
    required this.subjectId,
    required this.subjectName,
    required this.subjectCode,
    required this.facultyName,
    required this.roomNumber,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.type,
  });

  factory TimetableEntry({
    int? id,
    required int sectionId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required String facultyName,
    required String roomNumber,
    required int dayOfWeek,
    required String startTime,
    required String endTime,
    required String type,
  }) = _TimetableEntryImpl;

  factory TimetableEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return TimetableEntry(
      id: jsonSerialization['id'] as int?,
      sectionId: jsonSerialization['sectionId'] as int,
      subjectId: jsonSerialization['subjectId'] as int,
      subjectName: jsonSerialization['subjectName'] as String,
      subjectCode: jsonSerialization['subjectCode'] as String,
      facultyName: jsonSerialization['facultyName'] as String,
      roomNumber: jsonSerialization['roomNumber'] as String,
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startTime: jsonSerialization['startTime'] as String,
      endTime: jsonSerialization['endTime'] as String,
      type: jsonSerialization['type'] as String,
    );
  }

  static final t = TimetableEntryTable();

  static const db = TimetableEntryRepository._();

  @override
  int? id;

  int sectionId;

  int subjectId;

  String subjectName;

  String subjectCode;

  String facultyName;

  String roomNumber;

  int dayOfWeek;

  String startTime;

  String endTime;

  String type;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [TimetableEntry]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TimetableEntry copyWith({
    int? id,
    int? sectionId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    String? facultyName,
    String? roomNumber,
    int? dayOfWeek,
    String? startTime,
    String? endTime,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TimetableEntry',
      if (id != null) 'id': id,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'facultyName': facultyName,
      'roomNumber': roomNumber,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TimetableEntry',
      if (id != null) 'id': id,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'facultyName': facultyName,
      'roomNumber': roomNumber,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'type': type,
    };
  }

  static TimetableEntryInclude include() {
    return TimetableEntryInclude._();
  }

  static TimetableEntryIncludeList includeList({
    _is.WhereExpressionBuilder<TimetableEntryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    TimetableEntryInclude? include,
  }) {
    return TimetableEntryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TimetableEntryImpl extends TimetableEntry {
  _TimetableEntryImpl({
    int? id,
    required int sectionId,
    required int subjectId,
    required String subjectName,
    required String subjectCode,
    required String facultyName,
    required String roomNumber,
    required int dayOfWeek,
    required String startTime,
    required String endTime,
    required String type,
  }) : super._(
          id: id,
          sectionId: sectionId,
          subjectId: subjectId,
          subjectName: subjectName,
          subjectCode: subjectCode,
          facultyName: facultyName,
          roomNumber: roomNumber,
          dayOfWeek: dayOfWeek,
          startTime: startTime,
          endTime: endTime,
          type: type,
        );

  /// Returns a shallow copy of this [TimetableEntry]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TimetableEntry copyWith({
    Object? id = _Undefined,
    int? sectionId,
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    String? facultyName,
    String? roomNumber,
    int? dayOfWeek,
    String? startTime,
    String? endTime,
    String? type,
  }) {
    return TimetableEntry(
      id: id is int? ? id : this.id,
      sectionId: sectionId ?? this.sectionId,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      subjectCode: subjectCode ?? this.subjectCode,
      facultyName: facultyName ?? this.facultyName,
      roomNumber: roomNumber ?? this.roomNumber,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
    );
  }
}

class TimetableEntryUpdateTable extends _is.UpdateTable<TimetableEntryTable> {
  TimetableEntryUpdateTable(super.table);

  _is.ColumnValue<int, int> sectionId(int value) => _is.ColumnValue(
        table.sectionId,
        value,
      );

  _is.ColumnValue<int, int> subjectId(int value) => _is.ColumnValue(
        table.subjectId,
        value,
      );

  _is.ColumnValue<String, String> subjectName(String value) => _is.ColumnValue(
        table.subjectName,
        value,
      );

  _is.ColumnValue<String, String> subjectCode(String value) => _is.ColumnValue(
        table.subjectCode,
        value,
      );

  _is.ColumnValue<String, String> facultyName(String value) => _is.ColumnValue(
        table.facultyName,
        value,
      );

  _is.ColumnValue<String, String> roomNumber(String value) => _is.ColumnValue(
        table.roomNumber,
        value,
      );

  _is.ColumnValue<int, int> dayOfWeek(int value) => _is.ColumnValue(
        table.dayOfWeek,
        value,
      );

  _is.ColumnValue<String, String> startTime(String value) => _is.ColumnValue(
        table.startTime,
        value,
      );

  _is.ColumnValue<String, String> endTime(String value) => _is.ColumnValue(
        table.endTime,
        value,
      );

  _is.ColumnValue<String, String> type(String value) => _is.ColumnValue(
        table.type,
        value,
      );
}

class TimetableEntryTable extends _is.Table<int?> {
  TimetableEntryTable({super.tableRelation})
      : super(tableName: 'timetable_entry') {
    updateTable = TimetableEntryUpdateTable(this);
    sectionId = _is.ColumnInt(
      'sectionId',
      this,
    );
    subjectId = _is.ColumnInt(
      'subjectId',
      this,
    );
    subjectName = _is.ColumnString(
      'subjectName',
      this,
    );
    subjectCode = _is.ColumnString(
      'subjectCode',
      this,
    );
    facultyName = _is.ColumnString(
      'facultyName',
      this,
    );
    roomNumber = _is.ColumnString(
      'roomNumber',
      this,
    );
    dayOfWeek = _is.ColumnInt(
      'dayOfWeek',
      this,
    );
    startTime = _is.ColumnString(
      'startTime',
      this,
    );
    endTime = _is.ColumnString(
      'endTime',
      this,
    );
    type = _is.ColumnString(
      'type',
      this,
    );
  }

  late final TimetableEntryUpdateTable updateTable;

  late final _is.ColumnInt sectionId;

  late final _is.ColumnInt subjectId;

  late final _is.ColumnString subjectName;

  late final _is.ColumnString subjectCode;

  late final _is.ColumnString facultyName;

  late final _is.ColumnString roomNumber;

  late final _is.ColumnInt dayOfWeek;

  late final _is.ColumnString startTime;

  late final _is.ColumnString endTime;

  late final _is.ColumnString type;

  @override
  List<_is.Column> get columns => [
        id,
        sectionId,
        subjectId,
        subjectName,
        subjectCode,
        facultyName,
        roomNumber,
        dayOfWeek,
        startTime,
        endTime,
        type,
      ];
}

class TimetableEntryInclude extends _is.IncludeObject {
  TimetableEntryInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => TimetableEntry.t;
}

class TimetableEntryIncludeList extends _is.IncludeList {
  TimetableEntryIncludeList._({
    _is.WhereExpressionBuilder<TimetableEntryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TimetableEntry.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => TimetableEntry.t;
}

class TimetableEntryRepository {
  const TimetableEntryRepository._();

  /// Returns a list of [TimetableEntry]s matching the given query parameters.
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
  Future<List<TimetableEntry>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TimetableEntryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TimetableEntry>(
      where: where?.call(TimetableEntry.t),
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TimetableEntry] matching the given query parameters.
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
  Future<TimetableEntry?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TimetableEntryTable>? where,
    int? offset,
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TimetableEntry>(
      where: where?.call(TimetableEntry.t),
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TimetableEntry] by its [id] or null if no such row exists.
  Future<TimetableEntry?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TimetableEntry>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TimetableEntry]s in the list and returns the inserted rows.
  ///
  /// The returned [TimetableEntry]s will have their `id` fields set.
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
  Future<List<TimetableEntry>> insert(
    _is.DatabaseSession session,
    List<TimetableEntry> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TimetableEntry>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TimetableEntry] and returns the inserted row.
  ///
  /// The returned [TimetableEntry] will have its `id` field set.
  Future<TimetableEntry> insertRow(
    _is.DatabaseSession session,
    TimetableEntry row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TimetableEntry>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TimetableEntry]s in the list and returns the resulting rows.
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
  /// The returned [TimetableEntry]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TimetableEntry>> upsert(
    _is.DatabaseSession session,
    List<TimetableEntry> rows, {
    required _is.ColumnSelections<TimetableEntryTable> conflictColumns,
    _is.ColumnSelections<TimetableEntryTable>? updateColumns,
    _is.WhereExpressionBuilder<TimetableEntryTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TimetableEntry>(
      rows,
      conflictColumns: conflictColumns(TimetableEntry.t),
      updateColumns: updateColumns?.call(TimetableEntry.t),
      updateWhere: updateWhere?.call(TimetableEntry.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TimetableEntry] and returns the resulting row.
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
  /// The returned [TimetableEntry] will have its `id` field set.
  Future<TimetableEntry?> upsertRow(
    _is.DatabaseSession session,
    TimetableEntry row, {
    required _is.ColumnSelections<TimetableEntryTable> conflictColumns,
    _is.ColumnSelections<TimetableEntryTable>? updateColumns,
    _is.WhereExpressionBuilder<TimetableEntryTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TimetableEntry>(
      row,
      conflictColumns: conflictColumns(TimetableEntry.t),
      updateColumns: updateColumns?.call(TimetableEntry.t),
      updateWhere: updateWhere?.call(TimetableEntry.t),
      transaction: transaction,
    );
  }

  /// Updates all [TimetableEntry]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TimetableEntry>> update(
    _is.DatabaseSession session,
    List<TimetableEntry> rows, {
    _is.ColumnSelections<TimetableEntryTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TimetableEntry>(
      rows,
      columns: columns?.call(TimetableEntry.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TimetableEntry]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TimetableEntry> updateRow(
    _is.DatabaseSession session,
    TimetableEntry row, {
    _is.ColumnSelections<TimetableEntryTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TimetableEntry>(
      row,
      columns: columns?.call(TimetableEntry.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TimetableEntry] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TimetableEntry?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<TimetableEntryUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TimetableEntry>(
      id,
      columnValues: columnValues(TimetableEntry.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TimetableEntry]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TimetableEntry>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TimetableEntryUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<TimetableEntryTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TimetableEntry>(
      columnValues: columnValues(TimetableEntry.t.updateTable),
      where: where(TimetableEntry.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TimetableEntry]s in the list and returns the deleted rows.
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
  Future<List<TimetableEntry>> delete(
    _is.DatabaseSession session,
    List<TimetableEntry> rows, {
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TimetableEntry>(
      rows,
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TimetableEntry].
  Future<TimetableEntry> deleteRow(
    _is.DatabaseSession session,
    TimetableEntry row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TimetableEntry>(
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
  Future<List<TimetableEntry>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TimetableEntryTable> where,
    _is.OrderByBuilder<TimetableEntryTable>? orderBy,
    _is.OrderByListBuilder<TimetableEntryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TimetableEntry>(
      where: where(TimetableEntry.t),
      orderBy: orderBy?.call(TimetableEntry.t),
      orderByList: orderByList?.call(TimetableEntry.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TimetableEntryTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TimetableEntry>(
      where: where?.call(TimetableEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TimetableEntry] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TimetableEntryTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TimetableEntry>(
      where: where(TimetableEntry.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
