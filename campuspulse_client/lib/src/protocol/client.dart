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
import 'dart:async' as _ida;
import 'package:campuspulse_client/src/protocol/attendance_record.dart'
    as _i8tmv26k;
import 'package:campuspulse_client/src/protocol/branch.dart' as _ie2pmynn;
import 'package:campuspulse_client/src/protocol/bunk_calculation_result.dart'
    as _ikqisjtv;
import 'package:campuspulse_client/src/protocol/calendar_event.dart'
    as _i96oornm;
import 'package:campuspulse_client/src/protocol/campus_event.dart' as _iamezi2k;
import 'package:campuspulse_client/src/protocol/chat_message.dart' as _ij2ifasq;
import 'package:campuspulse_client/src/protocol/college.dart' as _ivtpqn0b;
import 'package:campuspulse_client/src/protocol/community.dart' as _i575r194;
import 'package:campuspulse_client/src/protocol/community_post.dart'
    as _ia9y85df;
import 'package:campuspulse_client/src/protocol/connection_request.dart'
    as _i18kl1xx;
import 'package:campuspulse_client/src/protocol/player_rating.dart'
    as _iijgfoag;
import 'package:campuspulse_client/src/protocol/rental_item.dart' as _igpqqh6h;
import 'package:campuspulse_client/src/protocol/rental_request.dart'
    as _it9ddmqu;
import 'package:campuspulse_client/src/protocol/requirement.dart' as _ii0yi9t4;
import 'package:campuspulse_client/src/protocol/resource.dart' as _ibmkkwlh;
import 'package:campuspulse_client/src/protocol/resource_comment.dart'
    as _i840xdgd;
import 'package:campuspulse_client/src/protocol/resource_rating.dart'
    as _irodg3ps;
import 'package:campuspulse_client/src/protocol/section.dart' as _ivwclmi2;
import 'package:campuspulse_client/src/protocol/subject.dart' as _i6wxdhry;
import 'package:campuspulse_client/src/protocol/timetable_entry.dart'
    as _iahwaey6;
