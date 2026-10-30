/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:campuspulse_server/src/generated/attendance_record.dart'
    as _isla0z1b;
import 'package:campuspulse_server/src/generated/branch.dart' as _ihs2ori1;
import 'package:campuspulse_server/src/generated/calendar_event.dart'
    as _istykq5y;
import 'package:campuspulse_server/src/generated/campus_event.dart'
    as _it7zfymm;
import 'package:campuspulse_server/src/generated/chat_message.dart'
    as _imyicp44;
import 'package:campuspulse_server/src/generated/college.dart' as _it3n4bfl;
import 'package:campuspulse_server/src/generated/community.dart' as _i7h7jc2v;
import 'package:campuspulse_server/src/generated/community_post.dart'
    as _ic55s9vl;
import 'package:campuspulse_server/src/generated/player_rating.dart'
    as _ip2o1nl0;
import 'package:campuspulse_server/src/generated/rental_item.dart' as _i4sq9vz0;
import 'package:campuspulse_server/src/generated/resource.dart' as _iio1natz;
import 'package:campuspulse_server/src/generated/section.dart' as _izqh71ge;
import 'package:campuspulse_server/src/generated/subject.dart' as _ivpd2io6;
import 'package:campuspulse_server/src/generated/timetable_entry.dart'
    as _i2vl72e6;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i1n3uhu0;
