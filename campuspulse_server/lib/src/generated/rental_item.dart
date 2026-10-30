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

abstract class RentalItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RentalItem._({
    this.id,
    required this.ownerId,
    required this.ownerName,
    required this.title,
    required this.category,
    required this.description,
    required this.photosJson,
    required this.rentPricePerDay,
    required this.depositAmount,
    required this.condition,
    required this.isAvailable,
    required this.pickupPlace,
    required this.collegeId,
    required this.createdAt,
  });

  factory RentalItem({
    int? id,
    required int ownerId,
    required String ownerName,
    required String title,
    required String category,
    required String description,
    required String photosJson,
    required double rentPricePerDay,
    required double depositAmount,
    required String condition,
    required bool isAvailable,
    required String pickupPlace,
    required int collegeId,
    required DateTime createdAt,
  }) = _RentalItemImpl;

  factory RentalItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RentalItem(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      ownerName: jsonSerialization['ownerName'] as String,
      title: jsonSerialization['title'] as String,
      category: jsonSerialization['category'] as String,
      description: jsonSerialization['description'] as String,
      photosJson: jsonSerialization['photosJson'] as String,
      rentPricePerDay: (jsonSerialization['rentPricePerDay'] as num).toDouble(),
      depositAmount: (jsonSerialization['depositAmount'] as num).toDouble(),
      condition: jsonSerialization['condition'] as String,
      isAvailable:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isAvailable']),
      pickupPlace: jsonSerialization['pickupPlace'] as String,
      collegeId: jsonSerialization['collegeId'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = RentalItemTable();

  static const db = RentalItemRepository._();

  @override
  int? id;

  int ownerId;

  String ownerName;

  String title;

  String category;

  String description;

  String photosJson;

  double rentPricePerDay;

  double depositAmount;

  String condition;

  bool isAvailable;

  String pickupPlace;

  int collegeId;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RentalItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RentalItem copyWith({
    int? id,
    int? ownerId,
    String? ownerName,
    String? title,
    String? category,
    String? description,
    String? photosJson,
    double? rentPricePerDay,
    double? depositAmount,
    String? condition,
    bool? isAvailable,
    String? pickupPlace,
    int? collegeId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RentalItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'title': title,
      'category': category,
      'description': description,
      'photosJson': photosJson,
      'rentPricePerDay': rentPricePerDay,
      'depositAmount': depositAmount,
      'condition': condition,
      'isAvailable': isAvailable,
      'pickupPlace': pickupPlace,
      'collegeId': collegeId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RentalItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'title': title,
      'category': category,
      'description': description,
      'photosJson': photosJson,
      'rentPricePerDay': rentPricePerDay,
      'depositAmount': depositAmount,
      'condition': condition,
      'isAvailable': isAvailable,
      'pickupPlace': pickupPlace,
      'collegeId': collegeId,
      'createdAt': createdAt.toJson(),
    };
  }

  static RentalItemInclude include() {
    return RentalItemInclude._();
  }

  static RentalItemIncludeList includeList({
    _is.WhereExpressionBuilder<RentalItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    RentalItemInclude? include,
  }) {
    return RentalItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalItemImpl extends RentalItem {
  _RentalItemImpl({
    int? id,
    required int ownerId,
    required String ownerName,
    required String title,
    required String category,
    required String description,
    required String photosJson,
    required double rentPricePerDay,
    required double depositAmount,
    required String condition,
    required bool isAvailable,
    required String pickupPlace,
    required int collegeId,
    required DateTime createdAt,
  }) : super._(
          id: id,
          ownerId: ownerId,
          ownerName: ownerName,
          title: title,
          category: category,
          description: description,
          photosJson: photosJson,
          rentPricePerDay: rentPricePerDay,
          depositAmount: depositAmount,
          condition: condition,
          isAvailable: isAvailable,
          pickupPlace: pickupPlace,
          collegeId: collegeId,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [RentalItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RentalItem copyWith({
    Object? id = _Undefined,
    int? ownerId,
    String? ownerName,
    String? title,
    String? category,
    String? description,
    String? photosJson,
    double? rentPricePerDay,
    double? depositAmount,
    String? condition,
    bool? isAvailable,
    String? pickupPlace,
    int? collegeId,
    DateTime? createdAt,
  }) {
    return RentalItem(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      photosJson: photosJson ?? this.photosJson,
      rentPricePerDay: rentPricePerDay ?? this.rentPricePerDay,
      depositAmount: depositAmount ?? this.depositAmount,
      condition: condition ?? this.condition,
      isAvailable: isAvailable ?? this.isAvailable,
      pickupPlace: pickupPlace ?? this.pickupPlace,
      collegeId: collegeId ?? this.collegeId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RentalItemUpdateTable extends _is.UpdateTable<RentalItemTable> {
  RentalItemUpdateTable(super.table);

  _is.ColumnValue<int, int> ownerId(int value) => _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> ownerName(String value) => _is.ColumnValue(
        table.ownerName,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
        table.title,
        value,
      );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
        table.category,
        value,
      );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
        table.description,
        value,
      );

  _is.ColumnValue<String, String> photosJson(String value) => _is.ColumnValue(
        table.photosJson,
        value,
      );

  _is.ColumnValue<double, double> rentPricePerDay(double value) =>
      _is.ColumnValue(
        table.rentPricePerDay,
        value,
      );

  _is.ColumnValue<double, double> depositAmount(double value) =>
      _is.ColumnValue(
        table.depositAmount,
        value,
      );

  _is.ColumnValue<String, String> condition(String value) => _is.ColumnValue(
        table.condition,
        value,
      );

  _is.ColumnValue<bool, bool> isAvailable(bool value) => _is.ColumnValue(
        table.isAvailable,
        value,
      );

  _is.ColumnValue<String, String> pickupPlace(String value) => _is.ColumnValue(
        table.pickupPlace,
        value,
      );

  _is.ColumnValue<int, int> collegeId(int value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RentalItemTable extends _is.Table<int?> {
  RentalItemTable({super.tableRelation}) : super(tableName: 'rental_item') {
    updateTable = RentalItemUpdateTable(this);
    ownerId = _is.ColumnInt(
      'ownerId',
      this,
    );
    ownerName = _is.ColumnString(
      'ownerName',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    photosJson = _is.ColumnString(
      'photosJson',
      this,
    );
    rentPricePerDay = _is.ColumnDouble(
      'rentPricePerDay',
      this,
    );
    depositAmount = _is.ColumnDouble(
      'depositAmount',
      this,
    );
    condition = _is.ColumnString(
      'condition',
      this,
    );
    isAvailable = _is.ColumnBool(
      'isAvailable',
      this,
    );
    pickupPlace = _is.ColumnString(
      'pickupPlace',
      this,
    );
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RentalItemUpdateTable updateTable;

  late final _is.ColumnInt ownerId;

  late final _is.ColumnString ownerName;

  late final _is.ColumnString title;

  late final _is.ColumnString category;

  late final _is.ColumnString description;

  late final _is.ColumnString photosJson;

  late final _is.ColumnDouble rentPricePerDay;

  late final _is.ColumnDouble depositAmount;

  late final _is.ColumnString condition;

  late final _is.ColumnBool isAvailable;

  late final _is.ColumnString pickupPlace;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        ownerId,
        ownerName,
        title,
        category,
        description,
        photosJson,
        rentPricePerDay,
        depositAmount,
        condition,
        isAvailable,
        pickupPlace,
        collegeId,
        createdAt,
      ];
}

class RentalItemInclude extends _is.IncludeObject {
  RentalItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RentalItem.t;
}

class RentalItemIncludeList extends _is.IncludeList {
  RentalItemIncludeList._({
    _is.WhereExpressionBuilder<RentalItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RentalItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RentalItem.t;
}

class RentalItemRepository {
  const RentalItemRepository._();

  /// Returns a list of [RentalItem]s matching the given query parameters.
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
  Future<List<RentalItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RentalItem>(
      where: where?.call(RentalItem.t),
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RentalItem] matching the given query parameters.
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
  Future<RentalItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalItemTable>? where,
    int? offset,
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RentalItem>(
      where: where?.call(RentalItem.t),
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RentalItem] by its [id] or null if no such row exists.
  Future<RentalItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RentalItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RentalItem]s in the list and returns the inserted rows.
  ///
  /// The returned [RentalItem]s will have their `id` fields set.
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
  Future<List<RentalItem>> insert(
    _is.DatabaseSession session,
    List<RentalItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RentalItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RentalItem] and returns the inserted row.
  ///
  /// The returned [RentalItem] will have its `id` field set.
  Future<RentalItem> insertRow(
    _is.DatabaseSession session,
    RentalItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RentalItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RentalItem]s in the list and returns the resulting rows.
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
  /// The returned [RentalItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalItem>> upsert(
    _is.DatabaseSession session,
    List<RentalItem> rows, {
    required _is.ColumnSelections<RentalItemTable> conflictColumns,
    _is.ColumnSelections<RentalItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RentalItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RentalItem>(
      rows,
      conflictColumns: conflictColumns(RentalItem.t),
      updateColumns: updateColumns?.call(RentalItem.t),
      updateWhere: updateWhere?.call(RentalItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RentalItem] and returns the resulting row.
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
  /// The returned [RentalItem] will have its `id` field set.
  Future<RentalItem?> upsertRow(
    _is.DatabaseSession session,
    RentalItem row, {
    required _is.ColumnSelections<RentalItemTable> conflictColumns,
    _is.ColumnSelections<RentalItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RentalItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RentalItem>(
      row,
      conflictColumns: conflictColumns(RentalItem.t),
      updateColumns: updateColumns?.call(RentalItem.t),
      updateWhere: updateWhere?.call(RentalItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [RentalItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalItem>> update(
    _is.DatabaseSession session,
    List<RentalItem> rows, {
    _is.ColumnSelections<RentalItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RentalItem>(
      rows,
      columns: columns?.call(RentalItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RentalItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RentalItem> updateRow(
    _is.DatabaseSession session,
    RentalItem row, {
    _is.ColumnSelections<RentalItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RentalItem>(
      row,
      columns: columns?.call(RentalItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RentalItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RentalItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RentalItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RentalItem>(
      id,
      columnValues: columnValues(RentalItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RentalItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RentalItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RentalItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RentalItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RentalItem>(
      columnValues: columnValues(RentalItem.t.updateTable),
      where: where(RentalItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RentalItem]s in the list and returns the deleted rows.
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
  Future<List<RentalItem>> delete(
    _is.DatabaseSession session,
    List<RentalItem> rows, {
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RentalItem>(
      rows,
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RentalItem].
  Future<RentalItem> deleteRow(
    _is.DatabaseSession session,
    RentalItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RentalItem>(
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
  Future<List<RentalItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RentalItemTable> where,
    _is.OrderByBuilder<RentalItemTable>? orderBy,
    _is.OrderByListBuilder<RentalItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RentalItem>(
      where: where(RentalItem.t),
      orderBy: orderBy?.call(RentalItem.t),
      orderByList: orderByList?.call(RentalItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RentalItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RentalItem>(
      where: where?.call(RentalItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RentalItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RentalItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RentalItem>(
      where: where(RentalItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