import 'package:campuspulse_client/src/protocol/user_profile.dart' as _ilrmg4uw;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i312scxx;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// {@category Endpoint}
class EndpointAcademic extends _isc.EndpointRef {
  EndpointAcademic(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'academic';

  _ida.Future<List<_ivtpqn0b.College>> getColleges() =>
      caller.callServerEndpoint<List<_ivtpqn0b.College>>(
        'academic',
        'getColleges',
        {},
      );

  _ida.Future<_ivtpqn0b.College> addCollege(_ivtpqn0b.College college) =>
      caller.callServerEndpoint<_ivtpqn0b.College>(
        'academic',
        'addCollege',
        {'college': college},
      );

  _ida.Future<List<_ie2pmynn.Branch>> getBranches(int collegeId) =>
      caller.callServerEndpoint<List<_ie2pmynn.Branch>>(
        'academic',
        'getBranches',
        {'collegeId': collegeId},
      );

  _ida.Future<List<_ivwclmi2.Section>> getSections(
    int branchId,
    int year,
  ) =>
      caller.callServerEndpoint<List<_ivwclmi2.Section>>(
        'academic',
        'getSections',
        {
          'branchId': branchId,
          'year': year,
        },
      );

  _ida.Future<List<_i6wxdhry.Subject>> getSubjects(
    int branchId,
    int semester,
  ) =>
      caller.callServerEndpoint<List<_i6wxdhry.Subject>>(
        'academic',
        'getSubjects',
        {
          'branchId': branchId,
          'semester': semester,
        },
      );
}

/// {@category Endpoint}
class EndpointAttendance extends _isc.EndpointRef {
  EndpointAttendance(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'attendance';

  /// Fetches all subject attendance records for the user.
  _ida.Future<List<_i8tmv26k.AttendanceRecord>> getUserAttendance(int userId) =>
      caller.callServerEndpoint<List<_i8tmv26k.AttendanceRecord>>(
        'attendance',
        'getUserAttendance',
        {'userId': userId},
      );

  /// Calculates Bunk stats for a given record.
  _ida.Future<_ikqisjtv.BunkCalculationResult> getBunkStats({
    int? subjectId,
    String? subjectName,
    required int attended,
    required int total,
    required double requiredPercentage,
    int? plannedTotal,
  }) =>
      caller.callServerEndpoint<_ikqisjtv.BunkCalculationResult>(
        'attendance',
        'getBunkStats',
        {
          'subjectId': subjectId,
          'subjectName': subjectName,
          'attended': attended,
          'total': total,
          'requiredPercentage': requiredPercentage,
          'plannedTotal': plannedTotal,
        },
      );

  /// Upserts user's attendance record for a subject.
  _ida.Future<_i8tmv26k.AttendanceRecord> upsertRecord(
          _i8tmv26k.AttendanceRecord record) =>
      caller.callServerEndpoint<_i8tmv26k.AttendanceRecord>(
        'attendance',
        'upsertRecord',
        {'record': record},
      );

  /// Quick "Mark Present / Mark Absent" for today's class.
  _ida.Future<_i8tmv26k.AttendanceRecord?> markTodayAttendance({
    required int userId,
    required int subjectId,
    required bool isPresent,
    required String source,
  }) =>
      caller.callServerEndpoint<_i8tmv26k.AttendanceRecord?>(
        'attendance',
        'markTodayAttendance',
        {
          'userId': userId,
          'subjectId': subjectId,
          'isPresent': isPresent,
          'source': source,
        },
      );
}

/// {@category Endpoint}
class EndpointCommunity extends _isc.EndpointRef {
  EndpointCommunity(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'community';

  /// Discover communities with optional search and category filters.
  _ida.Future<List<_i575r194.Community>> getCommunities({
    String? search,
    String? category,
  }) =>
      caller.callServerEndpoint<List<_i575r194.Community>>(
        'community',
        'getCommunities',
        {
          'search': search,
          'category': category,
        },
      );

  /// Create a community. Creator becomes admin member.
  _ida.Future<_i575r194.Community> createCommunity(
          _i575r194.Community community) =>
      caller.callServerEndpoint<_i575r194.Community>(
        'community',
        'createCommunity',
        {'community': community},
      );

  /// Join or leave community.
  _ida.Future<bool> toggleJoinCommunity({
    required int communityId,
    required int userId,
    required String userName,
  }) =>
      caller.callServerEndpoint<bool>(
        'community',
        'toggleJoinCommunity',
        {
          'communityId': communityId,
          'userId': userId,
          'userName': userName,
        },
      );

  /// Get feed of posts in community.
  _ida.Future<List<_ia9y85df.CommunityPost>> getCommunityPosts(
          int communityId) =>
      caller.callServerEndpoint<List<_ia9y85df.CommunityPost>>(
        'community',
        'getCommunityPosts',
        {'communityId': communityId},
      );

  /// Create a post in a community.
  _ida.Future<_ia9y85df.CommunityPost> createPost(
          _ia9y85df.CommunityPost post) =>
      caller.callServerEndpoint<_ia9y85df.CommunityPost>(
        'community',
        'createPost',
        {'post': post},
      );
}

/// {@category Endpoint}
class EndpointConnect extends _isc.EndpointRef {
  EndpointConnect(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'connect';

  /// Create a teammate/partner requirement.
  _ida.Future<_ii0yi9t4.Requirement> createRequirement(
          _ii0yi9t4.Requirement req) =>
      caller.callServerEndpoint<_ii0yi9t4.Requirement>(
        'connect',
        'createRequirement',
        {'req': req},
      );

  /// Get candidate matches ranked by MatchScorer score.
  _ida.Future<List<Map<String, dynamic>>> getRankedCandidates({
    required int currentUserId,
    required List<String> requiredSkills,
    required List<String> preferredSkills,
    required List<String> userInterests,
    required String userCollege,
    String? userBranch,
    int? userYear,
  }) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'connect',
        'getRankedCandidates',
        {
          'currentUserId': currentUserId,
          'requiredSkills': requiredSkills,
          'preferredSkills': preferredSkills,
          'userInterests': userInterests,
          'userCollege': userCollege,
          'userBranch': userBranch,
          'userYear': userYear,
        },
      );

  /// Send a connection request with a note.
  _ida.Future<_i18kl1xx.ConnectionRequest> sendRequest({
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
    required String note,
  }) =>
      caller.callServerEndpoint<_i18kl1xx.ConnectionRequest>(
        'connect',
        'sendRequest',
        {
          'senderId': senderId,
          'senderName': senderName,
          'receiverId': receiverId,
          'receiverName': receiverName,
          'note': note,
        },
      );

