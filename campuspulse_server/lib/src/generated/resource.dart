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

abstract class Resource
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Resource._({
    this.id,
    required this.uploaderId,
    required this.uploaderName,
    this.uploaderSgpa,
    this.uploaderSemester,
    required this.title,
    required this.description,
    required this.subjectId,
    required this.subjectName,
    required this.semester,
    required this.branchId,
    required this.year,
    required this.resourceType,
    this.fileUrl,
    this.externalUrl,
    required this.tags,
    required this.viewsCount,
    required this.followCount,
    required this.averageRating,
    required this.ratingCount,
    required this.createdAt,
  });

  factory Resource({
    int? id,
    required int uploaderId,
    required String uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    required String title,
    required String description,
    required int subjectId,
    required String subjectName,
    required int semester,
    required int branchId,
    required int year,
    required String resourceType,
    String? fileUrl,
    String? externalUrl,
    required List<String> tags,
    required int viewsCount,
    required int followCount,
    required double averageRating,
    required int ratingCount,
    required DateTime createdAt,
  }) = _ResourceImpl;

  factory Resource.fromJson(Map<String, dynamic> jsonSerialization) {
    return Resource(
      id: jsonSerialization['id'] as int?,
      uploaderId: jsonSerialization['uploaderId'] as int,
      uploaderName: jsonSerialization['uploaderName'] as String,
      uploaderSgpa: (jsonSerialization['uploaderSgpa'] as num?)?.toDouble(),
      uploaderSemester: jsonSerialization['uploaderSemester'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      subjectId: jsonSerialization['subjectId'] as int,
      subjectName: jsonSerialization['subjectName'] as String,
      semester: jsonSerialization['semester'] as int,
      branchId: jsonSerialization['branchId'] as int,
      year: jsonSerialization['year'] as int,
      resourceType: jsonSerialization['resourceType'] as String,
      fileUrl: jsonSerialization['fileUrl'] as String?,
      externalUrl: jsonSerialization['externalUrl'] as String?,
      tags: _i3yc8a0r.Protocol()
          .deserialize<List<String>>(jsonSerialization['tags']),
      viewsCount: jsonSerialization['viewsCount'] as int,
      followCount: jsonSerialization['followCount'] as int,
      averageRating: (jsonSerialization['averageRating'] as num).toDouble(),
      ratingCount: jsonSerialization['ratingCount'] as int,
      createdAt:
          _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ResourceTable();

  static const db = ResourceRepository._();

  @override
  int? id;

  int uploaderId;

  String uploaderName;

  double? uploaderSgpa;

  int? uploaderSemester;

  String title;

  String description;

  int subjectId;

  String subjectName;

  int semester;

  int branchId;

  int year;

  String resourceType;

  String? fileUrl;

  String? externalUrl;

  List<String> tags;

  int viewsCount;

  int followCount;

  double averageRating;

  int ratingCount;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Resource]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Resource copyWith({
    int? id,
    int? uploaderId,
    String? uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    String? title,
    String? description,
    int? subjectId,
    String? subjectName,
    int? semester,
    int? branchId,
    int? year,
    String? resourceType,
    String? fileUrl,
    String? externalUrl,
    List<String>? tags,
    int? viewsCount,
    int? followCount,
    double? averageRating,
    int? ratingCount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Resource',
      if (id != null) 'id': id,
      'uploaderId': uploaderId,
      'uploaderName': uploaderName,
      if (uploaderSgpa != null) 'uploaderSgpa': uploaderSgpa,
      if (uploaderSemester != null) 'uploaderSemester': uploaderSemester,
      'title': title,
      'description': description,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'semester': semester,
      'branchId': branchId,
      'year': year,
      'resourceType': resourceType,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (externalUrl != null) 'externalUrl': externalUrl,
      'tags': tags.toJson(),
      'viewsCount': viewsCount,
      'followCount': followCount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Resource',
      if (id != null) 'id': id,
      'uploaderId': uploaderId,
      'uploaderName': uploaderName,
      if (uploaderSgpa != null) 'uploaderSgpa': uploaderSgpa,
      if (uploaderSemester != null) 'uploaderSemester': uploaderSemester,
      'title': title,
      'description': description,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'semester': semester,
      'branchId': branchId,
      'year': year,
      'resourceType': resourceType,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (externalUrl != null) 'externalUrl': externalUrl,
      'tags': tags.toJson(),
      'viewsCount': viewsCount,
      'followCount': followCount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'createdAt': createdAt.toJson(),
    };
  }

  static ResourceInclude include() {
    return ResourceInclude._();
  }

  static ResourceIncludeList includeList({
    _is.WhereExpressionBuilder<ResourceTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    ResourceInclude? include,
  }) {
    return ResourceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResourceImpl extends Resource {
  _ResourceImpl({
    int? id,
    required int uploaderId,
    required String uploaderName,
    double? uploaderSgpa,
    int? uploaderSemester,
    required String title,
    required String description,
    required int subjectId,
    required String subjectName,
    required int semester,
    required int branchId,
    required int year,
    required String resourceType,
    String? fileUrl,
    String? externalUrl,
    required List<String> tags,
    required int viewsCount,
    required int followCount,
    required double averageRating,
    required int ratingCount,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uploaderId: uploaderId,
          uploaderName: uploaderName,
          uploaderSgpa: uploaderSgpa,
          uploaderSemester: uploaderSemester,
          title: title,
          description: description,
          subjectId: subjectId,
          subjectName: subjectName,
          semester: semester,
          branchId: branchId,
          year: year,
          resourceType: resourceType,
          fileUrl: fileUrl,
          externalUrl: externalUrl,
          tags: tags,
          viewsCount: viewsCount,
          followCount: followCount,
          averageRating: averageRating,
          ratingCount: ratingCount,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Resource]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Resource copyWith({
    Object? id = _Undefined,
    int? uploaderId,
    String? uploaderName,
    Object? uploaderSgpa = _Undefined,
    Object? uploaderSemester = _Undefined,
    String? title,
    String? description,
    int? subjectId,
    String? subjectName,
    int? semester,
    int? branchId,
    int? year,
    String? resourceType,
    Object? fileUrl = _Undefined,
    Object? externalUrl = _Undefined,
    List<String>? tags,
    int? viewsCount,
    int? followCount,
    double? averageRating,
    int? ratingCount,
    DateTime? createdAt,
  }) {
    return Resource(
      id: id is int? ? id : this.id,
      uploaderId: uploaderId ?? this.uploaderId,
      uploaderName: uploaderName ?? this.uploaderName,
      uploaderSgpa: uploaderSgpa is double? ? uploaderSgpa : this.uploaderSgpa,
      uploaderSemester:
          uploaderSemester is int? ? uploaderSemester : this.uploaderSemester,
      title: title ?? this.title,
      description: description ?? this.description,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      semester: semester ?? this.semester,
      branchId: branchId ?? this.branchId,
      year: year ?? this.year,
      resourceType: resourceType ?? this.resourceType,
      fileUrl: fileUrl is String? ? fileUrl : this.fileUrl,
      externalUrl: externalUrl is String? ? externalUrl : this.externalUrl,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      viewsCount: viewsCount ?? this.viewsCount,
      followCount: followCount ?? this.followCount,
      averageRating: averageRating ?? this.averageRating,
      ratingCount: ratingCount ?? this.ratingCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ResourceUpdateTable extends _is.UpdateTable<ResourceTable> {
  ResourceUpdateTable(super.table);

  _is.ColumnValue<int, int> uploaderId(int value) => _is.ColumnValue(
        table.uploaderId,
        value,
      );

  _is.ColumnValue<String, String> uploaderName(String value) => _is.ColumnValue(
        table.uploaderName,
        value,
      );

  _is.ColumnValue<double, double> uploaderSgpa(double? value) =>
      _is.ColumnValue(
        table.uploaderSgpa,
        value,
      );

  _is.ColumnValue<int, int> uploaderSemester(int? value) => _is.ColumnValue(
        table.uploaderSemester,
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

  _is.ColumnValue<int, int> subjectId(int value) => _is.ColumnValue(
        table.subjectId,
        value,
      );

  _is.ColumnValue<String, String> subjectName(String value) => _is.ColumnValue(
        table.subjectName,
        value,
      );

  _is.ColumnValue<int, int> semester(int value) => _is.ColumnValue(
        table.semester,
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

  _is.ColumnValue<String, String> resourceType(String value) => _is.ColumnValue(
        table.resourceType,
        value,
      );

  _is.ColumnValue<String, String> fileUrl(String? value) => _is.ColumnValue(
        table.fileUrl,
        value,
      );

  _is.ColumnValue<String, String> externalUrl(String? value) => _is.ColumnValue(
        table.externalUrl,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> tags(List<String> value) =>
      _is.ColumnValue(
        table.tags,
        value,
      );

  _is.ColumnValue<int, int> viewsCount(int value) => _is.ColumnValue(
        table.viewsCount,
        value,
      );

  _is.ColumnValue<int, int> followCount(int value) => _is.ColumnValue(
        table.followCount,
        value,
      );

  _is.ColumnValue<double, double> averageRating(double value) =>
      _is.ColumnValue(
        table.averageRating,
        value,
      );

  _is.ColumnValue<int, int> ratingCount(int value) => _is.ColumnValue(
        table.ratingCount,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ResourceTable extends _is.Table<int?> {
  ResourceTable({super.tableRelation}) : super(tableName: 'resource') {
    updateTable = ResourceUpdateTable(this);
    uploaderId = _is.ColumnInt(
      'uploaderId',
      this,
    );
    uploaderName = _is.ColumnString(
      'uploaderName',
      this,
    );
    uploaderSgpa = _is.ColumnDouble(
      'uploaderSgpa',
      this,
    );
    uploaderSemester = _is.ColumnInt(
      'uploaderSemester',
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
    subjectId = _is.ColumnInt(
      'subjectId',
      this,
    );
    subjectName = _is.ColumnString(
      'subjectName',
      this,
    );
    semester = _is.ColumnInt(
      'semester',
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
    resourceType = _is.ColumnString(
      'resourceType',
      this,
    );
    fileUrl = _is.ColumnString(
      'fileUrl',
      this,
    );
    externalUrl = _is.ColumnString(
      'externalUrl',
      this,
    );
    tags = _is.ColumnSerializable<List<String>>(
      'tags',
      this,
    );
    viewsCount = _is.ColumnInt(
      'viewsCount',
      this,
    );
    followCount = _is.ColumnInt(
      'followCount',
      this,
    );
    averageRating = _is.ColumnDouble(
      'averageRating',
      this,
    );
    ratingCount = _is.ColumnInt(
      'ratingCount',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ResourceUpdateTable updateTable;

  late final _is.ColumnInt uploaderId;

  late final _is.ColumnString uploaderName;

  late final _is.ColumnDouble uploaderSgpa;

  late final _is.ColumnInt uploaderSemester;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnInt subjectId;

  late final _is.ColumnString subjectName;

  late final _is.ColumnInt semester;

  late final _is.ColumnInt branchId;

  late final _is.ColumnInt year;

  late final _is.ColumnString resourceType;

  late final _is.ColumnString fileUrl;

  late final _is.ColumnString externalUrl;

  late final _is.ColumnSerializable<List<String>> tags;

  late final _is.ColumnInt viewsCount;

  late final _is.ColumnInt followCount;

  late final _is.ColumnDouble averageRating;

  late final _is.ColumnInt ratingCount;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
        id,
        uploaderId,
        uploaderName,
        uploaderSgpa,
        uploaderSemester,
        title,
        description,
        subjectId,
        subjectName,
        semester,
        branchId,
        year,
        resourceType,
        fileUrl,
        externalUrl,
        tags,
        viewsCount,
        followCount,
        averageRating,
        ratingCount,
        createdAt,
      ];
}

class ResourceInclude extends _is.IncludeObject {
  ResourceInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Resource.t;
}

class ResourceIncludeList extends _is.IncludeList {
  ResourceIncludeList._({
    _is.WhereExpressionBuilder<ResourceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Resource.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Resource.t;
}

class ResourceRepository {
  const ResourceRepository._();

  /// Returns a list of [Resource]s matching the given query parameters.
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
  Future<List<Resource>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Resource>(
      where: where?.call(Resource.t),
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Resource] matching the given query parameters.
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
  Future<Resource?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceTable>? where,
    int? offset,
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Resource>(
      where: where?.call(Resource.t),
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Resource] by its [id] or null if no such row exists.
  Future<Resource?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Resource>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Resource]s in the list and returns the inserted rows.
  ///
  /// The returned [Resource]s will have their `id` fields set.
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
  Future<List<Resource>> insert(
    _is.DatabaseSession session,
    List<Resource> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Resource>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Resource] and returns the inserted row.
  ///
  /// The returned [Resource] will have its `id` field set.
  Future<Resource> insertRow(
    _is.DatabaseSession session,
    Resource row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Resource>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Resource]s in the list and returns the resulting rows.
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
  /// The returned [Resource]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Resource>> upsert(
    _is.DatabaseSession session,
    List<Resource> rows, {
    required _is.ColumnSelections<ResourceTable> conflictColumns,
    _is.ColumnSelections<ResourceTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Resource>(
      rows,
      conflictColumns: conflictColumns(Resource.t),
      updateColumns: updateColumns?.call(Resource.t),
      updateWhere: updateWhere?.call(Resource.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Resource] and returns the resulting row.
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
  /// The returned [Resource] will have its `id` field set.
  Future<Resource?> upsertRow(
    _is.DatabaseSession session,
    Resource row, {
    required _is.ColumnSelections<ResourceTable> conflictColumns,
    _is.ColumnSelections<ResourceTable>? updateColumns,
    _is.WhereExpressionBuilder<ResourceTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Resource>(
      row,
      conflictColumns: conflictColumns(Resource.t),
      updateColumns: updateColumns?.call(Resource.t),
      updateWhere: updateWhere?.call(Resource.t),
      transaction: transaction,
    );
  }

  /// Updates all [Resource]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Resource>> update(
    _is.DatabaseSession session,
    List<Resource> rows, {
    _is.ColumnSelections<ResourceTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Resource>(
      rows,
      columns: columns?.call(Resource.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Resource]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Resource> updateRow(
    _is.DatabaseSession session,
    Resource row, {
    _is.ColumnSelections<ResourceTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Resource>(
      row,
      columns: columns?.call(Resource.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Resource] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Resource?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ResourceUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Resource>(
      id,
      columnValues: columnValues(Resource.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Resource]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Resource>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ResourceUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ResourceTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Resource>(
      columnValues: columnValues(Resource.t.updateTable),
      where: where(Resource.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Resource]s in the list and returns the deleted rows.
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
  Future<List<Resource>> delete(
    _is.DatabaseSession session,
    List<Resource> rows, {
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Resource>(
      rows,
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Resource].
  Future<Resource> deleteRow(
    _is.DatabaseSession session,
    Resource row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Resource>(
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
  Future<List<Resource>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceTable> where,
    _is.OrderByBuilder<ResourceTable>? orderBy,
    _is.OrderByListBuilder<ResourceTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Resource>(
      where: where(Resource.t),
      orderBy: orderBy?.call(Resource.t),
      orderByList: orderByList?.call(Resource.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ResourceTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Resource>(
      where: where?.call(Resource.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Resource] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ResourceTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Resource>(
      where: where(Resource.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
