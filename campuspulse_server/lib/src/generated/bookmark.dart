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

abstract class Bookmark
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Bookmark._({
    this.id,
    required this.userId,
    required this.resourceType,
    required this.targetId,
    required this.title,
    this.subtitle,
    required this.createdAt,
  });

  factory Bookmark({
    int? id,
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
    required DateTime createdAt,
  }) = _BookmarkImpl;

  factory Bookmark.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bookmark(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      resourceType: jsonSerialization['resourceType'] as String,
      targetId: jsonSerialization['targetId'] as int,
      title: jsonSerialization['title'] as String,
      subtitle: jsonSerialization['subtitle'] as String?,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = BookmarkTable();

  static const db = BookmarkRepository._();

  @override
  int? id;

  int userId;

  String resourceType;

  int targetId;

  String title;

  String? subtitle;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Bookmark copyWith({
    int? id,
    int? userId,
    String? resourceType,
    int? targetId,
    String? title,
    String? subtitle,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'resourceType': resourceType,
      'targetId': targetId,
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'resourceType': resourceType,
      'targetId': targetId,
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      'createdAt': createdAt.toJson(),
    };
  }

  static BookmarkInclude include() {
    return BookmarkInclude._();
  }

  static BookmarkIncludeList includeList({
    _is.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    BookmarkInclude? include,
  }) {
    return BookmarkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookmarkImpl extends Bookmark {
  _BookmarkImpl({
    int? id,
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          resourceType: resourceType,
          targetId: targetId,
          title: title,
          subtitle: subtitle,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Bookmark copyWith({
    Object? id = _Undefined,
    int? userId,
    String? resourceType,
    int? targetId,
    String? title,
    Object? subtitle = _Undefined,
    DateTime? createdAt,
  }) {
    return Bookmark(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      resourceType: resourceType ?? this.resourceType,
      targetId: targetId ?? this.targetId,
      title: title ?? this.title,
      subtitle: subtitle is String? ? subtitle : this.subtitle,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookmarkUpdateTable extends _is.UpdateTable<BookmarkTable> {
  BookmarkUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> resourceType(String value) => _is.ColumnValue(
        table.resourceType,
        value,
      );

  _is.ColumnValue<int, int> targetId(int value) => _is.ColumnValue(
        table.targetId,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
        table.title,
        value,
      );

  _is.ColumnValue<String, String> subtitle(String? value) => _is.ColumnValue(
        table.subtitle,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class BookmarkTable extends _is.Table<int?> {
  BookmarkTable({super.tableRelation}) : super(tableName: 'bookmark') {
    updateTable = BookmarkUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    resourceType = _is.ColumnString(
      'resourceType',
      this,
    );
    targetId = _is.ColumnInt(
      'targetId',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    subtitle = _is.ColumnString(
      'subtitle',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final BookmarkUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnString resourceType;

  late final _is.ColumnInt targetId;

  late final _is.ColumnString title;

  late final _is.ColumnString subtitle;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        userId,
        resourceType,
        targetId,
        title,
        subtitle,
        createdAt,
      ];
}

class BookmarkInclude extends _is.IncludeObject {
  BookmarkInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Bookmark.t;
}

class BookmarkIncludeList extends _is.IncludeList {
  BookmarkIncludeList._({
    _is.WhereExpressionBuilder<BookmarkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bookmark.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Bookmark.t;
}

class BookmarkRepository {
  const BookmarkRepository._();

  /// Returns a list of [Bookmark]s matching the given query parameters.
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
  Future<List<Bookmark>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Bookmark>(
      where: where?.call(Bookmark.t),
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Bookmark] matching the given query parameters.
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
  Future<Bookmark?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookmarkTable>? where,
    int? offset,
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Bookmark>(
      where: where?.call(Bookmark.t),
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Bookmark] by its [id] or null if no such row exists.
  Future<Bookmark?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Bookmark>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Bookmark]s in the list and returns the inserted rows.
  ///
  /// The returned [Bookmark]s will have their `id` fields set.
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
  Future<List<Bookmark>> insert(
    _is.DatabaseSession session,
    List<Bookmark> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Bookmark>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Bookmark] and returns the inserted row.
  ///
  /// The returned [Bookmark] will have its `id` field set.
  Future<Bookmark> insertRow(
    _is.DatabaseSession session,
    Bookmark row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bookmark>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Bookmark]s in the list and returns the resulting rows.
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
  /// The returned [Bookmark]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bookmark>> upsert(
    _is.DatabaseSession session,
    List<Bookmark> rows, {
    required _is.ColumnSelections<BookmarkTable> conflictColumns,
    _is.ColumnSelections<BookmarkTable>? updateColumns,
    _is.WhereExpressionBuilder<BookmarkTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Bookmark>(
      rows,
      conflictColumns: conflictColumns(Bookmark.t),
      updateColumns: updateColumns?.call(Bookmark.t),
      updateWhere: updateWhere?.call(Bookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Bookmark] and returns the resulting row.
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
  /// The returned [Bookmark] will have its `id` field set.
  Future<Bookmark?> upsertRow(
    _is.DatabaseSession session,
    Bookmark row, {
    required _is.ColumnSelections<BookmarkTable> conflictColumns,
    _is.ColumnSelections<BookmarkTable>? updateColumns,
    _is.WhereExpressionBuilder<BookmarkTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Bookmark>(
      row,
      conflictColumns: conflictColumns(Bookmark.t),
      updateColumns: updateColumns?.call(Bookmark.t),
      updateWhere: updateWhere?.call(Bookmark.t),
      transaction: transaction,
    );
  }

  /// Updates all [Bookmark]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bookmark>> update(
    _is.DatabaseSession session,
    List<Bookmark> rows, {
    _is.ColumnSelections<BookmarkTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Bookmark>(
      rows,
      columns: columns?.call(Bookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Bookmark]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Bookmark> updateRow(
    _is.DatabaseSession session,
    Bookmark row, {
    _is.ColumnSelections<BookmarkTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bookmark>(
      row,
      columns: columns?.call(Bookmark.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Bookmark] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Bookmark?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BookmarkUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Bookmark>(
      id,
      columnValues: columnValues(Bookmark.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Bookmark]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Bookmark>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BookmarkUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BookmarkTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Bookmark>(
      columnValues: columnValues(Bookmark.t.updateTable),
      where: where(Bookmark.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Bookmark]s in the list and returns the deleted rows.
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
  Future<List<Bookmark>> delete(
    _is.DatabaseSession session,
    List<Bookmark> rows, {
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Bookmark>(
      rows,
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Bookmark].
  Future<Bookmark> deleteRow(
    _is.DatabaseSession session,
    Bookmark row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bookmark>(
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
  Future<List<Bookmark>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookmarkTable> where,
    _is.OrderByBuilder<BookmarkTable>? orderBy,
    _is.OrderByListBuilder<BookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Bookmark>(
      where: where(Bookmark.t),
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Bookmark>(
      where: where?.call(Bookmark.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Bookmark] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookmarkTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Bookmark>(
      where: where(Bookmark.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
