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

abstract class CalendarEvent
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CalendarEvent._({
    this.id,
    this.collegeId,
    this.sectionId,
    required this.title,
    required this.description,
    required this.eventType,
    required this.startDate,
    required this.endDate,
    required this.isAllDay,
    this.venue,
  });

  factory CalendarEvent({
    int? id,
    int? collegeId,
    int? sectionId,
    required String title,
    required String description,
    required String eventType,
    required DateTime startDate,
    required DateTime endDate,
    required bool isAllDay,
    String? venue,
  }) = _CalendarEventImpl;

  factory CalendarEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CalendarEvent(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int?,
      sectionId: jsonSerialization['sectionId'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      eventType: jsonSerialization['eventType'] as String,
      startDate:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      isAllDay: _is.BoolJsonExtension.fromJson(jsonSerialization['isAllDay']),
      venue: jsonSerialization['venue'] as String?,
    );
  }

  static final t = CalendarEventTable();

  static const db = CalendarEventRepository._();

  @override
  int? id;

  int? collegeId;

  int? sectionId;

  String title;

  String description;

  String eventType;

  DateTime startDate;

  DateTime endDate;

  bool isAllDay;

  String? venue;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CalendarEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CalendarEvent copyWith({
    int? id,
    int? collegeId,
    int? sectionId,
    String? title,
    String? description,
    String? eventType,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    String? venue,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CalendarEvent',
      if (id != null) 'id': id,
      if (collegeId != null) 'collegeId': collegeId,
      if (sectionId != null) 'sectionId': sectionId,
      'title': title,
      'description': description,
      'eventType': eventType,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isAllDay': isAllDay,
      if (venue != null) 'venue': venue,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CalendarEvent',
      if (id != null) 'id': id,
      if (collegeId != null) 'collegeId': collegeId,
      if (sectionId != null) 'sectionId': sectionId,
      'title': title,
      'description': description,
      'eventType': eventType,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isAllDay': isAllDay,
      if (venue != null) 'venue': venue,
    };
  }

  static CalendarEventInclude include() {
    return CalendarEventInclude._();
  }

  static CalendarEventIncludeList includeList({
    _is.WhereExpressionBuilder<CalendarEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    CalendarEventInclude? include,
  }) {
    return CalendarEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalendarEventImpl extends CalendarEvent {
  _CalendarEventImpl({
    int? id,
    int? collegeId,
    int? sectionId,
    required String title,
    required String description,
    required String eventType,
    required DateTime startDate,
    required DateTime endDate,
    required bool isAllDay,
    String? venue,
  }) : super._(
          id: id,
          collegeId: collegeId,
          sectionId: sectionId,
          title: title,
          description: description,
          eventType: eventType,
          startDate: startDate,
          endDate: endDate,
          isAllDay: isAllDay,
          venue: venue,
        );

  /// Returns a shallow copy of this [CalendarEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CalendarEvent copyWith({
    Object? id = _Undefined,
    Object? collegeId = _Undefined,
    Object? sectionId = _Undefined,
    String? title,
    String? description,
    String? eventType,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    Object? venue = _Undefined,
  }) {
    return CalendarEvent(
      id: id is int? ? id : this.id,
      collegeId: collegeId is int? ? collegeId : this.collegeId,
      sectionId: sectionId is int? ? sectionId : this.sectionId,
      title: title ?? this.title,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
      venue: venue is String? ? venue : this.venue,
    );
  }
}

class CalendarEventUpdateTable extends _is.UpdateTable<CalendarEventTable> {
  CalendarEventUpdateTable(super.table);