  /// Accept or reject connection request.
  _ida.Future<bool> respondToRequest({
    required int requestId,
    required int receiverId,
    required bool accept,
  }) =>
      caller.callServerEndpoint<bool>(
        'connect',
        'respondToRequest',
        {
          'requestId': requestId,
          'receiverId': receiverId,
          'accept': accept,
        },
      );

  /// Send chat message. Strict server-side enforcement: at most 3 messages before acceptance!
  _ida.Future<_ij2ifasq.ChatMessage> sendMessage({
    required int conversationId,
    required int senderId,
    required String senderName,
    required String content,
  }) =>
      caller.callServerEndpoint<_ij2ifasq.ChatMessage>(
        'connect',
        'sendMessage',
        {
          'conversationId': conversationId,
          'senderId': senderId,
          'senderName': senderName,
          'content': content,
        },
      );

  /// Get message history for conversation.
  _ida.Future<List<_ij2ifasq.ChatMessage>> getMessages(int conversationId) =>
      caller.callServerEndpoint<List<_ij2ifasq.ChatMessage>>(
        'connect',
        'getMessages',
        {'conversationId': conversationId},
      );
}

/// {@category Endpoint}
class EndpointEvent extends _isc.EndpointRef {
  EndpointEvent(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  /// Fetches event feed with interest-based or deadline ordering.
  _ida.Future<List<_iamezi2k.CampusEvent>> getEventFeed({
    int? collegeId,
    required int page,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_iamezi2k.CampusEvent>>(
        'event',
        'getEventFeed',
        {
          'collegeId': collegeId,
          'page': page,
          'limit': limit,
        },
      );

  /// Registers user for an event. One registration per user per event.
  _ida.Future<bool> registerForEvent({
    required int eventId,
    required int userId,
    required String userName,
    required String userEmail,
  }) =>
      caller.callServerEndpoint<bool>(
        'event',
        'registerForEvent',
        {
          'eventId': eventId,
          'userId': userId,
          'userName': userName,
          'userEmail': userEmail,
        },
      );

  /// Get events registered by user ("My Events").
  _ida.Future<List<_iamezi2k.CampusEvent>> getMyRegisteredEvents(int userId) =>
      caller.callServerEndpoint<List<_iamezi2k.CampusEvent>>(
        'event',
        'getMyRegisteredEvents',
        {'userId': userId},
      );

  /// Create new event (club admin or student with approval flag).
  _ida.Future<_iamezi2k.CampusEvent> createEvent(_iamezi2k.CampusEvent event) =>
      caller.callServerEndpoint<_iamezi2k.CampusEvent>(
        'event',
        'createEvent',
        {'event': event},
      );
}

/// Phase 0 sanity check endpoint.
/// {@category Endpoint}
class EndpointHello extends _isc.EndpointRef {
  EndpointHello(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'hello';

  _ida.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'hello',
        'hello',
        {'name': name},
      );

  _ida.Future<Map<String, dynamic>> healthCheck() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'hello',
        'healthCheck',
        {},
      );
}

/// {@category Endpoint}
class EndpointQuiz extends _isc.EndpointRef {
  EndpointQuiz(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  /// Start a quiz match (solo practice or 1v1 matchmaking).
  /// Returns match metadata and question prompt cards WITHOUT revealing correct answers!
  _ida.Future<Map<String, dynamic>> startMatch({
    required int userId,
    required String userName,
    required String mode,
    required String subject,
    required String difficulty,
    String? roomCode,
  }) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'quiz',
        'startMatch',
        {
          'userId': userId,
          'userName': userName,
          'mode': mode,
          'subject': subject,
          'difficulty': difficulty,
          'roomCode': roomCode,
        },
      );

  /// Submit answer for a question. Server validates correctness, awards points, and calculates speed bonus.
  _ida.Future<Map<String, dynamic>> submitAnswer({
    required int matchId,
    required int userId,
    required int questionId,
    required int selectedOptionIndex,
    required int timeTakenMs,
  }) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'quiz',
        'submitAnswer',
        {
          'matchId': matchId,
          'userId': userId,
          'questionId': questionId,
          'selectedOptionIndex': selectedOptionIndex,
          'timeTakenMs': timeTakenMs,
        },
      );

  /// Complete match and calculate new Elo rating.
  _ida.Future<Map<String, dynamic>> finishMatch({
    required int matchId,
    required int userId,
    required bool wonMatch,
  }) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'quiz',
        'finishMatch',
        {
          'matchId': matchId,
          'userId': userId,
          'wonMatch': wonMatch,
        },
      );

