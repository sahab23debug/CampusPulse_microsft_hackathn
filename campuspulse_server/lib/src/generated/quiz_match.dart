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

abstract class QuizMatch
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  QuizMatch._({
    this.id,
    required this.mode,
    this.roomCode,
    required this.subject,
    required this.difficulty,
    required this.status,
    required this.questionIdsJson,
    required this.currentQuestionIndex,
    this.startedAt,
    this.endedAt,
    required this.createdAt,
  });

  factory QuizMatch({
    int? id,
    required String mode,
    String? roomCode,
    required String subject,
    required String difficulty,
    required String status,
    required String questionIdsJson,
    required int currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
  }) = _QuizMatchImpl;

  factory QuizMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizMatch(
      id: jsonSerialization['id'] as int?,
      mode: jsonSerialization['mode'] as String,
      roomCode: jsonSerialization['roomCode'] as String?,
      subject: jsonSerialization['subject'] as String,
      difficulty: jsonSerialization['difficulty'] as String,
      status: jsonSerialization['status'] as String,
      questionIdsJson: jsonSerialization['questionIdsJson'] as String,
      currentQuestionIndex: jsonSerialization['currentQuestionIndex'] as int,
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      endedAt: jsonSerialization['endedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['endedAt']),
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = QuizMatchTable();

  static const db = QuizMatchRepository._();

  @override
  int? id;

  String mode;

  String? roomCode;

  String subject;

  String difficulty;

  String status;

  String questionIdsJson;

  int currentQuestionIndex;

  DateTime? startedAt;

  DateTime? endedAt;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [QuizMatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  QuizMatch copyWith({
    int? id,
    String? mode,
    String? roomCode,
    String? subject,
    String? difficulty,
    String? status,
    String? questionIdsJson,
    int? currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizMatch',
      if (id != null) 'id': id,
      'mode': mode,
      if (roomCode != null) 'roomCode': roomCode,
      'subject': subject,
      'difficulty': difficulty,
      'status': status,
      'questionIdsJson': questionIdsJson,
      'currentQuestionIndex': currentQuestionIndex,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endedAt != null) 'endedAt': endedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizMatch',
      if (id != null) 'id': id,
      'mode': mode,
      if (roomCode != null) 'roomCode': roomCode,
      'subject': subject,
      'difficulty': difficulty,
      'status': status,
      'questionIdsJson': questionIdsJson,
      'currentQuestionIndex': currentQuestionIndex,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endedAt != null) 'endedAt': endedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static QuizMatchInclude include() {
    return QuizMatchInclude._();
  }

  static QuizMatchIncludeList includeList({
    _is.WhereExpressionBuilder<QuizMatchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    QuizMatchInclude? include,
  }) {
    return QuizMatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizMatchImpl extends QuizMatch {
  _QuizMatchImpl({
    int? id,
    required String mode,
    String? roomCode,
    required String subject,
    required String difficulty,
    required String status,
    required String questionIdsJson,
    required int currentQuestionIndex,
    DateTime? startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
  }) : super._(
          id: id,
          mode: mode,
          roomCode: roomCode,
          subject: subject,
          difficulty: difficulty,
          status: status,
          questionIdsJson: questionIdsJson,
          currentQuestionIndex: currentQuestionIndex,
          startedAt: startedAt,
          endedAt: endedAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [QuizMatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  QuizMatch copyWith({
    Object? id = _Undefined,
    String? mode,
    Object? roomCode = _Undefined,
    String? subject,
    String? difficulty,
    String? status,
    String? questionIdsJson,
    int? currentQuestionIndex,
    Object? startedAt = _Undefined,
    Object? endedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return QuizMatch(
      id: id is int? ? id : this.id,
      mode: mode ?? this.mode,
      roomCode: roomCode is String? ? roomCode : this.roomCode,
      subject: subject ?? this.subject,
      difficulty: difficulty ?? this.difficulty,
      status: status ?? this.status,
      questionIdsJson: questionIdsJson ?? this.questionIdsJson,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      endedAt: endedAt is DateTime? ? endedAt : this.endedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class QuizMatchUpdateTable extends _is.UpdateTable<QuizMatchTable> {
  QuizMatchUpdateTable(super.table);

  _is.ColumnValue<String, String> mode(String value) => _is.ColumnValue(
        table.mode,
        value,
      );

  _is.ColumnValue<String, String> roomCode(String? value) => _is.ColumnValue(
        table.roomCode,
        value,
      );

  _is.ColumnValue<String, String> subject(String value) => _is.ColumnValue(
        table.subject,
        value,
      );

  _is.ColumnValue<String, String> difficulty(String value) => _is.ColumnValue(
        table.difficulty,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
        table.status,
        value,
      );

  _is.ColumnValue<String, String> questionIdsJson(String value) =>
      _is.ColumnValue(
        table.questionIdsJson,
        value,
      );

  _is.ColumnValue<int, int> currentQuestionIndex(int value) => _is.ColumnValue(
        table.currentQuestionIndex,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> startedAt(DateTime? value) =>
      _is.ColumnValue(
        table.startedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endedAt(DateTime? value) =>
      _is.ColumnValue(
        table.endedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class QuizMatchTable extends _is.Table<int?> {
  QuizMatchTable({super.tableRelation}) : super(tableName: 'quiz_match') {
    updateTable = QuizMatchUpdateTable(this);
    mode = _is.ColumnString(
      'mode',
      this,
    );
    roomCode = _is.ColumnString(
      'roomCode',
      this,
    );
    subject = _is.ColumnString(
      'subject',
      this,
    );
    difficulty = _is.ColumnString(
      'difficulty',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    questionIdsJson = _is.ColumnString(
      'questionIdsJson',
      this,
    );
    currentQuestionIndex = _is.ColumnInt(
      'currentQuestionIndex',
      this,
    );
    startedAt = _is.ColumnDateTime(
      'startedAt',
      this,
    );
    endedAt = _is.ColumnDateTime(
      'endedAt',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final QuizMatchUpdateTable updateTable;

  late final _is.ColumnString mode;

  late final _is.ColumnString roomCode;

  late final _is.ColumnString subject;

  late final _is.ColumnString difficulty;

  late final _is.ColumnString status;

  late final _is.ColumnString questionIdsJson;

  late final _is.ColumnInt currentQuestionIndex;

  late final _is.ColumnDateTime startedAt;

  late final _is.ColumnDateTime endedAt;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        mode,
        roomCode,
        subject,
        difficulty,
        status,
        questionIdsJson,
        currentQuestionIndex,
        startedAt,
        endedAt,
        createdAt,
      ];
}

class QuizMatchInclude extends _is.IncludeObject {
  QuizMatchInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => QuizMatch.t;
}

class QuizMatchIncludeList extends _is.IncludeList {
  QuizMatchIncludeList._({
    _is.WhereExpressionBuilder<QuizMatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizMatch.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => QuizMatch.t;
}

class QuizMatchRepository {
  const QuizMatchRepository._();

  /// Returns a list of [QuizMatch]s matching the given query parameters.
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
  Future<List<QuizMatch>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<QuizMatch>(
      where: where?.call(QuizMatch.t),
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [QuizMatch] matching the given query parameters.
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
  Future<QuizMatch?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchTable>? where,
    int? offset,
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<QuizMatch>(
      where: where?.call(QuizMatch.t),
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [QuizMatch] by its [id] or null if no such row exists.
  Future<QuizMatch?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<QuizMatch>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [QuizMatch]s in the list and returns the inserted rows.
  ///
  /// The returned [QuizMatch]s will have their `id` fields set.
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
  Future<List<QuizMatch>> insert(
    _is.DatabaseSession session,
    List<QuizMatch> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<QuizMatch>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [QuizMatch] and returns the inserted row.
  ///
  /// The returned [QuizMatch] will have its `id` field set.
  Future<QuizMatch> insertRow(
    _is.DatabaseSession session,
    QuizMatch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [QuizMatch]s in the list and returns the resulting rows.
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
  /// The returned [QuizMatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatch>> upsert(
    _is.DatabaseSession session,
    List<QuizMatch> rows, {
    required _is.ColumnSelections<QuizMatchTable> conflictColumns,
    _is.ColumnSelections<QuizMatchTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizMatchTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<QuizMatch>(
      rows,
      conflictColumns: conflictColumns(QuizMatch.t),
      updateColumns: updateColumns?.call(QuizMatch.t),
      updateWhere: updateWhere?.call(QuizMatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [QuizMatch] and returns the resulting row.
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
  /// The returned [QuizMatch] will have its `id` field set.
  Future<QuizMatch?> upsertRow(
    _is.DatabaseSession session,
    QuizMatch row, {
    required _is.ColumnSelections<QuizMatchTable> conflictColumns,
    _is.ColumnSelections<QuizMatchTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizMatchTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<QuizMatch>(
      row,
      conflictColumns: conflictColumns(QuizMatch.t),
      updateColumns: updateColumns?.call(QuizMatch.t),
      updateWhere: updateWhere?.call(QuizMatch.t),
      transaction: transaction,
    );
  }

  /// Updates all [QuizMatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatch>> update(
    _is.DatabaseSession session,
    List<QuizMatch> rows, {
    _is.ColumnSelections<QuizMatchTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<QuizMatch>(
      rows,
      columns: columns?.call(QuizMatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [QuizMatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<QuizMatch> updateRow(
    _is.DatabaseSession session,
    QuizMatch row, {
    _is.ColumnSelections<QuizMatchTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizMatch>(
      row,
      columns: columns?.call(QuizMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizMatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<QuizMatch?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<QuizMatchUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<QuizMatch>(
      id,
      columnValues: columnValues(QuizMatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [QuizMatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<QuizMatch>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<QuizMatchUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<QuizMatchTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<QuizMatch>(
      columnValues: columnValues(QuizMatch.t.updateTable),
      where: where(QuizMatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [QuizMatch]s in the list and returns the deleted rows.
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
  Future<List<QuizMatch>> delete(
    _is.DatabaseSession session,
    List<QuizMatch> rows, {
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<QuizMatch>(
      rows,
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [QuizMatch].
  Future<QuizMatch> deleteRow(
    _is.DatabaseSession session,
    QuizMatch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizMatch>(
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
  Future<List<QuizMatch>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizMatchTable> where,
    _is.OrderByBuilder<QuizMatchTable>? orderBy,
    _is.OrderByListBuilder<QuizMatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<QuizMatch>(
      where: where(QuizMatch.t),
      orderBy: orderBy?.call(QuizMatch.t),
      orderByList: orderByList?.call(QuizMatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizMatchTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<QuizMatch>(
      where: where?.call(QuizMatch.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [QuizMatch] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizMatchTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<QuizMatch>(
      where: where(QuizMatch.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
