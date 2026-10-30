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

abstract class PlayerRating
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  PlayerRating._({
    this.id,
    required this.userId,
    required this.userName,
    required this.collegeId,
    required this.branchId,
    required this.year,
    required this.rating,
    required this.matchesPlayed,
    required this.matchesWon,
    required this.weeklyScore,
    required this.lastUpdated,
  });

  factory PlayerRating({
    int? id,
    required int userId,
    required String userName,
    required int collegeId,
    required int branchId,
    required int year,
    required int rating,
    required int matchesPlayed,
    required int matchesWon,
    required int weeklyScore,
    required DateTime lastUpdated,
  }) = _PlayerRatingImpl;

  factory PlayerRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerRating(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      userName: jsonSerialization['userName'] as String,
      collegeId: jsonSerialization['collegeId'] as int,
      branchId: jsonSerialization['branchId'] as int,
      year: jsonSerialization['year'] as int,
      rating: jsonSerialization['rating'] as int,
      matchesPlayed: jsonSerialization['matchesPlayed'] as int,
      matchesWon: jsonSerialization['matchesWon'] as int,
      weeklyScore: jsonSerialization['weeklyScore'] as int,
      lastUpdated:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['lastUpdated']),
    );
  }

  static final t = PlayerRatingTable();

  static const db = PlayerRatingRepository._();

  @override
  int? id;

  int userId;

  String userName;

  int collegeId;

  int branchId;

  int year;

  int rating;

  int matchesPlayed;

  int matchesWon;

  int weeklyScore;

  DateTime lastUpdated;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerRating]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  PlayerRating copyWith({
    int? id,
    int? userId,
    String? userName,
    int? collegeId,
    int? branchId,
    int? year,
    int? rating,
    int? matchesPlayed,
    int? matchesWon,
    int? weeklyScore,
    DateTime? lastUpdated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerRating',
      if (id != null) 'id': id,
      'userId': userId,
      'userName': userName,
      'collegeId': collegeId,
      'branchId': branchId,
      'year': year,
      'rating': rating,
      'matchesPlayed': matchesPlayed,
      'matchesWon': matchesWon,
      'weeklyScore': weeklyScore,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerRating',
      if (id != null) 'id': id,
      'userId': userId,
      'userName': userName,
      'collegeId': collegeId,
      'branchId': branchId,
      'year': year,
      'rating': rating,
      'matchesPlayed': matchesPlayed,
      'matchesWon': matchesWon,
      'weeklyScore': weeklyScore,
      'lastUpdated': lastUpdated.toJson(),
    };
  }

  static PlayerRatingInclude include() {
    return PlayerRatingInclude._();
  }

  static PlayerRatingIncludeList includeList({
    _is.WhereExpressionBuilder<PlayerRatingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    PlayerRatingInclude? include,
  }) {
    return PlayerRatingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerRatingImpl extends PlayerRating {
  _PlayerRatingImpl({
    int? id,
    required int userId,
    required String userName,
    required int collegeId,
    required int branchId,
    required int year,
    required int rating,
    required int matchesPlayed,
    required int matchesWon,
    required int weeklyScore,
    required DateTime lastUpdated,
  }) : super._(
          id: id,
          userId: userId,
          userName: userName,
          collegeId: collegeId,
          branchId: branchId,
          year: year,
          rating: rating,
          matchesPlayed: matchesPlayed,
          matchesWon: matchesWon,
          weeklyScore: weeklyScore,
          lastUpdated: lastUpdated,
        );

  /// Returns a shallow copy of this [PlayerRating]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  PlayerRating copyWith({
    Object? id = _Undefined,
    int? userId,
    String? userName,
    int? collegeId,
    int? branchId,
    int? year,
    int? rating,
    int? matchesPlayed,
    int? matchesWon,
    int? weeklyScore,
    DateTime? lastUpdated,
  }) {
    return PlayerRating(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      collegeId: collegeId ?? this.collegeId,
      branchId: branchId ?? this.branchId,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      matchesPlayed: matchesPlayed ?? this.matchesPlayed,
      matchesWon: matchesWon ?? this.matchesWon,
      weeklyScore: weeklyScore ?? this.weeklyScore,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class PlayerRatingUpdateTable extends _is.UpdateTable<PlayerRatingTable> {
  PlayerRatingUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> userName(String value) => _is.ColumnValue(
        table.userName,
        value,
      );

  _is.ColumnValue<int, int> collegeId(int value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<int, int> branchId(int value) => _is.ColumnValue(
        table.branchId,
        value,
      );

  _is.ColumnValue<int, int> year(int value) => _is.ColumnValue(
        table.year,
        value,
      );

  _is.ColumnValue<int, int> rating(int value) => _is.ColumnValue(
        table.rating,
        value,
      );

  _is.ColumnValue<int, int> matchesPlayed(int value) => _is.ColumnValue(
        table.matchesPlayed,
        value,
      );

  _is.ColumnValue<int, int> matchesWon(int value) => _is.ColumnValue(
        table.matchesWon,
        value,
      );

  _is.ColumnValue<int, int> weeklyScore(int value) => _is.ColumnValue(
        table.weeklyScore,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lastUpdated(DateTime value) =>
      _is.ColumnValue(
        table.lastUpdated,
        value,
      );
}

class PlayerRatingTable extends _is.Table<int?> {
  PlayerRatingTable({super.tableRelation}) : super(tableName: 'player_rating') {
    updateTable = PlayerRatingUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    userName = _is.ColumnString(
      'userName',
      this,
    );
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    branchId = _is.ColumnInt(
      'branchId',
      this,
    );
    year = _is.ColumnInt(
      'year',
      this,
    );
    rating = _is.ColumnInt(
      'rating',
      this,
    );
    matchesPlayed = _is.ColumnInt(
      'matchesPlayed',
      this,
    );
    matchesWon = _is.ColumnInt(
      'matchesWon',
      this,
    );
    weeklyScore = _is.ColumnInt(
      'weeklyScore',
      this,
    );
    lastUpdated = _is.ColumnDateTime(
      'lastUpdated',
      this,
    );
  }

  late final PlayerRatingUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userName;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnInt branchId;

  late final _is.ColumnInt year;

  late final _is.ColumnInt rating;

  late final _is.ColumnInt matchesPlayed;

  late final _is.ColumnInt matchesWon;

  late final _is.ColumnInt weeklyScore;

  late final _is.ColumnDateTime lastUpdated;

  @override
  List<_is.Column> get columns => [
        id,
        userId,
        userName,
        collegeId,
        branchId,
        year,
        rating,
        matchesPlayed,
        matchesWon,
        weeklyScore,
        lastUpdated,
      ];
}

class PlayerRatingInclude extends _is.IncludeObject {
  PlayerRatingInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => PlayerRating.t;
}

class PlayerRatingIncludeList extends _is.IncludeList {
  PlayerRatingIncludeList._({
    _is.WhereExpressionBuilder<PlayerRatingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayerRating.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => PlayerRating.t;
}

class PlayerRatingRepository {
  const PlayerRatingRepository._();

  /// Returns a list of [PlayerRating]s matching the given query parameters.
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
  Future<List<PlayerRating>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerRatingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PlayerRating>(
      where: where?.call(PlayerRating.t),
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PlayerRating] matching the given query parameters.
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
  Future<PlayerRating?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerRatingTable>? where,
    int? offset,
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PlayerRating>(
      where: where?.call(PlayerRating.t),
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PlayerRating] by its [id] or null if no such row exists.
  Future<PlayerRating?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PlayerRating>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PlayerRating]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerRating]s will have their `id` fields set.
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
  Future<List<PlayerRating>> insert(
    _is.DatabaseSession session,
    List<PlayerRating> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<PlayerRating>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [PlayerRating] and returns the inserted row.
  ///
  /// The returned [PlayerRating] will have its `id` field set.
  Future<PlayerRating> insertRow(
    _is.DatabaseSession session,
    PlayerRating row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayerRating>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [PlayerRating]s in the list and returns the resulting rows.
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
  /// The returned [PlayerRating]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PlayerRating>> upsert(
    _is.DatabaseSession session,
    List<PlayerRating> rows, {
    required _is.ColumnSelections<PlayerRatingTable> conflictColumns,
    _is.ColumnSelections<PlayerRatingTable>? updateColumns,
    _is.WhereExpressionBuilder<PlayerRatingTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<PlayerRating>(
      rows,
      conflictColumns: conflictColumns(PlayerRating.t),
      updateColumns: updateColumns?.call(PlayerRating.t),
      updateWhere: updateWhere?.call(PlayerRating.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [PlayerRating] and returns the resulting row.
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
  /// The returned [PlayerRating] will have its `id` field set.
  Future<PlayerRating?> upsertRow(
    _is.DatabaseSession session,
    PlayerRating row, {
    required _is.ColumnSelections<PlayerRatingTable> conflictColumns,
    _is.ColumnSelections<PlayerRatingTable>? updateColumns,
    _is.WhereExpressionBuilder<PlayerRatingTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<PlayerRating>(
      row,
      conflictColumns: conflictColumns(PlayerRating.t),
      updateColumns: updateColumns?.call(PlayerRating.t),
      updateWhere: updateWhere?.call(PlayerRating.t),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerRating]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PlayerRating>> update(
    _is.DatabaseSession session,
    List<PlayerRating> rows, {
    _is.ColumnSelections<PlayerRatingTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<PlayerRating>(
      rows,
      columns: columns?.call(PlayerRating.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [PlayerRating]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayerRating> updateRow(
    _is.DatabaseSession session,
    PlayerRating row, {
    _is.ColumnSelections<PlayerRatingTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayerRating>(
      row,
      columns: columns?.call(PlayerRating.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerRating] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayerRating?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PlayerRatingUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayerRating>(
      id,
      columnValues: columnValues(PlayerRating.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerRating]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PlayerRating>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PlayerRatingUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<PlayerRatingTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<PlayerRating>(
      columnValues: columnValues(PlayerRating.t.updateTable),
      where: where(PlayerRating.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [PlayerRating]s in the list and returns the deleted rows.
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
  Future<List<PlayerRating>> delete(
    _is.DatabaseSession session,
    List<PlayerRating> rows, {
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<PlayerRating>(
      rows,
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [PlayerRating].
  Future<PlayerRating> deleteRow(
    _is.DatabaseSession session,
    PlayerRating row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayerRating>(
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
  Future<List<PlayerRating>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PlayerRatingTable> where,
    _is.OrderByBuilder<PlayerRatingTable>? orderBy,
    _is.OrderByListBuilder<PlayerRatingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<PlayerRating>(
      where: where(PlayerRating.t),
      orderBy: orderBy?.call(PlayerRating.t),
      orderByList: orderByList?.call(PlayerRating.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerRatingTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<PlayerRating>(
      where: where?.call(PlayerRating.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PlayerRating] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PlayerRatingTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PlayerRating>(
      where: where(PlayerRating.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
