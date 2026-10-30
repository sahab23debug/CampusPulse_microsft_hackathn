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

abstract class EventRegistration
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  EventRegistration._({
    this.id,
    required this.eventId,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.registeredAt,
  });

  factory EventRegistration({
    int? id,
    required int eventId,
    required int userId,
    required String userName,
    required String userEmail,
    required DateTime registeredAt,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      userEmail: jsonSerialization['userEmail'] as String,
      registeredAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['registeredAt']),
    );
  }

  static final t = EventRegistrationTable();

  static const db = EventRegistrationRepository._();

  @override
  int? id;

  int eventId;

  int userId;

  String userName;

  String userEmail;

  DateTime registeredAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EventRegistration copyWith({
    int? id,
    int? eventId,
    int? userId,
    String? userName,
    String? userEmail,
    DateTime? registeredAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'eventId': eventId,
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'registeredAt': registeredAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'eventId': eventId,
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'registeredAt': registeredAt.toJson(),
    };
  }

  static EventRegistrationInclude include() {
    return EventRegistrationInclude._();
  }

  static EventRegistrationIncludeList includeList({
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    EventRegistrationInclude? include,
  }) {
    return EventRegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventRegistrationImpl extends EventRegistration {
  _EventRegistrationImpl({
    int? id,
    required int eventId,
    required int userId,
    required String userName,
    required String userEmail,
    required DateTime registeredAt,
  }) : super._(
          id: id,
          eventId: eventId,
          userId: userId,
          userName: userName,
          userEmail: userEmail,
          registeredAt: registeredAt,
        );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    int? eventId,
    int? userId,
    String? userName,
    String? userEmail,
    DateTime? registeredAt,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      registeredAt: registeredAt ?? this.registeredAt,
    );
  }
}

class EventRegistrationUpdateTable
    extends _is.UpdateTable<EventRegistrationTable> {
  EventRegistrationUpdateTable(super.table);

  _is.ColumnValue<int, int> eventId(int value) => _is.ColumnValue(
        table.eventId,
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

  _is.ColumnValue<String, String> userEmail(String value) => _is.ColumnValue(
        table.userEmail,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> registeredAt(DateTime value) =>
      _is.ColumnValue(
        table.registeredAt,
        value,
      );
}

class EventRegistrationTable extends _is.Table<int?> {
  EventRegistrationTable({super.tableRelation})
      : super(tableName: 'event_registration') {
    updateTable = EventRegistrationUpdateTable(this);
    eventId = _is.ColumnInt(
      'eventId',
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
    userEmail = _is.ColumnString(
      'userEmail',
      this,
    );
    registeredAt = _is.ColumnDateTime(
      'registeredAt',
      this,
    );
  }

  late final EventRegistrationUpdateTable updateTable;

  late final _is.ColumnInt eventId;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userName;

  late final _is.ColumnString userEmail;

  late final _is.ColumnDateTime registeredAt;

  @override
  List<_is.Column> get columns => [
        id,
        eventId,
        userId,
        userName,
        userEmail,
        registeredAt,
      ];
}

class EventRegistrationInclude extends _is.IncludeObject {
  EventRegistrationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationIncludeList extends _is.IncludeList {
  EventRegistrationIncludeList._({
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventRegistration.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationRepository {
  const EventRegistrationRepository._();

  /// Returns a list of [EventRegistration]s matching the given query parameters.
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
  Future<List<EventRegistration>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventRegistration] matching the given query parameters.
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
  Future<EventRegistration?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventRegistration] by its [id] or null if no such row exists.
  Future<EventRegistration?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventRegistration>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventRegistration]s in the list and returns the inserted rows.
  ///
  /// The returned [EventRegistration]s will have their `id` fields set.
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
  Future<List<EventRegistration>> insert(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EventRegistration>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EventRegistration] and returns the inserted row.
  ///
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration> insertRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [EventRegistration]s in the list and returns the resulting rows.
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
  /// The returned [EventRegistration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> upsert(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    required _is.ColumnSelections<EventRegistrationTable> conflictColumns,
    _is.ColumnSelections<EventRegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<EventRegistrationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EventRegistration>(
      rows,
      conflictColumns: conflictColumns(EventRegistration.t),
      updateColumns: updateColumns?.call(EventRegistration.t),
      updateWhere: updateWhere?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EventRegistration] and returns the resulting row.
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
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration?> upsertRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    required _is.ColumnSelections<EventRegistrationTable> conflictColumns,
    _is.ColumnSelections<EventRegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<EventRegistrationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EventRegistration>(
      row,
      conflictColumns: conflictColumns(EventRegistration.t),
      updateColumns: updateColumns?.call(EventRegistration.t),
      updateWhere: updateWhere?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> update(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.ColumnSelections<EventRegistrationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EventRegistration>(
      rows,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EventRegistration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventRegistration> updateRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.ColumnSelections<EventRegistrationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventRegistration>(
      row,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventRegistration?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<EventRegistrationUpdateTable>
        columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EventRegistration>(
      id,
      columnValues: columnValues(EventRegistration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EventRegistrationUpdateTable>
        columnValues,
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EventRegistration>(
      columnValues: columnValues(EventRegistration.t.updateTable),
      where: where(EventRegistration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EventRegistration]s in the list and returns the deleted rows.
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
  Future<List<EventRegistration>> delete(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EventRegistration>(
      rows,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EventRegistration].
  Future<EventRegistration> deleteRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventRegistration>(
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
  Future<List<EventRegistration>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EventRegistration>(
      where: where(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EventRegistration>(
      where: where?.call(EventRegistration.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventRegistration] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventRegistration>(
      where: where(EventRegistration.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
