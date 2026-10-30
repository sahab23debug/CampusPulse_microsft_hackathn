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

abstract class ConnectionRequest
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ConnectionRequest._({
    this.id,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.receiverName,
    required this.note,
    required this.status,
    required this.messageCountBeforeAccept,
    required this.createdAt,
    this.updatedAt,
  });

  factory ConnectionRequest({
    int? id,
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
    required String status,
    required int messageCountBeforeAccept,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ConnectionRequestImpl;

  factory ConnectionRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConnectionRequest(
      id: jsonSerialization['id'] as int?,
      senderId: jsonSerialization['senderId'] as int,
      senderName: jsonSerialization['senderName'] as String,
      receiverId: jsonSerialization['receiverId'] as int,
      receiverName: jsonSerialization['receiverName'] as String,
      note: jsonSerialization['note'] as String,
      status: jsonSerialization['status'] as String,
      messageCountBeforeAccept:
          jsonSerialization['messageCountBeforeAccept'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ConnectionRequestTable();

  static const db = ConnectionRequestRepository._();

  @override
  int? id;

  int senderId;

  String senderName;

  int receiverId;

  String receiverName;

  String note;

  String status;

  int messageCountBeforeAccept;

  DateTime createdAt;

  DateTime? updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ConnectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ConnectionRequest copyWith({
    int? id,
    int? senderId,
    String? senderName,
    int? receiverId,
    String? receiverName,
    String? note,
    String? status,
    int? messageCountBeforeAccept,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ConnectionRequest',
      if (id != null) 'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'note': note,
      'status': status,
      'messageCountBeforeAccept': messageCountBeforeAccept,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ConnectionRequest',
      if (id != null) 'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'note': note,
      'status': status,
      'messageCountBeforeAccept': messageCountBeforeAccept,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static ConnectionRequestInclude include() {
    return ConnectionRequestInclude._();
  }

  static ConnectionRequestIncludeList includeList({
    _is.WhereExpressionBuilder<ConnectionRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    ConnectionRequestInclude? include,
  }) {
    return ConnectionRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConnectionRequestImpl extends ConnectionRequest {
  _ConnectionRequestImpl({
    int? id,
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
    required String status,
    required int messageCountBeforeAccept,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          senderId: senderId,
          senderName: senderName,
          receiverId: receiverId,
          receiverName: receiverName,
          note: note,
          status: status,
          messageCountBeforeAccept: messageCountBeforeAccept,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [ConnectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ConnectionRequest copyWith({
    Object? id = _Undefined,
    int? senderId,
    String? senderName,
    int? receiverId,
    String? receiverName,
    String? note,
    String? status,
    int? messageCountBeforeAccept,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return ConnectionRequest(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverId: receiverId ?? this.receiverId,
      receiverName: receiverName ?? this.receiverName,
      note: note ?? this.note,
      status: status ?? this.status,
      messageCountBeforeAccept:
          messageCountBeforeAccept ?? this.messageCountBeforeAccept,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class ConnectionRequestUpdateTable
    extends _is.UpdateTable<ConnectionRequestTable> {
  ConnectionRequestUpdateTable(super.table);

  _is.ColumnValue<int, int> senderId(int value) => _is.ColumnValue(
        table.senderId,
        value,
      );

  _is.ColumnValue<String, String> senderName(String value) => _is.ColumnValue(
        table.senderName,
        value,
      );

  _is.ColumnValue<int, int> receiverId(int value) => _is.ColumnValue(
        table.receiverId,
        value,
      );

  _is.ColumnValue<String, String> receiverName(String value) => _is.ColumnValue(
        table.receiverName,
        value,
      );

  _is.ColumnValue<String, String> note(String value) => _is.ColumnValue(
        table.note,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
        table.status,
        value,
      );

  _is.ColumnValue<int, int> messageCountBeforeAccept(int value) =>
      _is.ColumnValue(
        table.messageCountBeforeAccept,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ConnectionRequestTable extends _is.Table<int?> {
  ConnectionRequestTable({super.tableRelation})
      : super(tableName: 'connection_request') {
    updateTable = ConnectionRequestUpdateTable(this);
    senderId = _is.ColumnInt(
      'senderId',
      this,
    );
    senderName = _is.ColumnString(
      'senderName',
      this,
    );
    receiverId = _is.ColumnInt(
      'receiverId',
      this,
    );
    receiverName = _is.ColumnString(
      'receiverName',
      this,
    );
    note = _is.ColumnString(
      'note',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    messageCountBeforeAccept = _is.ColumnInt(
      'messageCountBeforeAccept',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ConnectionRequestUpdateTable updateTable;

  late final _is.ColumnInt senderId;

  late final _is.ColumnString senderName;

  late final _is.ColumnInt receiverId;

  late final _is.ColumnString receiverName;

  late final _is.ColumnString note;

  late final _is.ColumnString status;

  late final _is.ColumnInt messageCountBeforeAccept;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
        id,
        senderId,
        senderName,
        receiverId,
        receiverName,
        note,
        status,
        messageCountBeforeAccept,
        createdAt,
        updatedAt,
      ];
}

class ConnectionRequestInclude extends _is.IncludeObject {
  ConnectionRequestInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ConnectionRequest.t;
}

class ConnectionRequestIncludeList extends _is.IncludeList {
  ConnectionRequestIncludeList._({
    _is.WhereExpressionBuilder<ConnectionRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ConnectionRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ConnectionRequest.t;
}

class ConnectionRequestRepository {
  const ConnectionRequestRepository._();

  /// Returns a list of [ConnectionRequest]s matching the given query parameters.
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
  Future<List<ConnectionRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConnectionRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ConnectionRequest>(
      where: where?.call(ConnectionRequest.t),
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ConnectionRequest] matching the given query parameters.
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
  Future<ConnectionRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConnectionRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ConnectionRequest>(
      where: where?.call(ConnectionRequest.t),
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ConnectionRequest] by its [id] or null if no such row exists.
  Future<ConnectionRequest?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ConnectionRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ConnectionRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [ConnectionRequest]s will have their `id` fields set.
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
  Future<List<ConnectionRequest>> insert(
    _is.DatabaseSession session,
    List<ConnectionRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ConnectionRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ConnectionRequest] and returns the inserted row.
  ///
  /// The returned [ConnectionRequest] will have its `id` field set.
  Future<ConnectionRequest> insertRow(
    _is.DatabaseSession session,
    ConnectionRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ConnectionRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ConnectionRequest]s in the list and returns the resulting rows.
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
  /// The returned [ConnectionRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConnectionRequest>> upsert(
    _is.DatabaseSession session,
    List<ConnectionRequest> rows, {
    required _is.ColumnSelections<ConnectionRequestTable> conflictColumns,
    _is.ColumnSelections<ConnectionRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<ConnectionRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ConnectionRequest>(
      rows,
      conflictColumns: conflictColumns(ConnectionRequest.t),
      updateColumns: updateColumns?.call(ConnectionRequest.t),
      updateWhere: updateWhere?.call(ConnectionRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ConnectionRequest] and returns the resulting row.
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
  /// The returned [ConnectionRequest] will have its `id` field set.
  Future<ConnectionRequest?> upsertRow(
    _is.DatabaseSession session,
    ConnectionRequest row, {
    required _is.ColumnSelections<ConnectionRequestTable> conflictColumns,
    _is.ColumnSelections<ConnectionRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<ConnectionRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ConnectionRequest>(
      row,
      conflictColumns: conflictColumns(ConnectionRequest.t),
      updateColumns: updateColumns?.call(ConnectionRequest.t),
      updateWhere: updateWhere?.call(ConnectionRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [ConnectionRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConnectionRequest>> update(
    _is.DatabaseSession session,
    List<ConnectionRequest> rows, {
    _is.ColumnSelections<ConnectionRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ConnectionRequest>(
      rows,
      columns: columns?.call(ConnectionRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ConnectionRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ConnectionRequest> updateRow(
    _is.DatabaseSession session,
    ConnectionRequest row, {
    _is.ColumnSelections<ConnectionRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ConnectionRequest>(
      row,
      columns: columns?.call(ConnectionRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ConnectionRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ConnectionRequest?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ConnectionRequestUpdateTable>
        columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ConnectionRequest>(
      id,
      columnValues: columnValues(ConnectionRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ConnectionRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConnectionRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ConnectionRequestUpdateTable>
        columnValues,
    required _is.WhereExpressionBuilder<ConnectionRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ConnectionRequest>(
      columnValues: columnValues(ConnectionRequest.t.updateTable),
      where: where(ConnectionRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ConnectionRequest]s in the list and returns the deleted rows.
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
  Future<List<ConnectionRequest>> delete(
    _is.DatabaseSession session,
    List<ConnectionRequest> rows, {
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ConnectionRequest>(
      rows,
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ConnectionRequest].
  Future<ConnectionRequest> deleteRow(
    _is.DatabaseSession session,
    ConnectionRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ConnectionRequest>(
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
  Future<List<ConnectionRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConnectionRequestTable> where,
    _is.OrderByBuilder<ConnectionRequestTable>? orderBy,
    _is.OrderByListBuilder<ConnectionRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ConnectionRequest>(
      where: where(ConnectionRequest.t),
      orderBy: orderBy?.call(ConnectionRequest.t),
      orderByList: orderByList?.call(ConnectionRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConnectionRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ConnectionRequest>(
      where: where?.call(ConnectionRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ConnectionRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConnectionRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ConnectionRequest>(
      where: where(ConnectionRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
