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

abstract class Community
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Community._({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    this.iconUrl,
    required this.creatorUserId,
    this.collegeId,
    required this.isPrivate,
    required this.memberCount,
    required this.createdAt,
  });

  factory Community({
    int? id,
    required String name,
    required String description,
    required String category,
    String? iconUrl,
    required int creatorUserId,
    int? collegeId,
    required bool isPrivate,
    required int memberCount,
    required DateTime createdAt,
  }) = _CommunityImpl;

  factory Community.fromJson(Map<String, dynamic> jsonSerialization) {
    return Community(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      collegeId: jsonSerialization['collegeId'] as int?,
      isPrivate: _is.BoolJsonExtension.fromJson(jsonSerialization['isPrivate']),
      memberCount: jsonSerialization['memberCount'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CommunityTable();

  static const db = CommunityRepository._();

  @override
  int? id;

  String name;

  String description;

  String category;

  String? iconUrl;

  int creatorUserId;

  int? collegeId;

  bool isPrivate;

  int memberCount;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Community copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? iconUrl,
    int? creatorUserId,
    int? collegeId,
    bool? isPrivate,
    int? memberCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'creatorUserId': creatorUserId,
      if (collegeId != null) 'collegeId': collegeId,
      'isPrivate': isPrivate,
      'memberCount': memberCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'creatorUserId': creatorUserId,
      if (collegeId != null) 'collegeId': collegeId,
      'isPrivate': isPrivate,
      'memberCount': memberCount,
      'createdAt': createdAt.toJson(),
    };
  }

  static CommunityInclude include() {
    return CommunityInclude._();
  }

  static CommunityIncludeList includeList({
    _is.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    CommunityInclude? include,
  }) {
    return CommunityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityImpl extends Community {
  _CommunityImpl({
    int? id,
    required String name,
    required String description,
    required String category,
    String? iconUrl,
    required int creatorUserId,
    int? collegeId,
    required bool isPrivate,
    required int memberCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          category: category,
          iconUrl: iconUrl,
          creatorUserId: creatorUserId,
          collegeId: collegeId,
          isPrivate: isPrivate,
          memberCount: memberCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Community copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? category,
    Object? iconUrl = _Undefined,
    int? creatorUserId,
    Object? collegeId = _Undefined,
    bool? isPrivate,
    int? memberCount,
    DateTime? createdAt,
  }) {
    return Community(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      collegeId: collegeId is int? ? collegeId : this.collegeId,
      isPrivate: isPrivate ?? this.isPrivate,
      memberCount: memberCount ?? this.memberCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CommunityUpdateTable extends _is.UpdateTable<CommunityTable> {
  CommunityUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
        table.name,
        value,
      );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
        table.description,
        value,
      );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
        table.category,
        value,
      );

  _is.ColumnValue<String, String> iconUrl(String? value) => _is.ColumnValue(
        table.iconUrl,
        value,
      );

  _is.ColumnValue<int, int> creatorUserId(int value) => _is.ColumnValue(
        table.creatorUserId,
        value,
      );

  _is.ColumnValue<int, int> collegeId(int? value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<bool, bool> isPrivate(bool value) => _is.ColumnValue(
        table.isPrivate,
        value,
      );

  _is.ColumnValue<int, int> memberCount(int value) => _is.ColumnValue(
        table.memberCount,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CommunityTable extends _is.Table<int?> {
  CommunityTable({super.tableRelation}) : super(tableName: 'community') {
    updateTable = CommunityUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    iconUrl = _is.ColumnString(
      'iconUrl',
      this,
    );
    creatorUserId = _is.ColumnInt(
      'creatorUserId',
      this,
    );
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    isPrivate = _is.ColumnBool(
      'isPrivate',
      this,
    );
    memberCount = _is.ColumnInt(
      'memberCount',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CommunityUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnString iconUrl;

  late final _is.ColumnInt creatorUserId;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnBool isPrivate;

  late final _is.ColumnInt memberCount;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        name,
        description,
        category,
        iconUrl,
        creatorUserId,
        collegeId,
        isPrivate,
        memberCount,
        createdAt,
      ];
}

class CommunityInclude extends _is.IncludeObject {
  CommunityInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Community.t;
}

class CommunityIncludeList extends _is.IncludeList {
  CommunityIncludeList._({
    _is.WhereExpressionBuilder<CommunityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Community.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Community.t;
}

class CommunityRepository {
  const CommunityRepository._();

  /// Returns a list of [Community]s matching the given query parameters.
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
  Future<List<Community>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Community>(
      where: where?.call(Community.t),
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Community] matching the given query parameters.
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
  Future<Community?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityTable>? where,
    int? offset,
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Community>(
      where: where?.call(Community.t),
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Community] by its [id] or null if no such row exists.
  Future<Community?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Community>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Community]s in the list and returns the inserted rows.
  ///
  /// The returned [Community]s will have their `id` fields set.
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
  Future<List<Community>> insert(
    _is.DatabaseSession session,
    List<Community> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Community>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Community] and returns the inserted row.
  ///
  /// The returned [Community] will have its `id` field set.
  Future<Community> insertRow(
    _is.DatabaseSession session,
    Community row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Community>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Community]s in the list and returns the resulting rows.
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
  /// The returned [Community]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Community>> upsert(
    _is.DatabaseSession session,
    List<Community> rows, {
    required _is.ColumnSelections<CommunityTable> conflictColumns,
    _is.ColumnSelections<CommunityTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Community>(
      rows,
      conflictColumns: conflictColumns(Community.t),
      updateColumns: updateColumns?.call(Community.t),
      updateWhere: updateWhere?.call(Community.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Community] and returns the resulting row.
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
  /// The returned [Community] will have its `id` field set.
  Future<Community?> upsertRow(
    _is.DatabaseSession session,
    Community row, {
    required _is.ColumnSelections<CommunityTable> conflictColumns,
    _is.ColumnSelections<CommunityTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Community>(
      row,
      conflictColumns: conflictColumns(Community.t),
      updateColumns: updateColumns?.call(Community.t),
      updateWhere: updateWhere?.call(Community.t),
      transaction: transaction,
    );
  }

  /// Updates all [Community]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Community>> update(
    _is.DatabaseSession session,
    List<Community> rows, {
    _is.ColumnSelections<CommunityTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Community>(
      rows,
      columns: columns?.call(Community.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Community]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Community> updateRow(
    _is.DatabaseSession session,
    Community row, {
    _is.ColumnSelections<CommunityTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Community>(
      row,
      columns: columns?.call(Community.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Community] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Community?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommunityUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Community>(
      id,
      columnValues: columnValues(Community.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Community]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Community>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommunityUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CommunityTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Community>(
      columnValues: columnValues(Community.t.updateTable),
      where: where(Community.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Community]s in the list and returns the deleted rows.
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
  Future<List<Community>> delete(
    _is.DatabaseSession session,
    List<Community> rows, {
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Community>(
      rows,
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Community].
  Future<Community> deleteRow(
    _is.DatabaseSession session,
    Community row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Community>(
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
  Future<List<Community>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityTable> where,
    _is.OrderByBuilder<CommunityTable>? orderBy,
    _is.OrderByListBuilder<CommunityTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Community>(
      where: where(Community.t),
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Community>(
      where: where?.call(Community.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Community] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Community>(
      where: where(Community.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
