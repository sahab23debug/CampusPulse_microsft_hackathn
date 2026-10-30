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

abstract class CommunityPost
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CommunityPost._({
    this.id,
    required this.communityId,
    required this.authorId,
    required this.authorName,
    this.authorAvatarUrl,
    required this.content,
    this.imageUrl,
    required this.isAnnouncement,
    required this.isPinned,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
  });

  factory CommunityPost({
    int? id,
    required int communityId,
    required int authorId,
    required String authorName,
    String? authorAvatarUrl,
    required String content,
    String? imageUrl,
    required bool isAnnouncement,
    required bool isPinned,
    required int likeCount,
    required int commentCount,
    required DateTime createdAt,
  }) = _CommunityPostImpl;

  factory CommunityPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityPost(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      authorId: jsonSerialization['authorId'] as int,
      authorName: jsonSerialization['authorName'] as String,
      authorAvatarUrl: jsonSerialization['authorAvatarUrl'] as String?,
      content: jsonSerialization['content'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      isAnnouncement:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isAnnouncement']),
      isPinned: _is.BoolJsonExtension.fromJson(jsonSerialization['isPinned']),
      likeCount: jsonSerialization['likeCount'] as int,
      commentCount: jsonSerialization['commentCount'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CommunityPostTable();

  static const db = CommunityPostRepository._();

  @override
  int? id;

  int communityId;

  int authorId;

  String authorName;

  String? authorAvatarUrl;

  String content;

  String? imageUrl;

  bool isAnnouncement;

  bool isPinned;

  int likeCount;

  int commentCount;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CommunityPost copyWith({
    int? id,
    int? communityId,
    int? authorId,
    String? authorName,
    String? authorAvatarUrl,
    String? content,
    String? imageUrl,
    bool? isAnnouncement,
    bool? isPinned,
    int? likeCount,
    int? commentCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorId': authorId,
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isAnnouncement': isAnnouncement,
      'isPinned': isPinned,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorId': authorId,
      'authorName': authorName,
      if (authorAvatarUrl != null) 'authorAvatarUrl': authorAvatarUrl,
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'isAnnouncement': isAnnouncement,
      'isPinned': isPinned,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'createdAt': createdAt.toJson(),
    };
  }

  static CommunityPostInclude include() {
    return CommunityPostInclude._();
  }

  static CommunityPostIncludeList includeList({
    _is.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    CommunityPostInclude? include,
  }) {
    return CommunityPostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityPostImpl extends CommunityPost {
  _CommunityPostImpl({
    int? id,
    required int communityId,
    required int authorId,
    required String authorName,
    String? authorAvatarUrl,
    required String content,
    String? imageUrl,
    required bool isAnnouncement,
    required bool isPinned,
    required int likeCount,
    required int commentCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          communityId: communityId,
          authorId: authorId,
          authorName: authorName,
          authorAvatarUrl: authorAvatarUrl,
          content: content,
          imageUrl: imageUrl,
          isAnnouncement: isAnnouncement,
          isPinned: isPinned,
          likeCount: likeCount,
          commentCount: commentCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CommunityPost copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? authorId,
    String? authorName,
    Object? authorAvatarUrl = _Undefined,
    String? content,
    Object? imageUrl = _Undefined,
    bool? isAnnouncement,
    bool? isPinned,
    int? likeCount,
    int? commentCount,
    DateTime? createdAt,
  }) {
    return CommunityPost(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorAvatarUrl:
          authorAvatarUrl is String? ? authorAvatarUrl : this.authorAvatarUrl,
      content: content ?? this.content,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      isAnnouncement: isAnnouncement ?? this.isAnnouncement,
      isPinned: isPinned ?? this.isPinned,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CommunityPostUpdateTable extends _is.UpdateTable<CommunityPostTable> {
  CommunityPostUpdateTable(super.table);

  _is.ColumnValue<int, int> communityId(int value) => _is.ColumnValue(
        table.communityId,
        value,
      );

  _is.ColumnValue<int, int> authorId(int value) => _is.ColumnValue(
        table.authorId,
        value,
      );

  _is.ColumnValue<String, String> authorName(String value) => _is.ColumnValue(
        table.authorName,
        value,
      );

  _is.ColumnValue<String, String> authorAvatarUrl(String? value) =>
      _is.ColumnValue(
        table.authorAvatarUrl,
        value,
      );

  _is.ColumnValue<String, String> content(String value) => _is.ColumnValue(
        table.content,
        value,
      );

  _is.ColumnValue<String, String> imageUrl(String? value) => _is.ColumnValue(
        table.imageUrl,
        value,
      );

  _is.ColumnValue<bool, bool> isAnnouncement(bool value) => _is.ColumnValue(
        table.isAnnouncement,
        value,
      );

  _is.ColumnValue<bool, bool> isPinned(bool value) => _is.ColumnValue(
        table.isPinned,
        value,
      );

  _is.ColumnValue<int, int> likeCount(int value) => _is.ColumnValue(
        table.likeCount,
        value,
      );

  _is.ColumnValue<int, int> commentCount(int value) => _is.ColumnValue(
        table.commentCount,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CommunityPostTable extends _is.Table<int?> {
  CommunityPostTable({super.tableRelation})
      : super(tableName: 'community_post') {
    updateTable = CommunityPostUpdateTable(this);
    communityId = _is.ColumnInt(
      'communityId',
      this,
    );
    authorId = _is.ColumnInt(
      'authorId',
      this,
    );
    authorName = _is.ColumnString(
      'authorName',
      this,
    );
    authorAvatarUrl = _is.ColumnString(
      'authorAvatarUrl',
      this,
    );
    content = _is.ColumnString(
      'content',
      this,
    );
    imageUrl = _is.ColumnString(
      'imageUrl',
      this,
    );
    isAnnouncement = _is.ColumnBool(
      'isAnnouncement',
      this,
    );
    isPinned = _is.ColumnBool(
      'isPinned',
      this,
    );
    likeCount = _is.ColumnInt(
      'likeCount',
      this,
    );
    commentCount = _is.ColumnInt(
      'commentCount',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CommunityPostUpdateTable updateTable;

  late final _is.ColumnInt communityId;

  late final _is.ColumnInt authorId;

  late final _is.ColumnString authorName;

  late final _is.ColumnString authorAvatarUrl;

  late final _is.ColumnString content;

  late final _is.ColumnString imageUrl;

  late final _is.ColumnBool isAnnouncement;

  late final _is.ColumnBool isPinned;

  late final _is.ColumnInt likeCount;

  late final _is.ColumnInt commentCount;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        communityId,
        authorId,
        authorName,
        authorAvatarUrl,
        content,
        imageUrl,
        isAnnouncement,
        isPinned,
        likeCount,
        commentCount,
        createdAt,
      ];
}

class CommunityPostInclude extends _is.IncludeObject {
  CommunityPostInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CommunityPost.t;
}

class CommunityPostIncludeList extends _is.IncludeList {
  CommunityPostIncludeList._({
    _is.WhereExpressionBuilder<CommunityPostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityPost.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CommunityPost.t;
}

class CommunityPostRepository {
  const CommunityPostRepository._();

  /// Returns a list of [CommunityPost]s matching the given query parameters.
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
  Future<List<CommunityPost>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityPost>(
      where: where?.call(CommunityPost.t),
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityPost] matching the given query parameters.
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
  Future<CommunityPost?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityPostTable>? where,
    int? offset,
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityPost>(
      where: where?.call(CommunityPost.t),
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityPost] by its [id] or null if no such row exists.
  Future<CommunityPost?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityPost>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityPost]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityPost]s will have their `id` fields set.
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
  Future<List<CommunityPost>> insert(
    _is.DatabaseSession session,
    List<CommunityPost> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CommunityPost>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CommunityPost] and returns the inserted row.
  ///
  /// The returned [CommunityPost] will have its `id` field set.
  Future<CommunityPost> insertRow(
    _is.DatabaseSession session,
    CommunityPost row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityPost>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CommunityPost]s in the list and returns the resulting rows.
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
  /// The returned [CommunityPost]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityPost>> upsert(
    _is.DatabaseSession session,
    List<CommunityPost> rows, {
    required _is.ColumnSelections<CommunityPostTable> conflictColumns,
    _is.ColumnSelections<CommunityPostTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityPostTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CommunityPost>(
      rows,
      conflictColumns: conflictColumns(CommunityPost.t),
      updateColumns: updateColumns?.call(CommunityPost.t),
      updateWhere: updateWhere?.call(CommunityPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CommunityPost] and returns the resulting row.
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
  /// The returned [CommunityPost] will have its `id` field set.
  Future<CommunityPost?> upsertRow(
    _is.DatabaseSession session,
    CommunityPost row, {
    required _is.ColumnSelections<CommunityPostTable> conflictColumns,
    _is.ColumnSelections<CommunityPostTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityPostTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CommunityPost>(
      row,
      conflictColumns: conflictColumns(CommunityPost.t),
      updateColumns: updateColumns?.call(CommunityPost.t),
      updateWhere: updateWhere?.call(CommunityPost.t),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityPost]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityPost>> update(
    _is.DatabaseSession session,
    List<CommunityPost> rows, {
    _is.ColumnSelections<CommunityPostTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CommunityPost>(
      rows,
      columns: columns?.call(CommunityPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CommunityPost]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityPost> updateRow(
    _is.DatabaseSession session,
    CommunityPost row, {
    _is.ColumnSelections<CommunityPostTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityPost>(
      row,
      columns: columns?.call(CommunityPost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityPost] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityPost?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommunityPostUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityPost>(
      id,
      columnValues: columnValues(CommunityPost.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityPost]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityPost>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommunityPostUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CommunityPostTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CommunityPost>(
      columnValues: columnValues(CommunityPost.t.updateTable),
      where: where(CommunityPost.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CommunityPost]s in the list and returns the deleted rows.
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
  Future<List<CommunityPost>> delete(
    _is.DatabaseSession session,
    List<CommunityPost> rows, {
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CommunityPost>(
      rows,
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CommunityPost].
  Future<CommunityPost> deleteRow(
    _is.DatabaseSession session,
    CommunityPost row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityPost>(
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
  Future<List<CommunityPost>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityPostTable> where,
    _is.OrderByBuilder<CommunityPostTable>? orderBy,
    _is.OrderByListBuilder<CommunityPostTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CommunityPost>(
      where: where(CommunityPost.t),
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CommunityPost>(
      where: where?.call(CommunityPost.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityPost] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityPostTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityPost>(
      where: where(CommunityPost.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