import 'abuse_report.dart' as _ihguhq0p;
import 'attendance_log.dart' as _io4i8do7;
import 'attendance_record.dart' as _ixvdsmvt;
import 'bookmark.dart' as _ix7of1rp;
import 'branch.dart' as _idbyazj1;
import 'bunk_calculation_result.dart' as _iv5qu3pv;
import 'calendar_event.dart' as _ix2r355r;
import 'campus_event.dart' as _ieh998j0;
import 'chat_message.dart' as _ivuncx2e;
import 'college.dart' as _i8tvpfpu;
import 'community.dart' as _i2q09qvg;
import 'community_member.dart' as _i4so5yx4;
import 'community_post.dart' as _itvhuiq9;
import 'connection_request.dart' as _iz5lkuxs;
import 'conversation.dart' as _ineda879;
import 'event_registration.dart' as _i27uzliw;
import 'player_rating.dart' as _ibyn5m0u;
import 'quiz_answer.dart' as _iqnkhz1e;
import 'quiz_match.dart' as _i1t0rvlk;
import 'quiz_match_player.dart' as _ib9ts4qi;
import 'quiz_question.dart' as _i6b38qpb;
import 'rental_item.dart' as _iq77owbk;
import 'rental_request.dart' as _icoj4fd8;
import 'requirement.dart' as _i2t2d2gw;
import 'resource.dart' as _irrgqval;
import 'resource_comment.dart' as _i65peffv;
import 'resource_follow.dart' as _i4qv7on0;
import 'resource_rating.dart' as _im9fqx94;
import 'section.dart' as _ibhmj7lb;
import 'subject.dart' as _iasteo6b;
import 'timetable_entry.dart' as _i45m7rr0;
import 'user_profile.dart' as _ir2mn8w1;
export 'abuse_report.dart';
export 'attendance_log.dart';
export 'attendance_record.dart';
export 'bookmark.dart';
export 'branch.dart';
export 'bunk_calculation_result.dart';
export 'calendar_event.dart';
export 'campus_event.dart';
export 'chat_message.dart';
export 'college.dart';
export 'community.dart';
export 'community_member.dart';
export 'community_post.dart';
export 'connection_request.dart';
export 'conversation.dart';
export 'event_registration.dart';
export 'player_rating.dart';
export 'quiz_answer.dart';
export 'quiz_match.dart';
export 'quiz_match_player.dart';
export 'quiz_question.dart';
export 'rental_item.dart';
export 'rental_request.dart';
export 'requirement.dart';
export 'resource.dart';
export 'resource_comment.dart';
export 'resource_follow.dart';
export 'resource_rating.dart';
export 'section.dart';
export 'subject.dart';
export 'timetable_entry.dart';
export 'user_profile.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
        _isp.TableDefinition(
          name: 'abuse_report',
          dartName: 'AbuseReport',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'reporterUserId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'reporterUserName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'targetType',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'targetId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'reason',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'status',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'report_status_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'status',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'attendance_log',
          dartName: 'AttendanceLog',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'date',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'status',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'source',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'attendance_log_user_date_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'date',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'attendance_record',
          dartName: 'AttendanceRecord',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'subjectCode',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'classesAttended',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'totalClassesHeld',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'requiredPercentage',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'plannedTotalClasses',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'lastUpdated',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'attendance_user_subject_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'subjectId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'bookmark',
          dartName: 'Bookmark',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'resourceType',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'targetId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'subtitle',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'bookmark_user_target_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'resourceType',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'targetId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'branch',
          dartName: 'Branch',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'name',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'code',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'degree',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'branch_college_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'calendar_event',
          dartName: 'CalendarEvent',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'sectionId',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'eventType',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'startDate',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'endDate',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'isAllDay',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'venue',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'cal_event_college_date_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'startDate',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'campus_event',
          dartName: 'CampusEvent',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'organizerClub',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'creatorUserId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'posterUrl',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'venue',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'eventDate',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'registrationDeadline',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'capacity',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'registrationCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'registrationUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'isInternalRegistration',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'tags',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'isApproved',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'campus_event_deadline_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'registrationDeadline',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'chat_message',
          dartName: 'ChatMessage',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'conversationId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'senderId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'senderName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'content',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'isRead',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'chat_msg_conv_time_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'conversationId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'createdAt',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'college',
          dartName: 'College',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'name',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'code',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'city',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'state',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'college_code_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'code',
                )
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'community',
          dartName: 'Community',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'name',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'category',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'iconUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'creatorUserId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'isPrivate',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'memberCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'community_category_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'category',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'community_member',
          dartName: 'CommunityMember',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'communityId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'role',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'joinedAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'isApproved',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'comm_member_unique_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'communityId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'community_post',
          dartName: 'CommunityPost',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'communityId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'authorId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'authorName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'authorAvatarUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'content',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'imageUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'isAnnouncement',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'isPinned',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'likeCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'commentCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'comm_post_comm_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'communityId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'createdAt',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'connection_request',
          dartName: 'ConnectionRequest',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'senderId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'senderName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'receiverId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'receiverName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'note',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'status',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'messageCountBeforeAccept',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'updatedAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: true,
              dartType: 'DateTime?',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'conn_req_sender_recv_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'senderId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'receiverId',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'conversation',
          dartName: 'Conversation',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'user1Id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'user2Id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'lastMessageSnippet',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'lastMessageAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: true,
              dartType: 'DateTime?',
            ),
            _isp.ColumnDefinition(
              name: 'user1UnreadCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'user2UnreadCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'isAccepted',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'conversation_users_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'user1Id',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'user2Id',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'event_registration',
          dartName: 'EventRegistration',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'eventId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'userEmail',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'registeredAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'event_reg_unique_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'eventId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'player_rating',
          dartName: 'PlayerRating',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'branchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'year',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'rating',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'matchesPlayed',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'matchesWon',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'weeklyScore',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'lastUpdated',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'player_rating_user_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                )
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'player_rating_college_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'rating',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'quiz_answer',
          dartName: 'QuizAnswer',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'matchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'questionId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'selectedOptionIndex',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'timeTakenMs',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'isCorrect',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'pointsEarned',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'quiz_ans_match_q_u_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'matchId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'questionId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'quiz_match',
          dartName: 'QuizMatch',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'mode',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'roomCode',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'subject',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'difficulty',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'status',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'questionIdsJson',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'currentQuestionIndex',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'startedAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: true,
              dartType: 'DateTime?',
            ),
            _isp.ColumnDefinition(
              name: 'endedAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: true,
              dartType: 'DateTime?',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'quiz_match_room_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'roomCode',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'quiz_match_player',
          dartName: 'QuizMatchPlayer',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'matchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'userAvatarUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'score',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'correctAnswersCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'ratingBefore',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'ratingAfter',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'isFinished',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'quiz_player_match_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'matchId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'quiz_question',
          dartName: 'QuizQuestion',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'subject',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'topic',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'difficulty',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'questionText',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'optionA',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'optionB',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'optionC',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'optionD',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'correctOptionIndex',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'explanation',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'textHash',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'usageCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'quiz_question_subj_diff_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'subject',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'difficulty',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'quiz_question_hash_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'textHash',
                )
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            ),
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'rental_item',
          dartName: 'RentalItem',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'ownerId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'ownerName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'category',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'photosJson',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'rentPricePerDay',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'depositAmount',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'condition',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'isAvailable',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'pickupPlace',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'rental_item_college_avail_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'isAvailable',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'rental_request',
          dartName: 'RentalRequest',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'itemId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'renterId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'renterName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'ownerId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'status',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'consentAgreed',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'startDate',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'returnDueDate',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'handoverPhotosJson',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'returnPhotosJson',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'totalRentAmount',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'depositHeld',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'rental_req_item_renter_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'itemId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'renterId',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'requirement',
          dartName: 'Requirement',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'creatorId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'creatorName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'creatorCollege',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'creatorBranch',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'creatorYear',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'purpose',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'requiredSkills',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'preferredSkills',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'teamSizeNeeded',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'deadline',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: true,
              dartType: 'DateTime?',
            ),
            _isp.ColumnDefinition(
              name: 'preferredBranch',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'preferredYear',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'proximity',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'isActive',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'requirement_purpose_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'purpose',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'requirement_creator_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'creatorId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'resource',
          dartName: 'Resource',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'uploaderId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'uploaderName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'uploaderSgpa',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: true,
              dartType: 'double?',
            ),
            _isp.ColumnDefinition(
              name: 'uploaderSemester',
              columnType: _isp.ColumnType.bigint,
              isNullable: true,
              dartType: 'int?',
            ),
            _isp.ColumnDefinition(
              name: 'title',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'description',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'subjectId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'semester',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'branchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'year',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'resourceType',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'fileUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'externalUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'tags',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'viewsCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'followCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'averageRating',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'ratingCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'resource_branch_year_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'branchId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'year',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'resource_subject_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'subjectId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'resource_comment',
          dartName: 'ResourceComment',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'resourceId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'userAvatarUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'content',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
            _isp.ColumnDefinition(
              name: 'isReported',
              columnType: _isp.ColumnType.boolean,
              isNullable: false,
              dartType: 'bool',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'res_comment_res_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'resourceId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'resource_follow',
          dartName: 'ResourceFollow',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'resourceId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'res_follow_uniq_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'resourceId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'resource_rating',
          dartName: 'ResourceRating',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'resourceId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'userName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'rating',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'review',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'res_rating_user_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'resourceId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userId',
                ),
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'section',
          dartName: 'Section',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'branchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'name',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'year',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'semester',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'section_branch_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'branchId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'subject',
          dartName: 'Subject',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'branchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'semester',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'name',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'code',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'credits',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'subject_branch_sem_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'branchId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'semester',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'timetable_entry',
          dartName: 'TimetableEntry',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'sectionId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'subjectName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'subjectCode',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'facultyName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'roomNumber',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'dayOfWeek',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'startTime',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'endTime',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'type',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'timetable_section_day_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'sectionId',
                ),
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'dayOfWeek',
                ),
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            )
          ],
          managed: true,
        ),
        _isp.TableDefinition(
          name: 'user_profile',
          dartName: 'UserProfile',
          schema: 'public',
          module: 'campuspulse',
          columns: [
            _isp.ColumnDefinition(
              name: 'id',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int?',
              columnDefault: 'serial',
            ),
            _isp.ColumnDefinition(
              name: 'userInfoId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'fullName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'email',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'avatarUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'collegeId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'collegeName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'branchId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'branchName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'sectionId',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'sectionName',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'year',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'semester',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'bio',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'interests',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'skills',
              columnType: _isp.ColumnType.json,
              isNullable: false,
              dartType: 'List<String>',
            ),
            _isp.ColumnDefinition(
              name: 'githubUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'linkedinUrl',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'role',
              columnType: _isp.ColumnType.text,
              isNullable: false,
              dartType: 'String',
            ),
            _isp.ColumnDefinition(
              name: 'sgpaJson',
              columnType: _isp.ColumnType.text,
              isNullable: true,
              dartType: 'String?',
            ),
            _isp.ColumnDefinition(
              name: 'notesUploadedCount',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'averageRatingReceived',
              columnType: _isp.ColumnType.doublePrecision,
              isNullable: false,
              dartType: 'double',
            ),
            _isp.ColumnDefinition(
              name: 'quizRank',
              columnType: _isp.ColumnType.bigint,
              isNullable: false,
              dartType: 'int',
            ),
            _isp.ColumnDefinition(
              name: 'createdAt',
              columnType: _isp.ColumnType.timestampWithoutTimeZone,
              isNullable: false,
              dartType: 'DateTime',
            ),
          ],
          foreignKeys: [],
          indexes: [
            _isp.IndexDefinition(
              indexName: 'user_profile_userinfo_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'userInfoId',
                )
              ],
              type: 'btree',
              isUnique: true,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'user_profile_college_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'collegeId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
            _isp.IndexDefinition(
              indexName: 'user_profile_branch_idx',
              tableSpace: null,
              elements: [
                _isp.IndexElementDefinition(
                  type: _isp.IndexElementDefinitionType.column,
                  definition: 'branchId',
                )
              ],
              type: 'btree',
              isUnique: false,
              isPrimary: false,
            ),
          ],
          managed: true,
        ),
        ..._i1n3uhu0.Protocol.targetTableDefinitions,
        ..._isp.Protocol.targetTableDefinitions,
      ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _ihguhq0p.AbuseReport) {
      return _ihguhq0p.AbuseReport.fromJson(data) as T;
    }
    if (t == _io4i8do7.AttendanceLog) {
      return _io4i8do7.AttendanceLog.fromJson(data) as T;
    }
    if (t == _ixvdsmvt.AttendanceRecord) {
      return _ixvdsmvt.AttendanceRecord.fromJson(data) as T;
    }
    if (t == _ix7of1rp.Bookmark) {
      return _ix7of1rp.Bookmark.fromJson(data) as T;
    }
    if (t == _idbyazj1.Branch) {
      return _idbyazj1.Branch.fromJson(data) as T;
    }
    if (t == _iv5qu3pv.BunkCalculationResult) {
      return _iv5qu3pv.BunkCalculationResult.fromJson(data) as T;
    }
    if (t == _ix2r355r.CalendarEvent) {
      return _ix2r355r.CalendarEvent.fromJson(data) as T;
    }
    if (t == _ieh998j0.CampusEvent) {
      return _ieh998j0.CampusEvent.fromJson(data) as T;
    }
    if (t == _ivuncx2e.ChatMessage) {
      return _ivuncx2e.ChatMessage.fromJson(data) as T;
    }
    if (t == _i8tvpfpu.College) {
      return _i8tvpfpu.College.fromJson(data) as T;
    }
    if (t == _i2q09qvg.Community) {
      return _i2q09qvg.Community.fromJson(data) as T;
    }
    if (t == _i4so5yx4.CommunityMember) {
      return _i4so5yx4.CommunityMember.fromJson(data) as T;
    }
    if (t == _itvhuiq9.CommunityPost) {
      return _itvhuiq9.CommunityPost.fromJson(data) as T;
    }
    if (t == _iz5lkuxs.ConnectionRequest) {
      return _iz5lkuxs.ConnectionRequest.fromJson(data) as T;
    }
    if (t == _ineda879.Conversation) {
      return _ineda879.Conversation.fromJson(data) as T;
    }
    if (t == _i27uzliw.EventRegistration) {
      return _i27uzliw.EventRegistration.fromJson(data) as T;
    }
    if (t == _ibyn5m0u.PlayerRating) {
      return _ibyn5m0u.PlayerRating.fromJson(data) as T;
    }
    if (t == _iqnkhz1e.QuizAnswer) {
      return _iqnkhz1e.QuizAnswer.fromJson(data) as T;
    }
    if (t == _i1t0rvlk.QuizMatch) {
      return _i1t0rvlk.QuizMatch.fromJson(data) as T;
    }
    if (t == _ib9ts4qi.QuizMatchPlayer) {
      return _ib9ts4qi.QuizMatchPlayer.fromJson(data) as T;
    }
    if (t == _i6b38qpb.QuizQuestion) {
      return _i6b38qpb.QuizQuestion.fromJson(data) as T;
    }
    if (t == _iq77owbk.RentalItem) {
      return _iq77owbk.RentalItem.fromJson(data) as T;
    }
    if (t == _icoj4fd8.RentalRequest) {
      return _icoj4fd8.RentalRequest.fromJson(data) as T;
    }
    if (t == _i2t2d2gw.Requirement) {
      return _i2t2d2gw.Requirement.fromJson(data) as T;
    }
    if (t == _irrgqval.Resource) {
      return _irrgqval.Resource.fromJson(data) as T;
    }
    if (t == _i65peffv.ResourceComment) {
      return _i65peffv.ResourceComment.fromJson(data) as T;
    }
    if (t == _i4qv7on0.ResourceFollow) {
      return _i4qv7on0.ResourceFollow.fromJson(data) as T;
    }
    if (t == _im9fqx94.ResourceRating) {
      return _im9fqx94.ResourceRating.fromJson(data) as T;
    }
    if (t == _ibhmj7lb.Section) {
      return _ibhmj7lb.Section.fromJson(data) as T;
    }
    if (t == _iasteo6b.Subject) {
      return _iasteo6b.Subject.fromJson(data) as T;
    }
    if (t == _i45m7rr0.TimetableEntry) {
      return _i45m7rr0.TimetableEntry.fromJson(data) as T;
    }
    if (t == _ir2mn8w1.UserProfile) {
      return _ir2mn8w1.UserProfile.fromJson(data) as T;
    }
    if (t == _is.getType<_ihguhq0p.AbuseReport?>()) {
      return (data != null ? _ihguhq0p.AbuseReport.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_io4i8do7.AttendanceLog?>()) {
      return (data != null ? _io4i8do7.AttendanceLog.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ixvdsmvt.AttendanceRecord?>()) {
      return (data != null ? _ixvdsmvt.AttendanceRecord.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ix7of1rp.Bookmark?>()) {
      return (data != null ? _ix7of1rp.Bookmark.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_idbyazj1.Branch?>()) {
      return (data != null ? _idbyazj1.Branch.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iv5qu3pv.BunkCalculationResult?>()) {
      return (data != null
          ? _iv5qu3pv.BunkCalculationResult.fromJson(data)
          : null) as T;
    }
    if (t == _is.getType<_ix2r355r.CalendarEvent?>()) {
      return (data != null ? _ix2r355r.CalendarEvent.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ieh998j0.CampusEvent?>()) {
      return (data != null ? _ieh998j0.CampusEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ivuncx2e.ChatMessage?>()) {
      return (data != null ? _ivuncx2e.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i8tvpfpu.College?>()) {
      return (data != null ? _i8tvpfpu.College.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i2q09qvg.Community?>()) {
      return (data != null ? _i2q09qvg.Community.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i4so5yx4.CommunityMember?>()) {
      return (data != null ? _i4so5yx4.CommunityMember.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_itvhuiq9.CommunityPost?>()) {
      return (data != null ? _itvhuiq9.CommunityPost.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iz5lkuxs.ConnectionRequest?>()) {
      return (data != null ? _iz5lkuxs.ConnectionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ineda879.Conversation?>()) {
      return (data != null ? _ineda879.Conversation.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i27uzliw.EventRegistration?>()) {
      return (data != null ? _i27uzliw.EventRegistration.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ibyn5m0u.PlayerRating?>()) {
      return (data != null ? _ibyn5m0u.PlayerRating.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iqnkhz1e.QuizAnswer?>()) {
      return (data != null ? _iqnkhz1e.QuizAnswer.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i1t0rvlk.QuizMatch?>()) {
      return (data != null ? _i1t0rvlk.QuizMatch.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ib9ts4qi.QuizMatchPlayer?>()) {
      return (data != null ? _ib9ts4qi.QuizMatchPlayer.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i6b38qpb.QuizQuestion?>()) {
      return (data != null ? _i6b38qpb.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iq77owbk.RentalItem?>()) {
      return (data != null ? _iq77owbk.RentalItem.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_icoj4fd8.RentalRequest?>()) {
      return (data != null ? _icoj4fd8.RentalRequest.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i2t2d2gw.Requirement?>()) {
      return (data != null ? _i2t2d2gw.Requirement.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_irrgqval.Resource?>()) {
      return (data != null ? _irrgqval.Resource.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i65peffv.ResourceComment?>()) {
      return (data != null ? _i65peffv.ResourceComment.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i4qv7on0.ResourceFollow?>()) {
      return (data != null ? _i4qv7on0.ResourceFollow.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_im9fqx94.ResourceRating?>()) {
      return (data != null ? _im9fqx94.ResourceRating.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ibhmj7lb.Section?>()) {
      return (data != null ? _ibhmj7lb.Section.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iasteo6b.Subject?>()) {
      return (data != null ? _iasteo6b.Subject.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i45m7rr0.TimetableEntry?>()) {
      return (data != null ? _i45m7rr0.TimetableEntry.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _is.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_it3n4bfl.College>) {
      return (data as List)
          .map((e) => deserialize<_it3n4bfl.College>(e))
          .toList() as T;
    }
    if (t == List<_ihs2ori1.Branch>) {
      return (data as List)
          .map((e) => deserialize<_ihs2ori1.Branch>(e))
          .toList() as T;
    }
    if (t == List<_izqh71ge.Section>) {
      return (data as List)
          .map((e) => deserialize<_izqh71ge.Section>(e))
          .toList() as T;
    }
    if (t == List<_ivpd2io6.Subject>) {
      return (data as List)
          .map((e) => deserialize<_ivpd2io6.Subject>(e))
          .toList() as T;
    }
    if (t == List<_isla0z1b.AttendanceRecord>) {
      return (data as List)
          .map((e) => deserialize<_isla0z1b.AttendanceRecord>(e))
          .toList() as T;
    }
    if (t == List<_i7h7jc2v.Community>) {
      return (data as List)
          .map((e) => deserialize<_i7h7jc2v.Community>(e))
          .toList() as T;
    }
    if (t == List<_ic55s9vl.CommunityPost>) {
      return (data as List)
          .map((e) => deserialize<_ic55s9vl.CommunityPost>(e))
          .toList() as T;
    }
    if (t == List<Map<String, dynamic>>) {
      return (data as List)
          .map((e) => deserialize<Map<String, dynamic>>(e))
          .toList() as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as T;
    }
    if (t == dynamic) {
      return deserializeDynamicFieldValue(data) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_imyicp44.ChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_imyicp44.ChatMessage>(e))
          .toList() as T;
    }
    if (t == List<_it7zfymm.CampusEvent>) {
      return (data as List)
          .map((e) => deserialize<_it7zfymm.CampusEvent>(e))
          .toList() as T;
    }
    if (t == List<_ip2o1nl0.PlayerRating>) {
      return (data as List)
          .map((e) => deserialize<_ip2o1nl0.PlayerRating>(e))
          .toList() as T;
    }
    if (t == List<_i4sq9vz0.RentalItem>) {
      return (data as List)
          .map((e) => deserialize<_i4sq9vz0.RentalItem>(e))
          .toList() as T;
    }
    if (t == List<_iio1natz.Resource>) {
      return (data as List)
          .map((e) => deserialize<_iio1natz.Resource>(e))
          .toList() as T;
    }
    if (t == List<_i2vl72e6.TimetableEntry>) {
      return (data as List)
          .map((e) => deserialize<_i2vl72e6.TimetableEntry>(e))
          .toList() as T;
    }
    if (t == List<_istykq5y.CalendarEvent>) {
      return (data as List)
          .map((e) => deserialize<_istykq5y.CalendarEvent>(e))
          .toList() as T;
    }
    try {
      return _i1n3uhu0.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _ihguhq0p.AbuseReport => 'AbuseReport',
      _io4i8do7.AttendanceLog => 'AttendanceLog',
      _ixvdsmvt.AttendanceRecord => 'AttendanceRecord',
      _ix7of1rp.Bookmark => 'Bookmark',
      _idbyazj1.Branch => 'Branch',
      _iv5qu3pv.BunkCalculationResult => 'BunkCalculationResult',
      _ix2r355r.CalendarEvent => 'CalendarEvent',
      _ieh998j0.CampusEvent => 'CampusEvent',
      _ivuncx2e.ChatMessage => 'ChatMessage',
      _i8tvpfpu.College => 'College',
      _i2q09qvg.Community => 'Community',
      _i4so5yx4.CommunityMember => 'CommunityMember',
      _itvhuiq9.CommunityPost => 'CommunityPost',
      _iz5lkuxs.ConnectionRequest => 'ConnectionRequest',
      _ineda879.Conversation => 'Conversation',
      _i27uzliw.EventRegistration => 'EventRegistration',
      _ibyn5m0u.PlayerRating => 'PlayerRating',
      _iqnkhz1e.QuizAnswer => 'QuizAnswer',
      _i1t0rvlk.QuizMatch => 'QuizMatch',
      _ib9ts4qi.QuizMatchPlayer => 'QuizMatchPlayer',
      _i6b38qpb.QuizQuestion => 'QuizQuestion',
      _iq77owbk.RentalItem => 'RentalItem',
      _icoj4fd8.RentalRequest => 'RentalRequest',
      _i2t2d2gw.Requirement => 'Requirement',
      _irrgqval.Resource => 'Resource',
      _i65peffv.ResourceComment => 'ResourceComment',
      _i4qv7on0.ResourceFollow => 'ResourceFollow',
      _im9fqx94.ResourceRating => 'ResourceRating',
      _ibhmj7lb.Section => 'Section',
      _iasteo6b.Subject => 'Subject',
      _i45m7rr0.TimetableEntry => 'TimetableEntry',
      _ir2mn8w1.UserProfile => 'UserProfile',
      _ => null
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('campuspulse.', '');
    }

    switch (data) {
      case _ihguhq0p.AbuseReport():
        return 'AbuseReport';
      case _io4i8do7.AttendanceLog():
        return 'AttendanceLog';
      case _ixvdsmvt.AttendanceRecord():
        return 'AttendanceRecord';
      case _ix7of1rp.Bookmark():
        return 'Bookmark';
      case _idbyazj1.Branch():
        return 'Branch';
      case _iv5qu3pv.BunkCalculationResult():
        return 'BunkCalculationResult';
      case _ix2r355r.CalendarEvent():
        return 'CalendarEvent';
      case _ieh998j0.CampusEvent():
        return 'CampusEvent';
      case _ivuncx2e.ChatMessage():
        return 'ChatMessage';
      case _i8tvpfpu.College():
        return 'College';
      case _i2q09qvg.Community():
        return 'Community';
      case _i4so5yx4.CommunityMember():
        return 'CommunityMember';
      case _itvhuiq9.CommunityPost():
        return 'CommunityPost';
      case _iz5lkuxs.ConnectionRequest():
        return 'ConnectionRequest';
      case _ineda879.Conversation():
        return 'Conversation';
      case _i27uzliw.EventRegistration():
        return 'EventRegistration';
      case _ibyn5m0u.PlayerRating():
        return 'PlayerRating';
      case _iqnkhz1e.QuizAnswer():
        return 'QuizAnswer';
      case _i1t0rvlk.QuizMatch():
        return 'QuizMatch';
      case _ib9ts4qi.QuizMatchPlayer():
        return 'QuizMatchPlayer';
      case _i6b38qpb.QuizQuestion():
        return 'QuizQuestion';
      case _iq77owbk.RentalItem():
        return 'RentalItem';
      case _icoj4fd8.RentalRequest():
        return 'RentalRequest';
      case _i2t2d2gw.Requirement():
        return 'Requirement';
      case _irrgqval.Resource():
        return 'Resource';
      case _i65peffv.ResourceComment():
        return 'ResourceComment';
      case _i4qv7on0.ResourceFollow():
        return 'ResourceFollow';
      case _im9fqx94.ResourceRating():
        return 'ResourceRating';
      case _ibhmj7lb.Section():
        return 'Section';
      case _iasteo6b.Subject():
        return 'Subject';
      case _i45m7rr0.TimetableEntry():
        return 'TimetableEntry';
      case _ir2mn8w1.UserProfile():
        return 'UserProfile';
    }
    className = _i1n3uhu0.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod_auth.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AbuseReport') {
      return deserialize<_ihguhq0p.AbuseReport>(data['data']);
    }
    if (dataClassName == 'AttendanceLog') {
      return deserialize<_io4i8do7.AttendanceLog>(data['data']);
    }
    if (dataClassName == 'AttendanceRecord') {
      return deserialize<_ixvdsmvt.AttendanceRecord>(data['data']);
    }
    if (dataClassName == 'Bookmark') {
      return deserialize<_ix7of1rp.Bookmark>(data['data']);
    }
    if (dataClassName == 'Branch') {
      return deserialize<_idbyazj1.Branch>(data['data']);
    }
    if (dataClassName == 'BunkCalculationResult') {
      return deserialize<_iv5qu3pv.BunkCalculationResult>(data['data']);
    }
    if (dataClassName == 'CalendarEvent') {
      return deserialize<_ix2r355r.CalendarEvent>(data['data']);
    }
    if (dataClassName == 'CampusEvent') {
      return deserialize<_ieh998j0.CampusEvent>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_ivuncx2e.ChatMessage>(data['data']);
    }
    if (dataClassName == 'College') {
      return deserialize<_i8tvpfpu.College>(data['data']);
    }
    if (dataClassName == 'Community') {
      return deserialize<_i2q09qvg.Community>(data['data']);
    }
    if (dataClassName == 'CommunityMember') {
      return deserialize<_i4so5yx4.CommunityMember>(data['data']);
    }
    if (dataClassName == 'CommunityPost') {
      return deserialize<_itvhuiq9.CommunityPost>(data['data']);
    }
    if (dataClassName == 'ConnectionRequest') {
      return deserialize<_iz5lkuxs.ConnectionRequest>(data['data']);
    }
    if (dataClassName == 'Conversation') {
      return deserialize<_ineda879.Conversation>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i27uzliw.EventRegistration>(data['data']);
    }
    if (dataClassName == 'PlayerRating') {
      return deserialize<_ibyn5m0u.PlayerRating>(data['data']);
    }
    if (dataClassName == 'QuizAnswer') {
      return deserialize<_iqnkhz1e.QuizAnswer>(data['data']);
    }
    if (dataClassName == 'QuizMatch') {
      return deserialize<_i1t0rvlk.QuizMatch>(data['data']);
    }
    if (dataClassName == 'QuizMatchPlayer') {
      return deserialize<_ib9ts4qi.QuizMatchPlayer>(data['data']);
    }
    if (dataClassName == 'QuizQuestion') {
      return deserialize<_i6b38qpb.QuizQuestion>(data['data']);
    }
    if (dataClassName == 'RentalItem') {
      return deserialize<_iq77owbk.RentalItem>(data['data']);
    }
    if (dataClassName == 'RentalRequest') {
      return deserialize<_icoj4fd8.RentalRequest>(data['data']);
    }
    if (dataClassName == 'Requirement') {
      return deserialize<_i2t2d2gw.Requirement>(data['data']);
    }
    if (dataClassName == 'Resource') {
      return deserialize<_irrgqval.Resource>(data['data']);
    }
    if (dataClassName == 'ResourceComment') {
      return deserialize<_i65peffv.ResourceComment>(data['data']);
    }
    if (dataClassName == 'ResourceFollow') {
      return deserialize<_i4qv7on0.ResourceFollow>(data['data']);
    }
    if (dataClassName == 'ResourceRating') {
      return deserialize<_im9fqx94.ResourceRating>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_ibhmj7lb.Section>(data['data']);
    }
    if (dataClassName == 'Subject') {
      return deserialize<_iasteo6b.Subject>(data['data']);
    }
    if (dataClassName == 'TimetableEntry') {
      return deserialize<_i45m7rr0.TimetableEntry>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_ir2mn8w1.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i1n3uhu0.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i1n3uhu0.Protocol().registerHostProtocol('campuspulse', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _i1n3uhu0.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _ihguhq0p.AbuseReport:
        return _ihguhq0p.AbuseReport.t;
      case _io4i8do7.AttendanceLog:
        return _io4i8do7.AttendanceLog.t;
      case _ixvdsmvt.AttendanceRecord:
        return _ixvdsmvt.AttendanceRecord.t;
      case _ix7of1rp.Bookmark:
        return _ix7of1rp.Bookmark.t;
      case _idbyazj1.Branch:
        return _idbyazj1.Branch.t;
      case _ix2r355r.CalendarEvent:
        return _ix2r355r.CalendarEvent.t;
      case _ieh998j0.CampusEvent:
        return _ieh998j0.CampusEvent.t;
      case _ivuncx2e.ChatMessage:
        return _ivuncx2e.ChatMessage.t;
      case _i8tvpfpu.College:
        return _i8tvpfpu.College.t;
      case _i2q09qvg.Community:
        return _i2q09qvg.Community.t;
      case _i4so5yx4.CommunityMember:
        return _i4so5yx4.CommunityMember.t;
      case _itvhuiq9.CommunityPost:
        return _itvhuiq9.CommunityPost.t;
      case _iz5lkuxs.ConnectionRequest:
        return _iz5lkuxs.ConnectionRequest.t;
      case _ineda879.Conversation:
        return _ineda879.Conversation.t;
      case _i27uzliw.EventRegistration:
        return _i27uzliw.EventRegistration.t;
      case _ibyn5m0u.PlayerRating:
        return _ibyn5m0u.PlayerRating.t;
      case _iqnkhz1e.QuizAnswer:
        return _iqnkhz1e.QuizAnswer.t;
      case _i1t0rvlk.QuizMatch:
        return _i1t0rvlk.QuizMatch.t;
      case _ib9ts4qi.QuizMatchPlayer:
        return _ib9ts4qi.QuizMatchPlayer.t;
      case _i6b38qpb.QuizQuestion:
        return _i6b38qpb.QuizQuestion.t;
      case _iq77owbk.RentalItem:
        return _iq77owbk.RentalItem.t;
      case _icoj4fd8.RentalRequest:
        return _icoj4fd8.RentalRequest.t;
      case _i2t2d2gw.Requirement:
        return _i2t2d2gw.Requirement.t;
      case _irrgqval.Resource:
        return _irrgqval.Resource.t;
      case _i65peffv.ResourceComment:
        return _i65peffv.ResourceComment.t;
      case _i4qv7on0.ResourceFollow:
        return _i4qv7on0.ResourceFollow.t;
      case _im9fqx94.ResourceRating:
        return _im9fqx94.ResourceRating.t;
      case _ibhmj7lb.Section:
        return _ibhmj7lb.Section.t;
      case _iasteo6b.Subject:
        return _iasteo6b.Subject.t;
      case _i45m7rr0.TimetableEntry:
        return _i45m7rr0.TimetableEntry.t;
      case _ir2mn8w1.UserProfile:
        return _ir2mn8w1.UserProfile.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'campuspulse';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i1n3uhu0.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
