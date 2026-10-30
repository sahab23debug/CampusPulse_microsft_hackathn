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
import 'package:campuspulse_client/src/protocol/attendance_record.dart'
    as _i8tmv26k;
import 'package:campuspulse_client/src/protocol/branch.dart' as _ie2pmynn;
import 'package:campuspulse_client/src/protocol/calendar_event.dart'
    as _i96oornm;
import 'package:campuspulse_client/src/protocol/campus_event.dart' as _iamezi2k;
import 'package:campuspulse_client/src/protocol/chat_message.dart' as _ij2ifasq;
import 'package:campuspulse_client/src/protocol/college.dart' as _ivtpqn0b;
import 'package:campuspulse_client/src/protocol/community.dart' as _i575r194;
import 'package:campuspulse_client/src/protocol/community_post.dart'
    as _ia9y85df;
import 'package:campuspulse_client/src/protocol/player_rating.dart'
    as _iijgfoag;
import 'package:campuspulse_client/src/protocol/rental_item.dart' as _igpqqh6h;
import 'package:campuspulse_client/src/protocol/resource.dart' as _ibmkkwlh;
import 'package:campuspulse_client/src/protocol/section.dart' as _ivwclmi2;
import 'package:campuspulse_client/src/protocol/subject.dart' as _i6wxdhry;
import 'package:campuspulse_client/src/protocol/timetable_entry.dart'
    as _iahwaey6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i312scxx;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
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
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

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
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _isc.getType<_ihguhq0p.AbuseReport?>()) {
      return (data != null ? _ihguhq0p.AbuseReport.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_io4i8do7.AttendanceLog?>()) {
      return (data != null ? _io4i8do7.AttendanceLog.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ixvdsmvt.AttendanceRecord?>()) {
      return (data != null ? _ixvdsmvt.AttendanceRecord.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ix7of1rp.Bookmark?>()) {
      return (data != null ? _ix7of1rp.Bookmark.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_idbyazj1.Branch?>()) {
      return (data != null ? _idbyazj1.Branch.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iv5qu3pv.BunkCalculationResult?>()) {
      return (data != null
          ? _iv5qu3pv.BunkCalculationResult.fromJson(data)
          : null) as T;
    }
    if (t == _isc.getType<_ix2r355r.CalendarEvent?>()) {
      return (data != null ? _ix2r355r.CalendarEvent.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ieh998j0.CampusEvent?>()) {
      return (data != null ? _ieh998j0.CampusEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ivuncx2e.ChatMessage?>()) {
      return (data != null ? _ivuncx2e.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8tvpfpu.College?>()) {
      return (data != null ? _i8tvpfpu.College.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2q09qvg.Community?>()) {
      return (data != null ? _i2q09qvg.Community.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i4so5yx4.CommunityMember?>()) {
      return (data != null ? _i4so5yx4.CommunityMember.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_itvhuiq9.CommunityPost?>()) {
      return (data != null ? _itvhuiq9.CommunityPost.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iz5lkuxs.ConnectionRequest?>()) {
      return (data != null ? _iz5lkuxs.ConnectionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ineda879.Conversation?>()) {
      return (data != null ? _ineda879.Conversation.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i27uzliw.EventRegistration?>()) {
      return (data != null ? _i27uzliw.EventRegistration.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ibyn5m0u.PlayerRating?>()) {
      return (data != null ? _ibyn5m0u.PlayerRating.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iqnkhz1e.QuizAnswer?>()) {
      return (data != null ? _iqnkhz1e.QuizAnswer.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i1t0rvlk.QuizMatch?>()) {
      return (data != null ? _i1t0rvlk.QuizMatch.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ib9ts4qi.QuizMatchPlayer?>()) {
      return (data != null ? _ib9ts4qi.QuizMatchPlayer.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i6b38qpb.QuizQuestion?>()) {
      return (data != null ? _i6b38qpb.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iq77owbk.RentalItem?>()) {
      return (data != null ? _iq77owbk.RentalItem.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_icoj4fd8.RentalRequest?>()) {
      return (data != null ? _icoj4fd8.RentalRequest.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2t2d2gw.Requirement?>()) {
      return (data != null ? _i2t2d2gw.Requirement.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_irrgqval.Resource?>()) {
      return (data != null ? _irrgqval.Resource.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i65peffv.ResourceComment?>()) {
      return (data != null ? _i65peffv.ResourceComment.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i4qv7on0.ResourceFollow?>()) {
      return (data != null ? _i4qv7on0.ResourceFollow.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_im9fqx94.ResourceRating?>()) {
      return (data != null ? _im9fqx94.ResourceRating.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ibhmj7lb.Section?>()) {
      return (data != null ? _ibhmj7lb.Section.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iasteo6b.Subject?>()) {
      return (data != null ? _iasteo6b.Subject.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i45m7rr0.TimetableEntry?>()) {
      return (data != null ? _i45m7rr0.TimetableEntry.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ir2mn8w1.UserProfile?>()) {
      return (data != null ? _ir2mn8w1.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _isc.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_ivtpqn0b.College>) {
      return (data as List)
          .map((e) => deserialize<_ivtpqn0b.College>(e))
          .toList() as T;
    }
    if (t == List<_ie2pmynn.Branch>) {
      return (data as List)
          .map((e) => deserialize<_ie2pmynn.Branch>(e))
          .toList() as T;
    }
    if (t == List<_ivwclmi2.Section>) {
      return (data as List)
          .map((e) => deserialize<_ivwclmi2.Section>(e))
          .toList() as T;
    }
    if (t == List<_i6wxdhry.Subject>) {
      return (data as List)
          .map((e) => deserialize<_i6wxdhry.Subject>(e))
          .toList() as T;
    }
    if (t == List<_i8tmv26k.AttendanceRecord>) {
      return (data as List)
          .map((e) => deserialize<_i8tmv26k.AttendanceRecord>(e))
          .toList() as T;
    }
    if (t == List<_i575r194.Community>) {
      return (data as List)
          .map((e) => deserialize<_i575r194.Community>(e))
          .toList() as T;
    }
    if (t == List<_ia9y85df.CommunityPost>) {
      return (data as List)
          .map((e) => deserialize<_ia9y85df.CommunityPost>(e))
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
    if (t == List<_ij2ifasq.ChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_ij2ifasq.ChatMessage>(e))
          .toList() as T;
    }
    if (t == List<_iamezi2k.CampusEvent>) {
      return (data as List)
          .map((e) => deserialize<_iamezi2k.CampusEvent>(e))
          .toList() as T;
    }
    if (t == List<_iijgfoag.PlayerRating>) {
      return (data as List)
          .map((e) => deserialize<_iijgfoag.PlayerRating>(e))
          .toList() as T;
    }
    if (t == List<_igpqqh6h.RentalItem>) {
      return (data as List)
          .map((e) => deserialize<_igpqqh6h.RentalItem>(e))
          .toList() as T;
    }
    if (t == List<_ibmkkwlh.Resource>) {
      return (data as List)
          .map((e) => deserialize<_ibmkkwlh.Resource>(e))
          .toList() as T;
    }
    if (t == List<_iahwaey6.TimetableEntry>) {
      return (data as List)
          .map((e) => deserialize<_iahwaey6.TimetableEntry>(e))
          .toList() as T;
    }
    if (t == List<_i96oornm.CalendarEvent>) {
      return (data as List)
          .map((e) => deserialize<_i96oornm.CalendarEvent>(e))
          .toList() as T;
    }
    try {
      return _i312scxx.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
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
    className = _i312scxx.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod_auth.$className';
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
      return _i312scxx.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i312scxx.Protocol().registerHostProtocol('campuspulse', this);
  }

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
      return _i312scxx.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