  _is.ColumnValue<int, int> collegeId(int? value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<int, int> sectionId(int? value) => _is.ColumnValue(
        table.sectionId,
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

  _is.ColumnValue<String, String> eventType(String value) => _is.ColumnValue(
        table.eventType,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _is.ColumnValue(
        table.startDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endDate(DateTime value) =>
      _is.ColumnValue(
        table.endDate,
        value,
      );

  _is.ColumnValue<bool, bool> isAllDay(bool value) => _is.ColumnValue(
        table.isAllDay,
        value,
      );

  _is.ColumnValue<String, String> venue(String? value) => _is.ColumnValue(
        table.venue,
        value,
      );
}

class CalendarEventTable extends _is.Table<int?> {
  CalendarEventTable({super.tableRelation})
      : super(tableName: 'calendar_event') {
    updateTable = CalendarEventUpdateTable(this);
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    sectionId = _is.ColumnInt(
      'sectionId',
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
    eventType = _is.ColumnString(
      'eventType',
      this,
    );
    startDate = _is.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _is.ColumnDateTime(
      'endDate',
      this,
    );
    isAllDay = _is.ColumnBool(
      'isAllDay',
      this,
    );
    venue = _is.ColumnString(
      'venue',
      this,
    );
  }

  late final CalendarEventUpdateTable updateTable;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnInt sectionId;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString eventType;

  late final _is.ColumnDateTime startDate;

  late final _is.ColumnDateTime endDate;

  late final _is.ColumnBool isAllDay;

  late final _is.ColumnString venue;

  @override
  List<_is.Column> get columns => [
        id,
        collegeId,
        sectionId,
        title,
        description,
        eventType,
        startDate,
        endDate,
        isAllDay,
        venue,
      ];
}

class CalendarEventInclude extends _is.IncludeObject {
  CalendarEventInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CalendarEvent.t;
}

class CalendarEventIncludeList extends _is.IncludeList {
  CalendarEventIncludeList._({
    _is.WhereExpressionBuilder<CalendarEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CalendarEvent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CalendarEvent.t;
}

class CalendarEventRepository {
  const CalendarEventRepository._();

  /// Returns a list of [CalendarEvent]s matching the given query parameters.
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
  Future<List<CalendarEvent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CalendarEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CalendarEvent>(
      where: where?.call(CalendarEvent.t),
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CalendarEvent] matching the given query parameters.
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
  Future<CalendarEvent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CalendarEventTable>? where,
    int? offset,
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CalendarEvent>(
      where: where?.call(CalendarEvent.t),
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CalendarEvent] by its [id] or null if no such row exists.
  Future<CalendarEvent?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CalendarEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CalendarEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [CalendarEvent]s will have their `id` fields set.
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
  Future<List<CalendarEvent>> insert(
    _is.DatabaseSession session,
    List<CalendarEvent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CalendarEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CalendarEvent] and returns the inserted row.
  ///
  /// The returned [CalendarEvent] will have its `id` field set.
  Future<CalendarEvent> insertRow(
    _is.DatabaseSession session,
    CalendarEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CalendarEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CalendarEvent]s in the list and returns the resulting rows.
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
  /// The returned [CalendarEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CalendarEvent>> upsert(
    _is.DatabaseSession session,
    List<CalendarEvent> rows, {
    required _is.ColumnSelections<CalendarEventTable> conflictColumns,
    _is.ColumnSelections<CalendarEventTable>? updateColumns,
    _is.WhereExpressionBuilder<CalendarEventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CalendarEvent>(
      rows,
      conflictColumns: conflictColumns(CalendarEvent.t),
      updateColumns: updateColumns?.call(CalendarEvent.t),
      updateWhere: updateWhere?.call(CalendarEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CalendarEvent] and returns the resulting row.
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
  /// The returned [CalendarEvent] will have its `id` field set.
  Future<CalendarEvent?> upsertRow(
    _is.DatabaseSession session,
    CalendarEvent row, {
    required _is.ColumnSelections<CalendarEventTable> conflictColumns,
    _is.ColumnSelections<CalendarEventTable>? updateColumns,
    _is.WhereExpressionBuilder<CalendarEventTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CalendarEvent>(
      row,
      conflictColumns: conflictColumns(CalendarEvent.t),
      updateColumns: updateColumns?.call(CalendarEvent.t),
      updateWhere: updateWhere?.call(CalendarEvent.t),
      transaction: transaction,
    );
  }

  /// Updates all [CalendarEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CalendarEvent>> update(
    _is.DatabaseSession session,
    List<CalendarEvent> rows, {
    _is.ColumnSelections<CalendarEventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CalendarEvent>(
      rows,
      columns: columns?.call(CalendarEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CalendarEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CalendarEvent> updateRow(
    _is.DatabaseSession session,
    CalendarEvent row, {
    _is.ColumnSelections<CalendarEventTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CalendarEvent>(
      row,
      columns: columns?.call(CalendarEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CalendarEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CalendarEvent?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CalendarEventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CalendarEvent>(
      id,
      columnValues: columnValues(CalendarEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CalendarEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CalendarEvent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CalendarEventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CalendarEventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CalendarEvent>(
      columnValues: columnValues(CalendarEvent.t.updateTable),
      where: where(CalendarEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CalendarEvent]s in the list and returns the deleted rows.
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
  Future<List<CalendarEvent>> delete(
    _is.DatabaseSession session,
    List<CalendarEvent> rows, {
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CalendarEvent>(
      rows,
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CalendarEvent].
  Future<CalendarEvent> deleteRow(
    _is.DatabaseSession session,
    CalendarEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CalendarEvent>(
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
  Future<List<CalendarEvent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CalendarEventTable> where,
    _is.OrderByBuilder<CalendarEventTable>? orderBy,
    _is.OrderByListBuilder<CalendarEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CalendarEvent>(
      where: where(CalendarEvent.t),
      orderBy: orderBy?.call(CalendarEvent.t),
      orderByList: orderByList?.call(CalendarEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CalendarEventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CalendarEvent>(
      where: where?.call(CalendarEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CalendarEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CalendarEventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CalendarEvent>(
      where: where(CalendarEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
