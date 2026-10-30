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

abstract class ResourceComment
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ResourceComment._({
    this.id,
    required this.resourceId,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.content,
    required this.createdAt,
    required this.isReported,
  });

  factory ResourceComment({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
    required DateTime createdAt,
    required bool isReported,
  }) = _ResourceCommentImpl;

  factory ResourceComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return ResourceComment(
      id: jsonSerialization['id'] as int?,
      resourceId: jsonSerialization['resourceId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      userAvatarUrl: jsonSerialization['userAvatarUrl'] as String?,
      content: jsonSerialization['content'] as String,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isReported:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isReported']),
    );
  }

  static final t = ResourceCommentTable();

  static const db = ResourceCommentRepository._();

  @override
  int? id;

  int resourceId;

  int userId;

  String userName;

  String? userAvatarUrl;

  String content;

  DateTime createdAt;

  bool isReported;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ResourceComment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ResourceComment copyWith({
    int? id,
    int? resourceId,
    int? userId,
    String? userName,
    String? userAvatarUrl,
    String? content,
    DateTime? createdAt,
    bool? isReported,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ResourceComment',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isReported': isReported,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ResourceComment',
      if (id != null) 'id': id,
      'resourceId': resourceId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isReported': isReported,
    };
  }

  static ResourceCommentInclude include() {
    return ResourceCommentInclude._();
  }

  static ResourceCommentIncludeList includeList({
    _is.WhereExpressionBuilder<ResourceCommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    ResourceCommentInclude? include,
  }) {
    return ResourceCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceCommentImpl extends ResourceComment {
  _ResourceCommentImpl({
    int? id,
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
    required DateTime createdAt,
    required bool isReported,
  }) : super._(
          id: id,
          resourceId: resourceId,
          userId: userId,
          userName: userName,
          userAvatarUrl: userAvatarUrl,
          content: content,
          createdAt: createdAt,
          isReported: isReported,
        );

  /// Returns a shallow copy of this [ResourceComment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ResourceComment copyWith({
    Object? id = _Undefined,
    int? resourceId,
    int? userId,
    String? userName,
    Object? userAvatarUrl = _Undefined,
    String? content,
    DateTime? createdAt,
    bool? isReported,
  }) {
    return ResourceComment(
      id: id is int? ? id : this.id,
      resourceId: resourceId ?? this.resourceId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatarUrl:
          userAvatarUrl is String? ? userAvatarUrl : this.userAvatarUrl,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isReported: isReported ?? this.isReported,
    );
  }
}

class ResourceCommentUpdateTable extends _is.UpdateTable<ResourceCommentTable> {
  ResourceCommentUpdateTable(super.table);

