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

abstract class Conversation
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Conversation._({
    this.id,
    required this.user1Id,
    required this.user2Id,
    this.lastMessageSnippet,
    this.lastMessageAt,
    required this.user1UnreadCount,
    required this.user2UnreadCount,
    required this.isAccepted,
  });

  factory Conversation({
    int? id,
    required int user1Id,
    required int user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    required int user1UnreadCount,
    required int user2UnreadCount,
    required bool isAccepted,
  }) = _ConversationImpl;

  factory Conversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Conversation(
      id: jsonSerialization['id'] as int?,
      user1Id: jsonSerialization['user1Id'] as int,
      user2Id: jsonSerialization['user2Id'] as int,
      lastMessageSnippet: jsonSerialization['lastMessageSnippet'] as String?,
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt']),
      user1UnreadCount: jsonSerialization['user1UnreadCount'] as int,
      user2UnreadCount: jsonSerialization['user2UnreadCount'] as int,
      isAccepted:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isAccepted']),
    );
  }

  static final t = ConversationTable();

  static const db = ConversationRepository._();

  @override
  int? id;

  int user1Id;

  int user2Id;

  String? lastMessageSnippet;

  DateTime? lastMessageAt;

  int user1UnreadCount;

  int user2UnreadCount;

  bool isAccepted;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Conversation copyWith({
    int? id,
    int? user1Id,
    int? user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    int? user1UnreadCount,
    int? user2UnreadCount,
    bool? isAccepted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Conversation',
      if (id != null) 'id': id,
      'user1Id': user1Id,
      'user2Id': user2Id,
      if (lastMessageSnippet != null) 'lastMessageSnippet': lastMessageSnippet,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      'user1UnreadCount': user1UnreadCount,
      'user2UnreadCount': user2UnreadCount,
      'isAccepted': isAccepted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Conversation',
      if (id != null) 'id': id,
      'user1Id': user1Id,
      'user2Id': user2Id,
      if (lastMessageSnippet != null) 'lastMessageSnippet': lastMessageSnippet,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      'user1UnreadCount': user1UnreadCount,
      'user2UnreadCount': user2UnreadCount,
      'isAccepted': isAccepted,
    };
  }

  static ConversationInclude include() {
    return ConversationInclude._();
  }

  static ConversationIncludeList includeList({
    _is.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    ConversationInclude? include,
  }) {
    return ConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConversationImpl extends Conversation {
  _ConversationImpl({
    int? id,
    required int user1Id,
    required int user2Id,
    String? lastMessageSnippet,
    DateTime? lastMessageAt,
    required int user1UnreadCount,
    required int user2UnreadCount,
    required bool isAccepted,
  }) : super._(
          id: id,
          user1Id: user1Id,
          user2Id: user2Id,
          lastMessageSnippet: lastMessageSnippet,
          lastMessageAt: lastMessageAt,
          user1UnreadCount: user1UnreadCount,
          user2UnreadCount: user2UnreadCount,
          isAccepted: isAccepted,
        );

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Conversation copyWith({
    Object? id = _Undefined,
    int? user1Id,
    int? user2Id,
    Object? lastMessageSnippet = _Undefined,
    Object? lastMessageAt = _Undefined,
    int? user1UnreadCount,
    int? user2UnreadCount,
    bool? isAccepted,
  }) {
    return Conversation(
      id: id is int? ? id : this.id,
      user1Id: user1Id ?? this.user1Id,
      user2Id: user2Id ?? this.user2Id,
      lastMessageSnippet: lastMessageSnippet is String?
          ? lastMessageSnippet
          : this.lastMessageSnippet,
      lastMessageAt:
          lastMessageAt is DateTime? ? lastMessageAt : this.lastMessageAt,
      user1UnreadCount: user1UnreadCount ?? this.user1UnreadCount,
      user2UnreadCount: user2UnreadCount ?? this.user2UnreadCount,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}

class ConversationUpdateTable extends _is.UpdateTable<ConversationTable> {
  ConversationUpdateTable(super.table);

  _is.ColumnValue<int, int> user1Id(int value) => _is.ColumnValue(
        table.user1Id,
        value,
      );

  _is.ColumnValue<int, int> user2Id(int value) => _is.ColumnValue(
        table.user2Id,
        value,
      );

  _is.ColumnValue<String, String> lastMessageSnippet(String? value) =>
      _is.ColumnValue(
        table.lastMessageSnippet,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lastMessageAt(DateTime? value) =>
      _is.ColumnValue(
        table.lastMessageAt,
        value,
      );

  _is.ColumnValue<int, int> user1UnreadCount(int value) => _is.ColumnValue(
        table.user1UnreadCount,
        value,
      );

  _is.ColumnValue<int, int> user2UnreadCount(int value) => _is.ColumnValue(
        table.user2UnreadCount,
        value,
      );

  _is.ColumnValue<bool, bool> isAccepted(bool value) => _is.ColumnValue(
        table.isAccepted,
        value,
      );
}

class ConversationTable extends _is.Table<int?> {
  ConversationTable({super.tableRelation}) : super(tableName: 'conversation') {
    updateTable = ConversationUpdateTable(this);
    user1Id = _is.ColumnInt(
      'user1Id',
      this,
    );
    user2Id = _is.ColumnInt(
      'user2Id',
      this,
    );
    lastMessageSnippet = _is.ColumnString(
      'lastMessageSnippet',
      this,
    );
    lastMessageAt = _is.ColumnDateTime(
      'lastMessageAt',
      this,
    );
    user1UnreadCount = _is.ColumnInt(
      'user1UnreadCount',
      this,
    );
    user2UnreadCount = _is.ColumnInt(
      'user2UnreadCount',
      this,
    );
    isAccepted = _is.ColumnBool(
      'isAccepted',
      this,
    );
  }

  late final ConversationUpdateTable updateTable;

  late final _is.ColumnInt user1Id;

  late final _is.ColumnInt user2Id;

  late final _is.ColumnString lastMessageSnippet;

  late final _is.ColumnDateTime lastMessageAt;

  late final _is.ColumnInt user1UnreadCount;

  late final _is.ColumnInt user2UnreadCount;

  late final _is.ColumnBool isAccepted;

  @override
  List<_is.Column> get columns => [
        id,
        user1Id,
        user2Id,
        lastMessageSnippet,
        lastMessageAt,
        user1UnreadCount,
        user2UnreadCount,
        isAccepted,
      ];
}

class ConversationInclude extends _is.IncludeObject {
  ConversationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Conversation.t;
}

class ConversationIncludeList extends _is.IncludeList {
  ConversationIncludeList._({
    _is.WhereExpressionBuilder<ConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Conversation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Conversation.t;
}

class ConversationRepository {
  const ConversationRepository._();

  /// Returns a list of [Conversation]s matching the given query parameters.
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
  Future<List<Conversation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Conversation>(
      where: where?.call(Conversation.t),
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Conversation] matching the given query parameters.
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
  Future<Conversation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConversationTable>? where,
    int? offset,
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Conversation>(
      where: where?.call(Conversation.t),
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Conversation] by its [id] or null if no such row exists.
  Future<Conversation?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Conversation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Conversation]s in the list and returns the inserted rows.
  ///
  /// The returned [Conversation]s will have their `id` fields set.
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
  Future<List<Conversation>> insert(
    _is.DatabaseSession session,
    List<Conversation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Conversation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Conversation] and returns the inserted row.
  ///
  /// The returned [Conversation] will have its `id` field set.
  Future<Conversation> insertRow(
    _is.DatabaseSession session,
    Conversation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Conversation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Conversation]s in the list and returns the resulting rows.
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
  /// The returned [Conversation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Conversation>> upsert(
    _is.DatabaseSession session,
    List<Conversation> rows, {
    required _is.ColumnSelections<ConversationTable> conflictColumns,
    _is.ColumnSelections<ConversationTable>? updateColumns,
    _is.WhereExpressionBuilder<ConversationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Conversation>(
      rows,
      conflictColumns: conflictColumns(Conversation.t),
      updateColumns: updateColumns?.call(Conversation.t),
      updateWhere: updateWhere?.call(Conversation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Conversation] and returns the resulting row.
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
  /// The returned [Conversation] will have its `id` field set.
  Future<Conversation?> upsertRow(
    _is.DatabaseSession session,
    Conversation row, {
    required _is.ColumnSelections<ConversationTable> conflictColumns,
    _is.ColumnSelections<ConversationTable>? updateColumns,
    _is.WhereExpressionBuilder<ConversationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Conversation>(
      row,
      conflictColumns: conflictColumns(Conversation.t),
      updateColumns: updateColumns?.call(Conversation.t),
      updateWhere: updateWhere?.call(Conversation.t),
      transaction: transaction,
    );
  }

  /// Updates all [Conversation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Conversation>> update(
    _is.DatabaseSession session,
    List<Conversation> rows, {
    _is.ColumnSelections<ConversationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Conversation>(
      rows,
      columns: columns?.call(Conversation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Conversation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Conversation> updateRow(
    _is.DatabaseSession session,
    Conversation row, {
    _is.ColumnSelections<ConversationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Conversation>(
      row,
      columns: columns?.call(Conversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Conversation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Conversation?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ConversationUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Conversation>(
      id,
      columnValues: columnValues(Conversation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Conversation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Conversation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ConversationUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ConversationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Conversation>(
      columnValues: columnValues(Conversation.t.updateTable),
      where: where(Conversation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Conversation]s in the list and returns the deleted rows.
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
  Future<List<Conversation>> delete(
    _is.DatabaseSession session,
    List<Conversation> rows, {
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Conversation>(
      rows,
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Conversation].
  Future<Conversation> deleteRow(
    _is.DatabaseSession session,
    Conversation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Conversation>(
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
  Future<List<Conversation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConversationTable> where,
    _is.OrderByBuilder<ConversationTable>? orderBy,
    _is.OrderByListBuilder<ConversationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Conversation>(
      where: where(Conversation.t),
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Conversation>(
      where: where?.call(Conversation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Conversation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConversationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Conversation>(
      where: where(Conversation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