  /// Get leaderboards: (1) Overall College, (2) Same Year, (3) Same Branch.
  _ida.Future<List<_iijgfoag.PlayerRating>> getLeaderboard({
    int? collegeId,
    int? branchId,
    int? year,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_iijgfoag.PlayerRating>>(
        'quiz',
        'getLeaderboard',
        {
          'collegeId': collegeId,
          'branchId': branchId,
          'year': year,
          'limit': limit,
        },
      );
}

/// {@category Endpoint}
class EndpointRental extends _isc.EndpointRef {
  EndpointRental(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rental';

  /// Get available rental listings for the campus.
  _ida.Future<List<_igpqqh6h.RentalItem>> getRentalItems({
    int? collegeId,
    String? category,
  }) =>
      caller.callServerEndpoint<List<_igpqqh6h.RentalItem>>(
        'rental',
        'getRentalItems',
        {
          'collegeId': collegeId,
          'category': category,
        },
      );

  /// Create a new rental listing.
  _ida.Future<_igpqqh6h.RentalItem> createListing(_igpqqh6h.RentalItem item) =>
      caller.callServerEndpoint<_igpqqh6h.RentalItem>(
        'rental',
        'createListing',
        {'item': item},
      );

  /// Request to rent an item. Mandates consent agreement.
  _ida.Future<_it9ddmqu.RentalRequest> requestRental({
    required int itemId,
    required int renterId,
    required String renterName,
    required int ownerId,
    required bool consentAgreed,
    required DateTime startDate,
    required DateTime returnDueDate,
    required double totalRentAmount,
    required double depositHeld,
  }) =>
      caller.callServerEndpoint<_it9ddmqu.RentalRequest>(
        'rental',
        'requestRental',
        {
          'itemId': itemId,
          'renterId': renterId,
          'renterName': renterName,
          'ownerId': ownerId,
          'consentAgreed': consentAgreed,
          'startDate': startDate,
          'returnDueDate': returnDueDate,
          'totalRentAmount': totalRentAmount,
          'depositHeld': depositHeld,
        },
      );

  /// Owner approves or rejects rental request.
  _ida.Future<bool> respondRentalRequest({
    required int requestId,
    required int ownerId,
    required bool approve,
  }) =>
      caller.callServerEndpoint<bool>(
        'rental',
        'respondRentalRequest',
        {
          'requestId': requestId,
          'ownerId': ownerId,
          'approve': approve,
        },
      );

  /// Complete return of item.
  _ida.Future<bool> completeReturn({
    required int requestId,
    required String returnPhotosJson,
  }) =>
      caller.callServerEndpoint<bool>(
        'rental',
        'completeReturn',
        {
          'requestId': requestId,
          'returnPhotosJson': returnPhotosJson,
        },
      );
}

/// {@category Endpoint}
class EndpointResource extends _isc.EndpointRef {
  EndpointResource(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'resource';

  /// Fetches notes and resources with filters and sorting.
  _ida.Future<List<_ibmkkwlh.Resource>> getResources({
    int? branchId,
    int? year,
    int? semester,
    int? subjectId,
    String? resourceType,
    String? sortBy,
    required int page,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_ibmkkwlh.Resource>>(
        'resource',
        'getResources',
        {
          'branchId': branchId,
          'year': year,
          'semester': semester,
          'subjectId': subjectId,
          'resourceType': resourceType,
          'sortBy': sortBy,
          'page': page,
          'limit': limit,
        },
      );

  /// Get single resource by ID and increment views.
  _ida.Future<_ibmkkwlh.Resource?> getResourceById(int id) =>
      caller.callServerEndpoint<_ibmkkwlh.Resource?>(
        'resource',
        'getResourceById',
        {'id': id},
      );

  /// Upload a new resource.
  _ida.Future<_ibmkkwlh.Resource> uploadResource(_ibmkkwlh.Resource resource) =>
      caller.callServerEndpoint<_ibmkkwlh.Resource>(
        'resource',
        'uploadResource',
        {'resource': resource},
      );

  /// Rate a resource (1-5 stars). Uploader cannot rate own upload. Only 1 rating per user.
  _ida.Future<_irodg3ps.ResourceRating?> rateResource({
    required int resourceId,
    required int userId,
    required String userName,
    required int rating,
    String? review,
  }) =>
      caller.callServerEndpoint<_irodg3ps.ResourceRating?>(
        'resource',
        'rateResource',
        {
          'resourceId': resourceId,
          'userId': userId,
          'userName': userName,
          'rating': rating,
          'review': review,
        },
      );

  /// Add comment to a resource.
  _ida.Future<_i840xdgd.ResourceComment> addComment({
    required int resourceId,
    required int userId,
    required String userName,
    String? userAvatarUrl,
    required String content,
  }) =>
      caller.callServerEndpoint<_i840xdgd.ResourceComment>(
        'resource',
        'addComment',
        {
          'resourceId': resourceId,
          'userId': userId,
          'userName': userName,
          'userAvatarUrl': userAvatarUrl,
          'content': content,
        },
      );

  /// Delete own comment.
  _ida.Future<bool> deleteComment(
    int commentId,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'resource',
        'deleteComment',
        {
          'commentId': commentId,
          'userId': userId,
        },
      );

  /// Toggle follow / 'I followed this' counter.
  _ida.Future<bool> toggleFollow(
    int resourceId,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'resource',
        'toggleFollow',
        {
          'resourceId': resourceId,
          'userId': userId,
        },
      );

  /// Bookmark / save resource.
  _ida.Future<bool> toggleBookmark({
    required int userId,
    required String resourceType,
    required int targetId,
    required String title,
    String? subtitle,
  }) =>
      caller.callServerEndpoint<bool>(
        'resource',
        'toggleBookmark',
        {
          'userId': userId,
          'resourceType': resourceType,
          'targetId': targetId,
          'title': title,
          'subtitle': subtitle,
        },
      );

  /// Abuse reporting for resources and comments.
  _ida.Future<bool> reportAbuse({
    required int reporterUserId,
    required String reporterUserName,
    required String targetType,
    required int targetId,
    required String reason,
  }) =>
      caller.callServerEndpoint<bool>(
        'resource',
        'reportAbuse',
        {
          'reporterUserId': reporterUserId,
          'reporterUserName': reporterUserName,
          'targetType': targetType,
          'targetId': targetId,
          'reason': reason,
        },
      );
}

/// {@category Endpoint}
class EndpointSeed extends _isc.EndpointRef {
  EndpointSeed(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'seed';

  /// Populate complete realistic demo dataset for CampusPulse.
  _ida.Future<Map<String, dynamic>> seedDemoData() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'seed',
        'seedDemoData',
        {},
      );
}

/// {@category Endpoint}
class EndpointTimetable extends _isc.EndpointRef {
  EndpointTimetable(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'timetable';

  /// Fetches today's timetable for the user's section.
  /// [dayOfWeek]: 1 = Monday, 7 = Sunday. Defaults to current day of week.
  _ida.Future<List<_iahwaey6.TimetableEntry>> getTodaySchedule(
    int sectionId, {
    int? dayOfWeek,
  }) =>
      caller.callServerEndpoint<List<_iahwaey6.TimetableEntry>>(
        'timetable',
        'getTodaySchedule',
        {
          'sectionId': sectionId,
          'dayOfWeek': dayOfWeek,
        },
      );

  /// Fetches weekly timetable grid for user's section.
  _ida.Future<List<_iahwaey6.TimetableEntry>> getWeeklySchedule(
          int sectionId) =>
      caller.callServerEndpoint<List<_iahwaey6.TimetableEntry>>(
        'timetable',
        'getWeeklySchedule',
        {'sectionId': sectionId},
      );

  /// Fetches academic calendar events (exams, holidays, fests, deadlines).
  _ida.Future<List<_i96oornm.CalendarEvent>> getAcademicCalendar({
    int? collegeId,
    int? sectionId,
  }) =>
      caller.callServerEndpoint<List<_i96oornm.CalendarEvent>>(
        'timetable',
        'getAcademicCalendar',
        {
          'collegeId': collegeId,
          'sectionId': sectionId,
        },
      );

  /// CR/Admin can create timetable entry.
  _ida.Future<_iahwaey6.TimetableEntry> createTimetableEntry(
          _iahwaey6.TimetableEntry entry) =>
      caller.callServerEndpoint<_iahwaey6.TimetableEntry>(
        'timetable',
        'createTimetableEntry',
        {'entry': entry},
      );

  /// CR/Admin can create calendar event.
  _ida.Future<_i96oornm.CalendarEvent> createCalendarEvent(
          _i96oornm.CalendarEvent event) =>
      caller.callServerEndpoint<_i96oornm.CalendarEvent>(
        'timetable',
        'createCalendarEvent',
        {'event': event},
      );
}

/// {@category Endpoint}
class EndpointUserProfile extends _isc.EndpointRef {
  EndpointUserProfile(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfile';

  /// Fetches profile for a specific user.
  _ida.Future<_ilrmg4uw.UserProfile?> getProfile(int userId) =>
      caller.callServerEndpoint<_ilrmg4uw.UserProfile?>(
        'userProfile',
        'getProfile',
        {'userId': userId},
      );

  /// Fetches public profile representation.
  _ida.Future<_ilrmg4uw.UserProfile?> getPublicProfile(int userId) =>
      caller.callServerEndpoint<_ilrmg4uw.UserProfile?>(
        'userProfile',
        'getPublicProfile',
        {'userId': userId},
      );

  /// Updates profile details.
  _ida.Future<_ilrmg4uw.UserProfile> updateProfile(
          _ilrmg4uw.UserProfile profile) =>
      caller.callServerEndpoint<_ilrmg4uw.UserProfile>(
        'userProfile',
        'updateProfile',
        {'profile': profile},
      );

  /// Fast <60-second onboarding completion.
  _ida.Future<_ilrmg4uw.UserProfile> completeOnboarding({
    required int userInfoId,
    required String fullName,
    required String email,
    required int collegeId,
    required String collegeName,
    required int branchId,
    required String branchName,
    required int sectionId,
    required String sectionName,
    required int year,
    required int semester,
    required List<String> interests,
    required List<String> skills,
    String? bio,
    String? githubUrl,
    String? linkedinUrl,
    String? sgpaJson,
  }) =>
      caller.callServerEndpoint<_ilrmg4uw.UserProfile>(
        'userProfile',
        'completeOnboarding',
        {
          'userInfoId': userInfoId,
          'fullName': fullName,
          'email': email,
          'collegeId': collegeId,
          'collegeName': collegeName,
          'branchId': branchId,
          'branchName': branchName,
          'sectionId': sectionId,
          'sectionName': sectionName,
          'year': year,
          'semester': semester,
          'interests': interests,
          'skills': skills,
          'bio': bio,
          'githubUrl': githubUrl,
          'linkedinUrl': linkedinUrl,
          'sgpaJson': sgpaJson,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i312scxx.Caller(client);
  }

  late final _i312scxx.Caller auth;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
          host,
          _il2as5qe.Protocol(),
          securityContext: securityContext,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
          httpClientOverride: httpClientOverride,
        ) {
    academic = EndpointAcademic(this);
    attendance = EndpointAttendance(this);
    community = EndpointCommunity(this);
    connect = EndpointConnect(this);
    event = EndpointEvent(this);
    hello = EndpointHello(this);
    quiz = EndpointQuiz(this);
    rental = EndpointRental(this);
    resource = EndpointResource(this);
    seed = EndpointSeed(this);
    timetable = EndpointTimetable(this);
    userProfile = EndpointUserProfile(this);
    modules = Modules(this);
  }

  late final EndpointAcademic academic;

  late final EndpointAttendance attendance;

  late final EndpointCommunity community;

  late final EndpointConnect connect;

  late final EndpointEvent event;

  late final EndpointHello hello;

  late final EndpointQuiz quiz;

  late final EndpointRental rental;

  late final EndpointResource resource;

  late final EndpointSeed seed;

  late final EndpointTimetable timetable;

  late final EndpointUserProfile userProfile;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
        'academic': academic,
        'attendance': attendance,
        'community': community,
        'connect': connect,
        'event': event,
        'hello': hello,
        'quiz': quiz,
        'rental': rental,
        'resource': resource,
        'seed': seed,
        'timetable': timetable,
        'userProfile': userProfile,
      };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
