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
import 'package:campuspulse_server/src/generated/protocol.dart' as _i3yc8a0r;
import 'package:serverpod/serverpod.dart' as _is;

abstract class CampusEvent
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CampusEvent._({
    this.id,
    required this.collegeId,
    required this.organizerClub,
    required this.creatorUserId,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.venue,
    required this.eventDate,
    required this.registrationDeadline,
    this.capacity,
    required this.registrationCount,
    this.registrationUrl,
    required this.isInternalRegistration,
    required this.tags,
    required this.isApproved,
    required this.createdAt,
  });

  factory CampusEvent({
    int? id,
    required int collegeId,
    required String organizerClub,
    required int creatorUserId,
    required String title,
    required String description,
    required String posterUrl,
    required String venue,
    required DateTime eventDate,
    required DateTime registrationDeadline,
    int? capacity,
    required int registrationCount,
    String? registrationUrl,
    required bool isInternalRegistration,
    required List<String> tags,
    required bool isApproved,
    required DateTime createdAt,
  }) = _CampusEventImpl;

  factory CampusEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CampusEvent(
      id: jsonSerialization['id'] as int?,
      collegeId: jsonSerialization['collegeId'] as int,
      organizerClub: jsonSerialization['organizerClub'] as String,
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      posterUrl: jsonSerialization['posterUrl'] as String,
      venue: jsonSerialization['venue'] as String,
      eventDate:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['eventDate']),
      registrationDeadline: _is.DateTimeJsonExtension.fromJson(
          jsonSerialization['registrationDeadline']),
      capacity: jsonSerialization['capacity'] as int?,
      registrationCount: jsonSerialization['registrationCount'] as int,
      registrationUrl: jsonSerialization['registrationUrl'] as String?,
      isInternalRegistration: _is.BoolJsonExtension.fromJson(
          jsonSerialization['isInternalRegistration']),
      tags: _i3yc8a0r.Protocol()
          .deserialize<List<String>>(jsonSerialization['tags']),
      isApproved:
          _is.BoolJsonExtension.fromJson(jsonSerialization['isApproved']),
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CampusEventTable();

  static const db = CampusEventRepository._();

  @override
  int? id;

  int collegeId;

  String organizerClub;

  int creatorUserId;

  String title;

  String description;

  String posterUrl;

  String venue;

  DateTime eventDate;

  DateTime registrationDeadline;

  int? capacity;

  int registrationCount;

  String? registrationUrl;

  bool isInternalRegistration;

  List<String> tags;

  bool isApproved;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CampusEvent copyWith({
    int? id,
    int? collegeId,
    String? organizerClub,
    int? creatorUserId,
    String? title,
    String? description,
    String? posterUrl,
    String? venue,
    DateTime? eventDate,
    DateTime? registrationDeadline,
    int? capacity,
    int? registrationCount,
    String? registrationUrl,
    bool? isInternalRegistration,
    List<String>? tags,
    bool? isApproved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'organizerClub': organizerClub,
      'creatorUserId': creatorUserId,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'venue': venue,
      'eventDate': eventDate.toJson(),
      'registrationDeadline': registrationDeadline.toJson(),
      if (capacity != null) 'capacity': capacity,
      'registrationCount': registrationCount,
      if (registrationUrl != null) 'registrationUrl': registrationUrl,
      'isInternalRegistration': isInternalRegistration,
      'tags': tags.toJson(),
      'isApproved': isApproved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'collegeId': collegeId,
      'organizerClub': organizerClub,
      'creatorUserId': creatorUserId,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'venue': venue,
      'eventDate': eventDate.toJson(),
      'registrationDeadline': registrationDeadline.toJson(),
      if (capacity != null) 'capacity': capacity,
      'registrationCount': registrationCount,
      if (registrationUrl != null) 'registrationUrl': registrationUrl,
      'isInternalRegistration': isInternalRegistration,
      'tags': tags.toJson(),
      'isApproved': isApproved,
      'createdAt': createdAt.toJson(),
    };
  }

  static CampusEventInclude include() {
    return CampusEventInclude._();
  }

  static CampusEventIncludeList includeList({
    _is.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    CampusEventInclude? include,
  }) {
    return CampusEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CampusEventImpl extends CampusEvent {
  _CampusEventImpl({
    int? id,
    required int collegeId,
    required String organizerClub,
    required int creatorUserId,
    required String title,
    required String description,
    required String posterUrl,
    required String venue,
    required DateTime eventDate,
    required DateTime registrationDeadline,
    int? capacity,
    required int registrationCount,
    String? registrationUrl,
    required bool isInternalRegistration,
    required List<String> tags,
    required bool isApproved,
    required DateTime createdAt,
  }) : super._(
          id: id,
          collegeId: collegeId,
          organizerClub: organizerClub,
          creatorUserId: creatorUserId,
          title: title,
          description: description,
          posterUrl: posterUrl,
          venue: venue,
          eventDate: eventDate,
          registrationDeadline: registrationDeadline,
          capacity: capacity,
          registrationCount: registrationCount,
          registrationUrl: registrationUrl,
          isInternalRegistration: isInternalRegistration,
          tags: tags,
          isApproved: isApproved,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CampusEvent copyWith({
    Object? id = _Undefined,
    int? collegeId,
    String? organizerClub,
    int? creatorUserId,
    String? title,
    String? description,
    String? posterUrl,
    String? venue,
    DateTime? eventDate,
    DateTime? registrationDeadline,
    Object? capacity = _Undefined,
    int? registrationCount,
    Object? registrationUrl = _Undefined,
    bool? isInternalRegistration,
    List<String>? tags,
    bool? isApproved,
    DateTime? createdAt,
  }) {
    return CampusEvent(
      id: id is int? ? id : this.id,
      collegeId: collegeId ?? this.collegeId,
      organizerClub: organizerClub ?? this.organizerClub,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      venue: venue ?? this.venue,
      eventDate: eventDate ?? this.eventDate,
      registrationDeadline: registrationDeadline ?? this.registrationDeadline,
      capacity: capacity is int? ? capacity : this.capacity,
      registrationCount: registrationCount ?? this.registrationCount,
      registrationUrl:
          registrationUrl is String? ? registrationUrl : this.registrationUrl,
      isInternalRegistration:
          isInternalRegistration ?? this.isInternalRegistration,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CampusEventUpdateTable extends _is.UpdateTable<CampusEventTable> {
  CampusEventUpdateTable(super.table);

  _is.ColumnValue<int, int> collegeId(int value) => _is.ColumnValue(
        table.collegeId,
        value,
      );

  _is.ColumnValue<String, String> organizerClub(String value) =>
      _is.ColumnValue(
        table.organizerClub,
        value,
      );

  _is.ColumnValue<int, int> creatorUserId(int value) => _is.ColumnValue(
        table.creatorUserId,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
        table.title,
        value,
      );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
        table.description,
        value,
      );

  _is.ColumnValue<String, String> posterUrl(String value) => _is.ColumnValue(
        table.posterUrl,
        value,
      );

  _is.ColumnValue<String, String> venue(String value) => _is.ColumnValue(
        table.venue,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> eventDate(DateTime value) =>
      _is.ColumnValue(
        table.eventDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> registrationDeadline(DateTime value) =>
      _is.ColumnValue(
        table.registrationDeadline,
        value,
      );

  _is.ColumnValue<int, int> capacity(int? value) => _is.ColumnValue(
        table.capacity,
        value,
      );

  _is.ColumnValue<int, int> registrationCount(int value) => _is.ColumnValue(
        table.registrationCount,
        value,
      );

  _is.ColumnValue<String, String> registrationUrl(String? value) =>
      _is.ColumnValue(
        table.registrationUrl,
        value,
      );

  _is.ColumnValue<bool, bool> isInternalRegistration(bool value) =>
      _is.ColumnValue(
        table.isInternalRegistration,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> tags(List<String> value) =>
      _is.ColumnValue(
        table.tags,
        value,
      );

  _is.ColumnValue<bool, bool> isApproved(bool value) => _is.ColumnValue(
        table.isApproved,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CampusEventTable extends _is.Table<int?> {
  CampusEventTable({super.tableRelation}) : super(tableName: 'campus_event') {
    updateTable = CampusEventUpdateTable(this);
    collegeId = _is.ColumnInt(
      'collegeId',
      this,
    );
    organizerClub = _is.ColumnString(
      'organizerClub',
      this,
    );
    creatorUserId = _is.ColumnInt(
      'creatorUserId',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    posterUrl = _is.ColumnString(
      'posterUrl',
      this,
    );
    venue = _is.ColumnString(
      'venue',
      this,
    );
    eventDate = _is.ColumnDateTime(
      'eventDate',
      this,
    );
    registrationDeadline = _is.ColumnDateTime(
      'registrationDeadline',
      this,
    );
    capacity = _is.ColumnInt(
      'capacity',
      this,
    );
    registrationCount = _is.ColumnInt(
      'registrationCount',
      this,
    );
    registrationUrl = _is.ColumnString(
      'registrationUrl',
      this,
    );
    isInternalRegistration = _is.ColumnBool(
      'isInternalRegistration',
      this,
    );
    tags = _is.ColumnSerializable<List<String>>(
      'tags',
      this,
    );
    isApproved = _is.ColumnBool(
      'isApproved',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CampusEventUpdateTable updateTable;

  late final _is.ColumnInt collegeId;

  late final _is.ColumnString organizerClub;

  late final _is.ColumnInt creatorUserId;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString posterUrl;

  late final _is.ColumnString venue;

  late final _is.ColumnDateTime eventDate;

  late final _is.ColumnDateTime registrationDeadline;

  late final _is.ColumnInt capacity;

  late final _is.ColumnInt registrationCount;

  late final _is.ColumnString registrationUrl;

  late final _is.ColumnBool isInternalRegistration;

  late final _is.ColumnSerializable<List<String>> tags;

  late final _is.ColumnBool isApproved;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        collegeId,
        organizerClub,
        creatorUserId,
        title,
        description,
        posterUrl,
        venue,
        eventDate,
        registrationDeadline,
        capacity,
        registrationCount,
        registrationUrl,
        isInternalRegistration,
        tags,
        isApproved,
        createdAt,
      ];
}

class CampusEventInclude extends _is.IncludeObject {
  CampusEventInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CampusEvent.t;
}

class CampusEventIncludeList extends _is.IncludeList {
  CampusEventIncludeList._({
    _is.WhereExpressionBuilder<CampusEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CampusEvent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CampusEvent.t;
}

class CampusEventRepository {
  const CampusEventRepository._();

  /// Returns a list of [CampusEvent]s matching the given query parameters.
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
  Future<List<CampusEvent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CampusEvent>(
      where: where?.call(CampusEvent.t),
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CampusEvent] matching the given query parameters.
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
  Future<CampusEvent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CampusEventTable>? where,
    int? offset,
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CampusEvent>(
      where: where?.call(CampusEvent.t),
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CampusEvent] by its [id] or null if no such row exists.
  Future<CampusEvent?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CampusEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CampusEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [CampusEvent]s will have their `id` fields set.
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
  Future<List<CampusEvent>> insert(
    _is.DatabaseSession session,
    List<CampusEvent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CampusEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CampusEvent] and returns the inserted row.
  ///
  /// The returned [CampusEvent] will have its `id` field set.
  Future<CampusEvent> insertRow(
    _is.DatabaseSession session,
    CampusEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CampusEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CampusEvent]s in the list and returns the resulting rows.
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
  /// The returned [CampusEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CampusEvent>> upsert(
    _is.DatabaseSession session,
    List<CampusEvent> rows, {
    required _is.ColumnSelections<CampusEventTable> conflictColumns,
    _is.ColumnSelections<CampusEventTable>? updateColumns,
    _is.WhereExpressionBuilder<CampusEventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CampusEvent>(
      rows,
      conflictColumns: conflictColumns(CampusEvent.t),
      updateColumns: updateColumns?.call(CampusEvent.t),
      updateWhere: updateWhere?.call(CampusEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CampusEvent] and returns the resulting row.
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
  /// The returned [CampusEvent] will have its `id` field set.
  Future<CampusEvent?> upsertRow(
    _is.DatabaseSession session,
    CampusEvent row, {
    required _is.ColumnSelections<CampusEventTable> conflictColumns,
    _is.ColumnSelections<CampusEventTable>? updateColumns,
    _is.WhereExpressionBuilder<CampusEventTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CampusEvent>(
      row,
      conflictColumns: conflictColumns(CampusEvent.t),
      updateColumns: updateColumns?.call(CampusEvent.t),
      updateWhere: updateWhere?.call(CampusEvent.t),
      transaction: transaction,
    );
  }

  /// Updates all [CampusEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CampusEvent>> update(
    _is.DatabaseSession session,
    List<CampusEvent> rows, {
    _is.ColumnSelections<CampusEventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CampusEvent>(
      rows,
      columns: columns?.call(CampusEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CampusEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CampusEvent> updateRow(
    _is.DatabaseSession session,
    CampusEvent row, {
    _is.ColumnSelections<CampusEventTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CampusEvent>(
      row,
      columns: columns?.call(CampusEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CampusEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CampusEvent?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CampusEventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CampusEvent>(
      id,
      columnValues: columnValues(CampusEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CampusEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CampusEvent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CampusEventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CampusEventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CampusEvent>(
      columnValues: columnValues(CampusEvent.t.updateTable),
      where: where(CampusEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CampusEvent]s in the list and returns the deleted rows.
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
  Future<List<CampusEvent>> delete(
    _is.DatabaseSession session,
    List<CampusEvent> rows, {
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CampusEvent>(
      rows,
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CampusEvent].
  Future<CampusEvent> deleteRow(
    _is.DatabaseSession session,
    CampusEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CampusEvent>(
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
  Future<List<CampusEvent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CampusEventTable> where,
    _is.OrderByBuilder<CampusEventTable>? orderBy,
    _is.OrderByListBuilder<CampusEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CampusEvent>(
      where: where(CampusEvent.t),
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CampusEvent>(
      where: where?.call(CampusEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CampusEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CampusEventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CampusEvent>(
      where: where(CampusEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
