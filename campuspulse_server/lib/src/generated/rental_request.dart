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

abstract class RentalRequest
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RentalRequest._({
    this.id,
    required this.itemId,
    required this.renterId,
    required this.renterName,
    required this.ownerId,
    required this.status,
    required this.consentAgreed,
    required this.startDate,
    required this.returnDueDate,
    this.handoverPhotosJson,
    this.returnPhotosJson,
    required this.totalRentAmount,
    required this.depositHeld,
    required this.createdAt,
  });

  factory RentalRequest({
    int? id,
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required String status,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    required double totalRentAmount,
    required double depositHeld,
    required DateTime createdAt,
  }) = _RentalRequestImpl;

  factory RentalRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalRequest(
      id: jsonSerialization['id'] as int?,
      itemId: jsonSerialization['itemId'] as int,
      renterId: jsonSerialization['renterId'] as int,
      renterName: jsonSerialization['renterName'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      status: jsonSerialization['status'] as String,
      consentAgreed:
          _is.BoolJsonExtension.fromJson(jsonSerialization['consentAgreed']),
      startDate:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      returnDueDate: _is.DateTimeJsonExtension.fromJson(
          jsonSerialization['returnDueDate']),
      handoverPhotosJson: jsonSerialization['handoverPhotosJson'] as String?,
      returnPhotosJson: jsonSerialization['returnPhotosJson'] as String?,
      totalRentAmount: (jsonSerialization['totalRentAmount'] as num).toDouble(),
      depositHeld: (jsonSerialization['depositHeld'] as num).toDouble(),
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = RentalRequestTable();

  static const db = RentalRequestRepository._();

  @override
  int? id;

  int itemId;

  int renterId;

  String renterName;

  int ownerId;

  String status;

  bool consentAgreed;

  DateTime startDate;

  DateTime returnDueDate;

  String? handoverPhotosJson;

  String? returnPhotosJson;

  double totalRentAmount;

  double depositHeld;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RentalRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RentalRequest copyWith({
    int? id,
    int? itemId,
    int? renterId,
    String? renterName,
    int? ownerId,
    String? status,
    bool? consentAgreed,
    DateTime? startDate,
    DateTime? returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    double? totalRentAmount,
    double? depositHeld,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RentalRequest',
      if (id != null) 'id': id,
      'itemId': itemId,
      'renterId': renterId,
      'renterName': renterName,
      'ownerId': ownerId,
      'status': status,
      'consentAgreed': consentAgreed,
      'startDate': startDate.toJson(),
      'returnDueDate': returnDueDate.toJson(),
      if (handoverPhotosJson != null) 'handoverPhotosJson': handoverPhotosJson,
      if (returnPhotosJson != null) 'returnPhotosJson': returnPhotosJson,
      'totalRentAmount': totalRentAmount,
      'depositHeld': depositHeld,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RentalRequest',
      if (id != null) 'id': id,
      'itemId': itemId,
      'renterId': renterId,
      'renterName': renterName,
      'ownerId': ownerId,
      'status': status,
      'consentAgreed': consentAgreed,
      'startDate': startDate.toJson(),
      'returnDueDate': returnDueDate.toJson(),
      if (handoverPhotosJson != null) 'handoverPhotosJson': handoverPhotosJson,
      if (returnPhotosJson != null) 'returnPhotosJson': returnPhotosJson,
      'totalRentAmount': totalRentAmount,
      'depositHeld': depositHeld,
      'createdAt': createdAt.toJson(),
    };
  }

  static RentalRequestInclude include() {
    return RentalRequestInclude._();
  }

  static RentalRequestIncludeList includeList({
    _is.WhereExpressionBuilder<RentalRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    RentalRequestInclude? include,
  }) {
    return RentalRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalRequestImpl extends RentalRequest {
  _RentalRequestImpl({
    int? id,
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required String status,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    String? handoverPhotosJson,
    String? returnPhotosJson,
    required double totalRentAmount,
    required double depositHeld,
    required DateTime createdAt,
  }) : super._(
          id: id,
          itemId: itemId,
          renterId: renterId,
          renterName: renterName,
          ownerId: ownerId,
          status: status,
          consentAgreed: consentAgreed,
          startDate: startDate,
          returnDueDate: returnDueDate,
          handoverPhotosJson: handoverPhotosJson,
          returnPhotosJson: returnPhotosJson,
          totalRentAmount: totalRentAmount,
          depositHeld: depositHeld,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RentalRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RentalRequest copyWith({
    Object? id = _Undefined,
    int? itemId,
    int? renterId,
    String? renterName,
    int? ownerId,
    String? status,
    bool? consentAgreed,
    DateTime? startDate,
    DateTime? returnDueDate,
    Object? handoverPhotosJson = _Undefined,
    Object? returnPhotosJson = _Undefined,
    double? totalRentAmount,
    double? depositHeld,
    DateTime? createdAt,
  }) {
    return RentalRequest(
      id: id is int? ? id : this.id,
      itemId: itemId ?? this.itemId,
      renterId: renterId ?? this.renterId,
      renterName: renterName ?? this.renterName,
      ownerId: ownerId ?? this.ownerId,
      status: status ?? this.status,
      consentAgreed: consentAgreed ?? this.consentAgreed,
      startDate: startDate ?? this.startDate,
      returnDueDate: returnDueDate ?? this.returnDueDate,
      handoverPhotosJson: handoverPhotosJson is String?
          ? handoverPhotosJson
          : this.handoverPhotosJson,
      returnPhotosJson: returnPhotosJson is String?
          ? returnPhotosJson
          : this.returnPhotosJson,
      totalRentAmount: totalRentAmount ?? this.totalRentAmount,
      depositHeld: depositHeld ?? this.depositHeld,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RentalRequestUpdateTable extends _is.UpdateTable<RentalRequestTable> {
  RentalRequestUpdateTable(super.table);

  _is.ColumnValue<int, int> itemId(int value) => _is.ColumnValue(
        table.itemId,
        value,
      );

  _is.ColumnValue<int, int> renterId(int value) => _is.ColumnValue(
        table.renterId,
        value,
      );

  _is.ColumnValue<String, String> renterName(String value) => _is.ColumnValue(
        table.renterName,
        value,
      );

  _is.ColumnValue<int, int> ownerId(int value) => _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
        table.status,
        value,
      );

  _is.ColumnValue<bool, bool> consentAgreed(bool value) => _is.ColumnValue(
        table.consentAgreed,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _is.ColumnValue(
        table.startDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> returnDueDate(DateTime value) =>
      _is.ColumnValue(
        table.returnDueDate,
        value,
      );

  _is.ColumnValue<String, String> handoverPhotosJson(String? value) =>
      _is.ColumnValue(
        table.handoverPhotosJson,
        value,
      );

  _is.ColumnValue<String, String> returnPhotosJson(String? value) =>
      _is.ColumnValue(
        table.returnPhotosJson,
        value,
      );

  _is.ColumnValue<double, double> totalRentAmount(double value) =>
      _is.ColumnValue(
        table.totalRentAmount,
        value,
      );

  _is.ColumnValue<double, double> depositHeld(double value) => _is.ColumnValue(
        table.depositHeld,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RentalRequestTable extends _is.Table<int?> {
  RentalRequestTable({super.tableRelation})
      : super(tableName: 'rental_request') {
    updateTable = RentalRequestUpdateTable(this);
    itemId = _is.ColumnInt(
      'itemId',
      this,
    );
    renterId = _is.ColumnInt(
      'renterId',
      this,
    );
    renterName = _is.ColumnString(
      'renterName',
      this,
    );
    ownerId = _is.ColumnInt(
      'ownerId',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    consentAgreed = _is.ColumnBool(
      'consentAgreed',
      this,
    );
    startDate = _is.ColumnDateTime(
      'startDate',
      this,
    );
    returnDueDate = _is.ColumnDateTime(
      'returnDueDate',
      this,
    );
    handoverPhotosJson = _is.ColumnString(
      'handoverPhotosJson',
      this,
    );
    returnPhotosJson = _is.ColumnString(
      'returnPhotosJson',
      this,
    );
    totalRentAmount = _is.ColumnDouble(
      'totalRentAmount',
      this,
    );
    depositHeld = _is.ColumnDouble(
      'depositHeld',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RentalRequestUpdateTable updateTable;

  late final _is.ColumnInt itemId;

  late final _is.ColumnInt renterId;

  late final _is.ColumnString renterName;

  late final _is.ColumnInt ownerId;

  late final _is.ColumnString status;

  late final _is.ColumnBool consentAgreed;

  late final _is.ColumnDateTime startDate;

  late final _is.ColumnDateTime returnDueDate;

  late final _is.ColumnString handoverPhotosJson;

  late final _is.ColumnString returnPhotosJson;

  late final _is.ColumnDouble totalRentAmount;

  late final _is.ColumnDouble depositHeld;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        itemId,
        renterId,
        renterName,
        ownerId,
        status,
        consentAgreed,
        startDate,
        returnDueDate,
        handoverPhotosJson,
        returnPhotosJson,
        totalRentAmount,
        depositHeld,
        createdAt,
      ];
}

class RentalRequestInclude extends _is.IncludeObject {
  RentalRequestInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RentalRequest.t;
}

class RentalRequestIncludeList extends _is.IncludeList {
  RentalRequestIncludeList._({
    _is.WhereExpressionBuilder<RentalRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RentalRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RentalRequest.t;
}

class RentalRequestRepository {
  const RentalRequestRepository._();

  /// Returns a list of [RentalRequest]s matching the given query parameters.
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
  Future<List<RentalRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RentalRequest>(
      where: where?.call(RentalRequest.t),
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RentalRequest] matching the given query parameters.
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
  Future<RentalRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RentalRequest>(
      where: where?.call(RentalRequest.t),
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RentalRequest] by its [id] or null if no such row exists.
  Future<RentalRequest?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RentalRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RentalRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [RentalRequest]s will have their `id` fields set.
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
  Future<List<RentalRequest>> insert(
    _is.DatabaseSession session,
    List<RentalRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RentalRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RentalRequest] and returns the inserted row.
  ///
  /// The returned [RentalRequest] will have its `id` field set.
  Future<RentalRequest> insertRow(
    _is.DatabaseSession session,
    RentalRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RentalRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RentalRequest]s in the list and returns the resulting rows.
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
  /// The returned [RentalRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalRequest>> upsert(
    _is.DatabaseSession session,
    List<RentalRequest> rows, {
    required _is.ColumnSelections<RentalRequestTable> conflictColumns,
    _is.ColumnSelections<RentalRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<RentalRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RentalRequest>(
      rows,
      conflictColumns: conflictColumns(RentalRequest.t),
      updateColumns: updateColumns?.call(RentalRequest.t),
      updateWhere: updateWhere?.call(RentalRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RentalRequest] and returns the resulting row.
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
  /// The returned [RentalRequest] will have its `id` field set.
  Future<RentalRequest?> upsertRow(
    _is.DatabaseSession session,
    RentalRequest row, {
    required _is.ColumnSelections<RentalRequestTable> conflictColumns,
    _is.ColumnSelections<RentalRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<RentalRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RentalRequest>(
      row,
      conflictColumns: conflictColumns(RentalRequest.t),
      updateColumns: updateColumns?.call(RentalRequest.t),
      updateWhere: updateWhere?.call(RentalRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [RentalRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalRequest>> update(
    _is.DatabaseSession session,
    List<RentalRequest> rows, {
    _is.ColumnSelections<RentalRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RentalRequest>(
      rows,
      columns: columns?.call(RentalRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RentalRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RentalRequest> updateRow(
    _is.DatabaseSession session,
    RentalRequest row, {
    _is.ColumnSelections<RentalRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RentalRequest>(
      row,
      columns: columns?.call(RentalRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RentalRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RentalRequest?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RentalRequestUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RentalRequest>(
      id,
      columnValues: columnValues(RentalRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RentalRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RentalRequestUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RentalRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RentalRequest>(
      columnValues: columnValues(RentalRequest.t.updateTable),
      where: where(RentalRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RentalRequest]s in the list and returns the deleted rows.
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
  Future<List<RentalRequest>> delete(
    _is.DatabaseSession session,
    List<RentalRequest> rows, {
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RentalRequest>(
      rows,
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RentalRequest].
  Future<RentalRequest> deleteRow(
    _is.DatabaseSession session,
    RentalRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RentalRequest>(
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
  Future<List<RentalRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RentalRequestTable> where,
    _is.OrderByBuilder<RentalRequestTable>? orderBy,
    _is.OrderByListBuilder<RentalRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RentalRequest>(
      where: where(RentalRequest.t),
      orderBy: orderBy?.call(RentalRequest.t),
      orderByList: orderByList?.call(RentalRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RentalRequest>(
      where: where?.call(RentalRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RentalRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RentalRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RentalRequest>(
      where: where(RentalRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
