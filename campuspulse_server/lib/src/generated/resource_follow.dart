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

abstract class ResourceFollow
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ResourceFollow._({
    this.id,
    required this.resourceId,
    required this.userId,
    required this.createdAt,
  });

  factory ResourceFollow({
    int? id,
    required int resourceId,
    required int userId,
    required DateTime createdAt,
  }) = _ResourceFollowImpl;

  factory ResourceFollow.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceFollow(
      id: jsonSerialization['id'] as int?,
      resourceId: jsonSerialization['resourceId'] as int,
      userId: jsonSerialization['userId'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ResourceFollowTable();

  static const db = ResourceFollowRepository._();

  @override
  int? id;

  int resourceId;

  int userId;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ResourceFollow]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ResourceFollow copyWith({
    int? id,
    int? resourceId,
    int? userId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceFollow',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceFollow',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'createdAt': createdAt.toJson(),
    };
  }

  static ResourceFollowInclude include() {
    return ResourceFollowInclude._();
  }

  static ResourceFollowIncludeList includeList({
    _is.WhereExpressionBuilder<ResourceFollowTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    ResourceFollowInclude? include,
  }) {
    return ResourceFollowIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceFollowImpl extends ResourceFollow {
  _ResourceFollowImpl({
    int? id,
    required int resourceId,
    required int userId,
    required DateTime createdAt,
  }) : super._(
          id: id,
          resourceId: resourceId,
          userId: userId,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ResourceFollow]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ResourceFollow copyWith({
    Object? id = _Undefined,
    int? resourceId,
    int? userId,
    DateTime? createdAt,
  }) {
    return ResourceFollow(
      id: id is int? ? id : this.id,
      resourceId: resourceId ?? this.resourceId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ResourceFollowUpdateTable extends _is.UpdateTable<ResourceFollowTable> {
  ResourceFollowUpdateTable(super.table);

  _is.ColumnValue<int, int> resourceId(int value) => _is.ColumnValue(
        table.resourceId,
        value,
      );

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ResourceFollowTable extends _is.Table<int?> {
  ResourceFollowTable({super.tableRelation})
      : super(tableName: 'resource_follow') {
    updateTable = ResourceFollowUpdateTable(this);
    resourceId = _is.ColumnInt(
      'resourceId',
      this,
    );
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ResourceFollowUpdateTable updateTable;

  late final _is.ColumnInt resourceId;

  late final _is.ColumnInt userId;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        resourceId,
        userId,
        createdAt,
      ];
}

class ResourceFollowInclude extends _is.IncludeObject {
  ResourceFollowInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ResourceFollow.t;
}

class ResourceFollowIncludeList extends _is.IncludeList {
  ResourceFollowIncludeList._({
    _is.WhereExpressionBuilder<ResourceFollowTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ResourceFollow.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ResourceFollow.t;
}

class ResourceFollowRepository {
  const ResourceFollowRepository._();

  /// Returns a list of [ResourceFollow]s matching the given query parameters.
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
  Future<List<ResourceFollow>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceFollowTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ResourceFollow>(
      where: where?.call(ResourceFollow.t),
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ResourceFollow] matching the given query parameters.
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
  Future<ResourceFollow?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceFollowTable>? where,
    int? offset,
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ResourceFollow>(
      where: where?.call(ResourceFollow.t),
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ResourceFollow] by its [id] or null if no such row exists.
  Future<ResourceFollow?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ResourceFollow>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ResourceFollow]s in the list and returns the inserted rows.
  ///
  /// The returned [ResourceFollow]s will have their `id` fields set.
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
  Future<List<ResourceFollow>> insert(
    _is.DatabaseSession session,
    List<ResourceFollow> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ResourceFollow>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ResourceFollow] and returns the inserted row.
  ///
  /// The returned [ResourceFollow] will have its `id` field set.
  Future<ResourceFollow> insertRow(
    _is.DatabaseSession session,
    ResourceFollow row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ResourceFollow>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ResourceFollow]s in the list and returns the resulting rows.
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
  /// The returned [ResourceFollow]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceFollow>> upsert(
    _is.DatabaseSession session,
    List<ResourceFollow> rows, {
    required _is.ColumnSelections<ResourceFollowTable> conflictColumns,
    _is.ColumnSelections<ResourceFollowTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceFollowTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ResourceFollow>(
      rows,
      conflictColumns: conflictColumns(ResourceFollow.t),
      updateColumns: updateColumns?.call(ResourceFollow.t),
      updateWhere: updateWhere?.call(ResourceFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ResourceFollow] and returns the resulting row.
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
  /// The returned [ResourceFollow] will have its `id` field set.
  Future<ResourceFollow?> upsertRow(
    _is.DatabaseSession session,
    ResourceFollow row, {
    required _is.ColumnSelections<ResourceFollowTable> conflictColumns,
    _is.ColumnSelections<ResourceFollowTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceFollowTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ResourceFollow>(
      row,
      conflictColumns: conflictColumns(ResourceFollow.t),
      updateColumns: updateColumns?.call(ResourceFollow.t),
      updateWhere: updateWhere?.call(ResourceFollow.t),
      transaction: transaction,
    );
  }

  /// Updates all [ResourceFollow]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceFollow>> update(
    _is.DatabaseSession session,
    List<ResourceFollow> rows, {
    _is.ColumnSelections<ResourceFollowTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ResourceFollow>(
      rows,
      columns: columns?.call(ResourceFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ResourceFollow]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ResourceFollow> updateRow(
    _is.DatabaseSession session,
    ResourceFollow row, {
    _is.ColumnSelections<ResourceFollowTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ResourceFollow>(
      row,
      columns: columns?.call(ResourceFollow.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ResourceFollow] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ResourceFollow?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ResourceFollowUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ResourceFollow>(
      id,
      columnValues: columnValues(ResourceFollow.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ResourceFollow]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceFollow>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ResourceFollowUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ResourceFollowTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ResourceFollow>(
      columnValues: columnValues(ResourceFollow.t.updateTable),
      where: where(ResourceFollow.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ResourceFollow]s in the list and returns the deleted rows.
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
  Future<List<ResourceFollow>> delete(
    _is.DatabaseSession session,
    List<ResourceFollow> rows, {
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ResourceFollow>(
      rows,
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ResourceFollow].
  Future<ResourceFollow> deleteRow(
    _is.DatabaseSession session,
    ResourceFollow row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ResourceFollow>(
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
  Future<List<ResourceFollow>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceFollowTable> where,
    _is.OrderByBuilder<ResourceFollowTable>? orderBy,
    _is.OrderByListBuilder<ResourceFollowTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ResourceFollow>(
      where: where(ResourceFollow.t),
      orderBy: orderBy?.call(ResourceFollow.t),
      orderByList: orderByList?.call(ResourceFollow.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceFollowTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ResourceFollow>(
      where: where?.call(ResourceFollow.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ResourceFollow] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceFollowTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ResourceFollow>(
      where: where(ResourceFollow.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