  _is.ColumnValue<int, int> resourceId(int value) => _is.ColumnValue(
        table.resourceId,
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

  _is.ColumnValue<String, String> userAvatarUrl(String? value) =>
      _is.ColumnValue(
        table.userAvatarUrl,
        value,
      );

  _is.ColumnValue<String, String> content(String value) => _is.ColumnValue(
        table.content,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<bool, bool> isReported(bool value) => _is.ColumnValue(
        table.isReported,
        value,
      );
}

class ResourceCommentTable extends _is.Table<int?> {
  ResourceCommentTable({super.tableRelation})
      : super(tableName: 'resource_comment') {
    updateTable = ResourceCommentUpdateTable(this);
    resourceId = _is.ColumnInt(
      'resourceId',
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
    userAvatarUrl = _is.ColumnString(
      'userAvatarUrl',
      this,
    );
    content = _is.ColumnString(
      'content',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    isReported = _is.ColumnBool(
      'isReported',
      this,
    );
  }

  late final ResourceCommentUpdateTable updateTable;

  late final _is.ColumnInt resourceId;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userName;

  late final _is.ColumnString userAvatarUrl;

  late final _is.ColumnString content;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnBool isReported;

  @override
  List<_is.Column> get columns => [
        id,
        resourceId,
        userId,
        userName,
        userAvatarUrl,
        content,
        createdAt,
        isReported,
      ];
}

class ResourceCommentInclude extends _is.IncludeObject {
  ResourceCommentInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ResourceComment.t;
}

class ResourceCommentIncludeList extends _is.IncludeList {
  ResourceCommentIncludeList._({
    _is.WhereExpressionBuilder<ResourceCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ResourceComment.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ResourceComment.t;
}

class ResourceCommentRepository {
  const ResourceCommentRepository._();

  /// Returns a list of [ResourceComment]s matching the given query parameters.
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
  Future<List<ResourceComment>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceCommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ResourceComment>(
      where: where?.call(ResourceComment.t),
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ResourceComment] matching the given query parameters.
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
  Future<ResourceComment?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceCommentTable>? where,
    int? offset,
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ResourceComment>(
      where: where?.call(ResourceComment.t),
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ResourceComment] by its [id] or null if no such row exists.
  Future<ResourceComment?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ResourceComment>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ResourceComment]s in the list and returns the inserted rows.
  ///
  /// The returned [ResourceComment]s will have their `id` fields set.
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
  Future<List<ResourceComment>> insert(
    _is.DatabaseSession session,
    List<ResourceComment> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ResourceComment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ResourceComment] and returns the inserted row.
  ///
  /// The returned [ResourceComment] will have its `id` field set.
  Future<ResourceComment> insertRow(
    _is.DatabaseSession session,
    ResourceComment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ResourceComment>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ResourceComment]s in the list and returns the resulting rows.
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
  /// The returned [ResourceComment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceComment>> upsert(
    _is.DatabaseSession session,
    List<ResourceComment> rows, {
    required _is.ColumnSelections<ResourceCommentTable> conflictColumns,
    _is.ColumnSelections<ResourceCommentTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceCommentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ResourceComment>(
      rows,
      conflictColumns: conflictColumns(ResourceComment.t),
      updateColumns: updateColumns?.call(ResourceComment.t),
      updateWhere: updateWhere?.call(ResourceComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ResourceComment] and returns the resulting row.
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
  /// The returned [ResourceComment] will have its `id` field set.
  Future<ResourceComment?> upsertRow(
    _is.DatabaseSession session,
    ResourceComment row, {
    required _is.ColumnSelections<ResourceCommentTable> conflictColumns,
    _is.ColumnSelections<ResourceCommentTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceCommentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ResourceComment>(
      row,
      conflictColumns: conflictColumns(ResourceComment.t),
      updateColumns: updateColumns?.call(ResourceComment.t),
      updateWhere: updateWhere?.call(ResourceComment.t),
      transaction: transaction,
    );
  }

  /// Updates all [ResourceComment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceComment>> update(
    _is.DatabaseSession session,
    List<ResourceComment> rows, {
    _is.ColumnSelections<ResourceCommentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ResourceComment>(
      rows,
      columns: columns?.call(ResourceComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ResourceComment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ResourceComment> updateRow(
    _is.DatabaseSession session,
    ResourceComment row, {
    _is.ColumnSelections<ResourceCommentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ResourceComment>(
      row,
      columns: columns?.call(ResourceComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ResourceComment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ResourceComment?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ResourceCommentUpdateTable>
        columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ResourceComment>(
      id,
      columnValues: columnValues(ResourceComment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ResourceComment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ResourceComment>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ResourceCommentUpdateTable>
        columnValues,
    required _is.WhereExpressionBuilder<ResourceCommentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ResourceComment>(
      columnValues: columnValues(ResourceComment.t.updateTable),
      where: where(ResourceComment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ResourceComment]s in the list and returns the deleted rows.
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
  Future<List<ResourceComment>> delete(
    _is.DatabaseSession session,
    List<ResourceComment> rows, {
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ResourceComment>(
      rows,
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ResourceComment].
  Future<ResourceComment> deleteRow(
    _is.DatabaseSession session,
    ResourceComment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ResourceComment>(
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
  Future<List<ResourceComment>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceCommentTable> where,
    _is.OrderByBuilder<ResourceCommentTable>? orderBy,
    _is.OrderByListBuilder<ResourceCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ResourceComment>(
      where: where(ResourceComment.t),
      orderBy: orderBy?.call(ResourceComment.t),
      orderByList: orderByList?.call(ResourceComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceCommentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ResourceComment>(
      where: where?.call(ResourceComment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ResourceComment] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceCommentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ResourceComment>(
      where: where(ResourceComment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
