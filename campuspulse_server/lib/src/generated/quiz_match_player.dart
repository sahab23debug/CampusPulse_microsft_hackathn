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

abstract class QuizMatchPlayer
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  QuizMatchPlayer._({
    this.id,
    required this.matchId,
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.score,
    required this.correctAnswersCount,
    required this.ratingBefore,
    this.ratingAfter,
    required this.isFinished,
  });

  factory QuizMatchPlayer({
    int? id,
    required int matchId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required int score,
    required int correctAnswersCount,
    required int ratingBefore,
    int? ratingAfter,
    required bool isFinished,
  }) = _QuizMatchPlayerImpl;

  factory QuizMatchPlayer.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizMatchPlayer(
      id: jsonSerialization['id'] as int?,
      matchId: jsonSerialization['matchId'] as int,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      userAvatarUrl: jsonSerialization['userAvatarUrl'] as String?,
      score: jsonSerialization['score'] as int,
      correctAnswersCount: jsonSerialization['correctAnswersCount'] as int,
      ratingBefore: jsonSerialization['ratingBefore'] as int,
      ratingAfter: jsonSerialization['ratingAfter'] as int?,
      isFinished:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isFinished']),
    );
  }

  static final t = QuizMatchPlayerTable();

  static const db = QuizMatchPlayerRepository._();

  @override
  int? id;

  int matchId;

  int userId;

  String userName;

  String? userAvatarUrl;

  int score;

  int correctAnswersCount;

  int ratingBefore;

  int? ratingAfter;

  bool isFinished;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [QuizMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  QuizMatchPlayer copyWith({
    int? id,
    int? matchId,
    int? userId,
    String? userName,
    String? userAvatarUrl,
    int? score,
    int? correctAnswersCount,
    int? ratingBefore,
    int? ratingAfter,
    bool? isFinished,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizMatchPlayer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'score': score,
      'correctAnswersCount': correctAnswersCount,
      'ratingBefore': ratingBefore,
      if (ratingAfter != null) 'ratingAfter': ratingAfter,
      'isFinished': isFinished,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizMatchPlayer',
      if (id != null) 'id': id,
      'matchId': matchId,
      'userId': userId,
      'userName': userName,
      if (userAvatarUrl != null) 'userAvatarUrl': userAvatarUrl,
      'score': score,
      'correctAnswersCount': correctAnswersCount,
      'ratingBefore': ratingBefore,
      if (ratingAfter != null) 'ratingAfter': ratingAfter,
      'isFinished': isFinished,
    };
  }

  static QuizMatchPlayerInclude include() {
    return QuizMatchPlayerInclude._();
  }

  static QuizMatchPlayerIncludeList includeList({
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    QuizMatchPlayerInclude? include,
  }) {
    return QuizMatchPlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizMatchPlayerImpl extends QuizMatchPlayer {
  _QuizMatchPlayerImpl({
    int? id,
    required int matchId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required int score,
    required int correctAnswersCount,
    required int ratingBefore,
    int? ratingAfter,
    required bool isFinished,
  }) : super._(
          id: id,
          matchId: matchId,
          userId: userId,
          userName: userName,
          userAvatarUrl: userAvatarUrl,
          score: score,
          correctAnswersCount: correctAnswersCount,
          ratingBefore: ratingBefore,
          ratingAfter: ratingAfter,
          isFinished: isFinished,
        );

  /// Returns a shallow copy of this [QuizMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  QuizMatchPlayer copyWith({
    Object? id = _Undefined,
    int? matchId,
    int? userId,
    String? userName,
    Object? userAvatarUrl = _Undefined,
    int? score,
    int? correctAnswersCount,
    int? ratingBefore,
    Object? ratingAfter = _Undefined,
    bool? isFinished,
  }) {
    return QuizMatchPlayer(
      id: id is int? ? id : this.id,
      matchId: matchId ?? this.matchId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatarUrl:
          userAvatarUrl is String? ? userAvatarUrl : this.userAvatarUrl,
      score: score ?? this.score,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      ratingBefore: ratingBefore ?? this.ratingBefore,
      ratingAfter: ratingAfter is int? ? ratingAfter : this.ratingAfter,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}

class QuizMatchPlayerUpdateTable extends _is.UpdateTable<QuizMatchPlayerTable> {
  QuizMatchPlayerUpdateTable(super.table);

  _is.ColumnValue<int, int> matchId(int value) => _is.ColumnValue(
        table.matchId,
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

  _is.ColumnValue<int, int> score(int value) => _is.ColumnValue(
        table.score,
        value,
      );

  _is.ColumnValue<int, int> correctAnswersCount(int value) => _is.ColumnValue(
        table.correctAnswersCount,
        value,
      );

  _is.ColumnValue<int, int> ratingBefore(int value) => _is.ColumnValue(
        table.ratingBefore,
        value,
      );

  _is.ColumnValue<int, int> ratingAfter(int? value) => _is.ColumnValue(
        table.ratingAfter,
        value,
      );

  _is.ColumnValue<bool, bool> isFinished(bool value) => _is.ColumnValue(
        table.isFinished,
        value,
      );
}

class QuizMatchPlayerTable extends _is.Table<int?> {
  QuizMatchPlayerTable({super.tableRelation})
      : super(tableName: 'quiz_match_player') {
    updateTable = QuizMatchPlayerUpdateTable(this);
    matchId = _is.ColumnInt(
      'matchId',
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
    score = _is.ColumnInt(
      'score',
      this,
    );
    correctAnswersCount = _is.ColumnInt(
      'correctAnswersCount',
      this,
    );
    ratingBefore = _is.ColumnInt(
      'ratingBefore',
      this,
    );
    ratingAfter = _is.ColumnInt(
      'ratingAfter',
      this,
    );
    isFinished = _is.ColumnBool(
      'isFinished',
      this,
    );
  }

  late final QuizMatchPlayerUpdateTable updateTable;

  late final _is.ColumnInt matchId;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userName;

  late final _is.ColumnString userAvatarUrl;

  late final _is.ColumnInt score;

  late final _is.ColumnInt correctAnswersCount;

  late final _is.ColumnInt ratingBefore;

  late final _is.ColumnInt ratingAfter;

  late final _is.ColumnBool isFinished;

  @override
  List<_is.Column> get columns => [
        id,
        matchId,
        userId,
        userName,
        userAvatarUrl,
        score,
        correctAnswersCount,
        ratingBefore,
        ratingAfter,
        isFinished,
      ];
}

class QuizMatchPlayerInclude extends _is.IncludeObject {
  QuizMatchPlayerInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => QuizMatchPlayer.t;
}

class QuizMatchPlayerIncludeList extends _is.IncludeList {
  QuizMatchPlayerIncludeList._({
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizMatchPlayer.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => QuizMatchPlayer.t;
}

class QuizMatchPlayerRepository {
  const QuizMatchPlayerRepository._();

  /// Returns a list of [QuizMatchPlayer]s matching the given query parameters.
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
  Future<List<QuizMatchPlayer>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<QuizMatchPlayer>(
      where: where?.call(QuizMatchPlayer.t),
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [QuizMatchPlayer] matching the given query parameters.
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
  Future<QuizMatchPlayer?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? where,
    int? offset,
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<QuizMatchPlayer>(
      where: where?.call(QuizMatchPlayer.t),
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [QuizMatchPlayer] by its [id] or null if no such row exists.
  Future<QuizMatchPlayer?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<QuizMatchPlayer>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [QuizMatchPlayer]s in the list and returns the inserted rows.
  ///
  /// The returned [QuizMatchPlayer]s will have their `id` fields set.
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
  Future<List<QuizMatchPlayer>> insert(
    _is.DatabaseSession session,
    List<QuizMatchPlayer> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<QuizMatchPlayer>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [QuizMatchPlayer] and returns the inserted row.
  ///
  /// The returned [QuizMatchPlayer] will have its `id` field set.
  Future<QuizMatchPlayer> insertRow(
    _is.DatabaseSession session,
    QuizMatchPlayer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizMatchPlayer>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [QuizMatchPlayer]s in the list and returns the resulting rows.
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
  /// The returned [QuizMatchPlayer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatchPlayer>> upsert(
    _is.DatabaseSession session,
    List<QuizMatchPlayer> rows, {
    required _is.ColumnSelections<QuizMatchPlayerTable> conflictColumns,
    _is.ColumnSelections<QuizMatchPlayerTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<QuizMatchPlayer>(
      rows,
      conflictColumns: conflictColumns(QuizMatchPlayer.t),
      updateColumns: updateColumns?.call(QuizMatchPlayer.t),
      updateWhere: updateWhere?.call(QuizMatchPlayer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [QuizMatchPlayer] and returns the resulting row.
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
  /// The returned [QuizMatchPlayer] will have its `id` field set.
  Future<QuizMatchPlayer?> upsertRow(
    _is.DatabaseSession session,
    QuizMatchPlayer row, {
    required _is.ColumnSelections<QuizMatchPlayerTable> conflictColumns,
    _is.ColumnSelections<QuizMatchPlayerTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<QuizMatchPlayer>(
      row,
      conflictColumns: conflictColumns(QuizMatchPlayer.t),
      updateColumns: updateColumns?.call(QuizMatchPlayer.t),
      updateWhere: updateWhere?.call(QuizMatchPlayer.t),
      transaction: transaction,
    );
  }

  /// Updates all [QuizMatchPlayer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatchPlayer>> update(
    _is.DatabaseSession session,
    List<QuizMatchPlayer> rows, {
    _is.ColumnSelections<QuizMatchPlayerTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<QuizMatchPlayer>(
      rows,
      columns: columns?.call(QuizMatchPlayer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [QuizMatchPlayer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<QuizMatchPlayer> updateRow(
    _is.DatabaseSession session,
    QuizMatchPlayer row, {
    _is.ColumnSelections<QuizMatchPlayerTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizMatchPlayer>(
      row,
      columns: columns?.call(QuizMatchPlayer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizMatchPlayer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<QuizMatchPlayer?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<QuizMatchPlayerUpdateTable>
        columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<QuizMatchPlayer>(
      id,
      columnValues: columnValues(QuizMatchPlayer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [QuizMatchPlayer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatchPlayer>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<QuizMatchPlayerUpdateTable>
        columnValues,
    required _is.WhereExpressionBuilder<QuizMatchPlayerTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<QuizMatchPlayer>(
      columnValues: columnValues(QuizMatchPlayer.t.updateTable),
      where: where(QuizMatchPlayer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [QuizMatchPlayer]s in the list and returns the deleted rows.
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
  Future<List<QuizMatchPlayer>> delete(
    _is.DatabaseSession session,
    List<QuizMatchPlayer> rows, {
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<QuizMatchPlayer>(
      rows,
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [QuizMatchPlayer].
  Future<QuizMatchPlayer> deleteRow(
    _is.DatabaseSession session,
    QuizMatchPlayer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizMatchPlayer>(
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
  Future<List<QuizMatchPlayer>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizMatchPlayerTable> where,
    _is.OrderByBuilder<QuizMatchPlayerTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchPlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<QuizMatchPlayer>(
      where: where(QuizMatchPlayer.t),
      orderBy: orderBy?.call(QuizMatchPlayer.t),
      orderByList: orderByList?.call(QuizMatchPlayer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchPlayerTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<QuizMatchPlayer>(
      where: where?.call(QuizMatchPlayer.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [QuizMatchPlayer] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizMatchPlayerTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<QuizMatchPlayer>(
      where: where(QuizMatchPlayer.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
