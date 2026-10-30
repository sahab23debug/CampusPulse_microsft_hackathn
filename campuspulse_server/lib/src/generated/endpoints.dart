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
import 'package:campuspulse_server/src/generated/attendance_record.dart'
    as _isla0z1b;
import 'package:campuspulse_server/src/generated/calendar_event.dart'
    as _istykq5y;
import 'package:campuspulse_server/src/generated/campus_event.dart'
    as _it7zfymm;
import 'package:campuspulse_server/src/generated/college.dart' as _it3n4bfl;
import 'package:campuspulse_server/src/generated/community.dart' as _i7h7jc2v;
import 'package:campuspulse_server/src/generated/community_post.dart'
    as _ic55s9vl;
import 'package:campuspulse_server/src/generated/rental_item.dart' as _i4sq9vz0;
import 'package:campuspulse_server/src/generated/requirement.dart' as _imbc7ajp;
import 'package:campuspulse_server/src/generated/resource.dart' as _iio1natz;
import 'package:campuspulse_server/src/generated/timetable_entry.dart'
    as _i2vl72e6;
import 'package:campuspulse_server/src/generated/user_profile.dart'
    as _id91d1b0;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i1n3uhu0;
import '../endpoints/academic_endpoint.dart' as _i3lx874v;
import '../endpoints/attendance_endpoint.dart' as _ieghzlx7;
import '../endpoints/community_endpoint.dart' as _ijv9oep2;
import '../endpoints/connect_endpoint.dart' as _i34anjgf;
import '../endpoints/event_endpoint.dart' as _icw8lb6p;
import '../endpoints/hello_endpoint.dart' as _ibayjzda;
import '../endpoints/quiz_endpoint.dart' as _i7z0uw2a;
import '../endpoints/rental_endpoint.dart' as _i4usf3rt;
import '../endpoints/resource_endpoint.dart' as _i7u1ocs5;
import '../endpoints/seed_endpoint.dart' as _i8h1zywb;
import '../endpoints/timetable_endpoint.dart' as _in4fhk5u;
import '../endpoints/user_profile_endpoint.dart' as _i5r4pchv;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'academic': _i3lx874v.AcademicEndpoint()
        ..initialize(
          server,
          'academic',
          null,
        ),
      'attendance': _ieghzlx7.AttendanceEndpoint()
        ..initialize(
          server,
          'attendance',
          null,
        ),
      'community': _ijv9oep2.CommunityEndpoint()
        ..initialize(
          server,
          'community',
          null,
        ),
      'connect': _i34anjgf.ConnectEndpoint()
        ..initialize(
          server,
          'connect',
          null,
        ),
      'event': _icw8lb6p.EventEndpoint()
        ..initialize(
          server,
          'event',
          null,
        ),
      'hello': _ibayjzda.HelloEndpoint()
        ..initialize(
          server,
          'hello',
          null,
        ),
      'quiz': _i7z0uw2a.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
      'rental': _i4usf3rt.RentalEndpoint()
        ..initialize(
          server,
          'rental',
          null,
        ),
      'resource': _i7u1ocs5.ResourceEndpoint()
        ..initialize(
          server,
          'resource',
          null,
        ),
      'seed': _i8h1zywb.SeedEndpoint()
        ..initialize(
          server,
          'seed',
          null,
        ),
      'timetable': _in4fhk5u.TimetableEndpoint()
        ..initialize(
          server,
          'timetable',
          null,
        ),
      'userProfile': _i5r4pchv.UserProfileEndpoint()
        ..initialize(
          server,
          'userProfile',
          null,
        ),
    };
    connectors['academic'] = _is.EndpointConnector(
      name: 'academic',
      endpoint: endpoints['academic']!,
      methodConnectors: {
        'getColleges': _is.MethodConnector(
          name: 'getColleges',
          params: {},
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['academic'] as _i3lx874v.AcademicEndpoint)
                  .getColleges(session),
        ),
        'addCollege': _is.MethodConnector(
          name: 'addCollege',
          params: {
            'college': _is.ParameterDescription(
              name: 'college',
              type: _is.getType<_it3n4bfl.College>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['academic'] as _i3lx874v.AcademicEndpoint).addCollege(
            session,
            params['college'],
          ),
        ),
        'getBranches': _is.MethodConnector(
          name: 'getBranches',
          params: {
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['academic'] as _i3lx874v.AcademicEndpoint).getBranches(
            session,
            params['collegeId'],
          ),
        ),
        'getSections': _is.MethodConnector(
          name: 'getSections',
          params: {
            'branchId': _is.ParameterDescription(
              name: 'branchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'year': _is.ParameterDescription(
              name: 'year',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['academic'] as _i3lx874v.AcademicEndpoint).getSections(
            session,
            params['branchId'],
            params['year'],
          ),
        ),
        'getSubjects': _is.MethodConnector(
          name: 'getSubjects',
          params: {
            'branchId': _is.ParameterDescription(
              name: 'branchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'semester': _is.ParameterDescription(
              name: 'semester',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['academic'] as _i3lx874v.AcademicEndpoint).getSubjects(
            session,
            params['branchId'],
            params['semester'],
          ),
        ),
      },
    );
    connectors['attendance'] = _is.EndpointConnector(
      name: 'attendance',
      endpoint: endpoints['attendance']!,
      methodConnectors: {
        'getUserAttendance': _is.MethodConnector(
          name: 'getUserAttendance',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attendance'] as _ieghzlx7.AttendanceEndpoint)
                  .getUserAttendance(
            session,
            params['userId'],
          ),
        ),
        'getBunkStats': _is.MethodConnector(
          name: 'getBunkStats',
          params: {
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'subjectName': _is.ParameterDescription(
              name: 'subjectName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'attended': _is.ParameterDescription(
              name: 'attended',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'total': _is.ParameterDescription(
              name: 'total',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'requiredPercentage': _is.ParameterDescription(
              name: 'requiredPercentage',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'plannedTotal': _is.ParameterDescription(
              name: 'plannedTotal',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attendance'] as _ieghzlx7.AttendanceEndpoint)
                  .getBunkStats(
            session,
            subjectId: params['subjectId'],
            subjectName: params['subjectName'],
            attended: params['attended'],
            total: params['total'],
            requiredPercentage: params['requiredPercentage'],
            plannedTotal: params['plannedTotal'],
          ),
        ),
        'upsertRecord': _is.MethodConnector(
          name: 'upsertRecord',
          params: {
            'record': _is.ParameterDescription(
              name: 'record',
              type: _is.getType<_isla0z1b.AttendanceRecord>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attendance'] as _ieghzlx7.AttendanceEndpoint)
                  .upsertRecord(
            session,
            params['record'],
          ),
        ),
        'markTodayAttendance': _is.MethodConnector(
          name: 'markTodayAttendance',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'isPresent': _is.ParameterDescription(
              name: 'isPresent',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'source': _is.ParameterDescription(
              name: 'source',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['attendance'] as _ieghzlx7.AttendanceEndpoint)
                  .markTodayAttendance(
            session,
            userId: params['userId'],
            subjectId: params['subjectId'],
            isPresent: params['isPresent'],
            source: params['source'],
          ),
        ),
      },
    );
    connectors['community'] = _is.EndpointConnector(
      name: 'community',
      endpoint: endpoints['community']!,
      methodConnectors: {
        'getCommunities': _is.MethodConnector(
          name: 'getCommunities',
          params: {
            'search': _is.ParameterDescription(
              name: 'search',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['community'] as _ijv9oep2.CommunityEndpoint)
                  .getCommunities(
            session,
            search: params['search'],
            category: params['category'],
          ),
        ),
        'createCommunity': _is.MethodConnector(
          name: 'createCommunity',
          params: {
            'community': _is.ParameterDescription(
              name: 'community',
              type: _is.getType<_i7h7jc2v.Community>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['community'] as _ijv9oep2.CommunityEndpoint)
                  .createCommunity(
            session,
            params['community'],
          ),
        ),
        'toggleJoinCommunity': _is.MethodConnector(
          name: 'toggleJoinCommunity',
          params: {
            'communityId': _is.ParameterDescription(
              name: 'communityId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['community'] as _ijv9oep2.CommunityEndpoint)
                  .toggleJoinCommunity(
            session,
            communityId: params['communityId'],
            userId: params['userId'],
            userName: params['userName'],
          ),
        ),
        'getCommunityPosts': _is.MethodConnector(
          name: 'getCommunityPosts',
          params: {
            'communityId': _is.ParameterDescription(
              name: 'communityId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['community'] as _ijv9oep2.CommunityEndpoint)
                  .getCommunityPosts(
            session,
            params['communityId'],
          ),
        ),
        'createPost': _is.MethodConnector(
          name: 'createPost',
          params: {
            'post': _is.ParameterDescription(
              name: 'post',
              type: _is.getType<_ic55s9vl.CommunityPost>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['community'] as _ijv9oep2.CommunityEndpoint)
                  .createPost(
            session,
            params['post'],
          ),
        ),
      },
    );
    connectors['connect'] = _is.EndpointConnector(
      name: 'connect',
      endpoint: endpoints['connect']!,
      methodConnectors: {
        'createRequirement': _is.MethodConnector(
          name: 'createRequirement',
          params: {
            'req': _is.ParameterDescription(
              name: 'req',
              type: _is.getType<_imbc7ajp.Requirement>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint)
                  .createRequirement(
            session,
            params['req'],
          ),
        ),
        'getRankedCandidates': _is.MethodConnector(
          name: 'getRankedCandidates',
          params: {
            'currentUserId': _is.ParameterDescription(
              name: 'currentUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'requiredSkills': _is.ParameterDescription(
              name: 'requiredSkills',
              type: _is.getType<List<String>>(),
              nullable: false,
            ),
            'preferredSkills': _is.ParameterDescription(
              name: 'preferredSkills',
              type: _is.getType<List<String>>(),
              nullable: false,
            ),
            'userInterests': _is.ParameterDescription(
              name: 'userInterests',
              type: _is.getType<List<String>>(),
              nullable: false,
            ),
            'userCollege': _is.ParameterDescription(
              name: 'userCollege',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'userBranch': _is.ParameterDescription(
              name: 'userBranch',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'userYear': _is.ParameterDescription(
              name: 'userYear',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint)
                  .getRankedCandidates(
            session,
            currentUserId: params['currentUserId'],
            requiredSkills: params['requiredSkills'],
            preferredSkills: params['preferredSkills'],
            userInterests: params['userInterests'],
            userCollege: params['userCollege'],
            userBranch: params['userBranch'],
            userYear: params['userYear'],
          ),
        ),
        'sendRequest': _is.MethodConnector(
          name: 'sendRequest',
          params: {
            'senderId': _is.ParameterDescription(
              name: 'senderId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'senderName': _is.ParameterDescription(
              name: 'senderName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'receiverId': _is.ParameterDescription(
              name: 'receiverId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'receiverName': _is.ParameterDescription(
              name: 'receiverName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'note': _is.ParameterDescription(
              name: 'note',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint).sendRequest(
            session,
            senderId: params['senderId'],
            senderName: params['senderName'],
            receiverId: params['receiverId'],
            receiverName: params['receiverName'],
            note: params['note'],
          ),
        ),
        'respondToRequest': _is.MethodConnector(
          name: 'respondToRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'receiverId': _is.ParameterDescription(
              name: 'receiverId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'accept': _is.ParameterDescription(
              name: 'accept',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint)
                  .respondToRequest(
            session,
            requestId: params['requestId'],
            receiverId: params['receiverId'],
            accept: params['accept'],
          ),
        ),
        'sendMessage': _is.MethodConnector(
          name: 'sendMessage',
          params: {
            'conversationId': _is.ParameterDescription(
              name: 'conversationId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'senderId': _is.ParameterDescription(
              name: 'senderId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'senderName': _is.ParameterDescription(
              name: 'senderName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'content': _is.ParameterDescription(
              name: 'content',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint).sendMessage(
            session,
            conversationId: params['conversationId'],
            senderId: params['senderId'],
            senderName: params['senderName'],
            content: params['content'],
          ),
        ),
        'getMessages': _is.MethodConnector(
          name: 'getMessages',
          params: {
            'conversationId': _is.ParameterDescription(
              name: 'conversationId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['connect'] as _i34anjgf.ConnectEndpoint).getMessages(
            session,
            params['conversationId'],
          ),
        ),
      },
    );
    connectors['event'] = _is.EndpointConnector(
      name: 'event',
      endpoint: endpoints['event']!,
      methodConnectors: {
        'getEventFeed': _is.MethodConnector(
          name: 'getEventFeed',
          params: {
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).getEventFeed(
            session,
            collegeId: params['collegeId'],
            page: params['page'],
            limit: params['limit'],
          ),
        ),
        'registerForEvent': _is.MethodConnector(
          name: 'registerForEvent',
          params: {
            'eventId': _is.ParameterDescription(
              name: 'eventId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'userEmail': _is.ParameterDescription(
              name: 'userEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).registerForEvent(
            session,
            eventId: params['eventId'],
            userId: params['userId'],
            userName: params['userName'],
            userEmail: params['userEmail'],
          ),
        ),
        'getMyRegisteredEvents': _is.MethodConnector(
          name: 'getMyRegisteredEvents',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint)
                  .getMyRegisteredEvents(
            session,
            params['userId'],
          ),
        ),
        'createEvent': _is.MethodConnector(
          name: 'createEvent',
          params: {
            'event': _is.ParameterDescription(
              name: 'event',
              type: _is.getType<_it7zfymm.CampusEvent>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['event'] as _icw8lb6p.EventEndpoint).createEvent(
            session,
            params['event'],
          ),
        ),
      },
    );
    connectors['hello'] = _is.EndpointConnector(
      name: 'hello',
      endpoint: endpoints['hello']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hello'] as _ibayjzda.HelloEndpoint).hello(
            session,
            params['name'],
          ),
        ),
        'healthCheck': _is.MethodConnector(
          name: 'healthCheck',
          params: {},
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hello'] as _ibayjzda.HelloEndpoint)
                  .healthCheck(session),
        ),
      },
    );
    connectors['quiz'] = _is.EndpointConnector(
      name: 'quiz',
      endpoint: endpoints['quiz']!,
      methodConnectors: {
        'startMatch': _is.MethodConnector(
          name: 'startMatch',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'mode': _is.ParameterDescription(
              name: 'mode',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'subject': _is.ParameterDescription(
              name: 'subject',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'difficulty': _is.ParameterDescription(
              name: 'difficulty',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'roomCode': _is.ParameterDescription(
              name: 'roomCode',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7z0uw2a.QuizEndpoint).startMatch(
            session,
            userId: params['userId'],
            userName: params['userName'],
            mode: params['mode'],
            subject: params['subject'],
            difficulty: params['difficulty'],
            roomCode: params['roomCode'],
          ),
        ),
        'submitAnswer': _is.MethodConnector(
          name: 'submitAnswer',
          params: {
            'matchId': _is.ParameterDescription(
              name: 'matchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'questionId': _is.ParameterDescription(
              name: 'questionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'selectedOptionIndex': _is.ParameterDescription(
              name: 'selectedOptionIndex',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'timeTakenMs': _is.ParameterDescription(
              name: 'timeTakenMs',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7z0uw2a.QuizEndpoint).submitAnswer(
            session,
            matchId: params['matchId'],
            userId: params['userId'],
            questionId: params['questionId'],
            selectedOptionIndex: params['selectedOptionIndex'],
            timeTakenMs: params['timeTakenMs'],
          ),
        ),
        'finishMatch': _is.MethodConnector(
          name: 'finishMatch',
          params: {
            'matchId': _is.ParameterDescription(
              name: 'matchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'wonMatch': _is.ParameterDescription(
              name: 'wonMatch',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7z0uw2a.QuizEndpoint).finishMatch(
            session,
            matchId: params['matchId'],
            userId: params['userId'],
            wonMatch: params['wonMatch'],
          ),
        ),
        'getLeaderboard': _is.MethodConnector(
          name: 'getLeaderboard',
          params: {
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'branchId': _is.ParameterDescription(
              name: 'branchId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'year': _is.ParameterDescription(
              name: 'year',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7z0uw2a.QuizEndpoint).getLeaderboard(
            session,
            collegeId: params['collegeId'],
            branchId: params['branchId'],
            year: params['year'],
            limit: params['limit'],
          ),
        ),
      },
    );
    connectors['rental'] = _is.EndpointConnector(
      name: 'rental',
      endpoint: endpoints['rental']!,
      methodConnectors: {
        'getRentalItems': _is.MethodConnector(
          name: 'getRentalItems',
          params: {
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i4usf3rt.RentalEndpoint).getRentalItems(
            session,
            collegeId: params['collegeId'],
            category: params['category'],
          ),
        ),
        'createListing': _is.MethodConnector(
          name: 'createListing',
          params: {
            'item': _is.ParameterDescription(
              name: 'item',
              type: _is.getType<_i4sq9vz0.RentalItem>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i4usf3rt.RentalEndpoint).createListing(
            session,
            params['item'],
          ),
        ),
        'requestRental': _is.MethodConnector(
          name: 'requestRental',
          params: {
            'itemId': _is.ParameterDescription(
              name: 'itemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'renterId': _is.ParameterDescription(
              name: 'renterId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'renterName': _is.ParameterDescription(
              name: 'renterName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'consentAgreed': _is.ParameterDescription(
              name: 'consentAgreed',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'startDate': _is.ParameterDescription(
              name: 'startDate',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'returnDueDate': _is.ParameterDescription(
              name: 'returnDueDate',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'totalRentAmount': _is.ParameterDescription(
              name: 'totalRentAmount',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'depositHeld': _is.ParameterDescription(
              name: 'depositHeld',
              type: _is.getType<double>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i4usf3rt.RentalEndpoint).requestRental(
            session,
            itemId: params['itemId'],
            renterId: params['renterId'],
            renterName: params['renterName'],
            ownerId: params['ownerId'],
            consentAgreed: params['consentAgreed'],
            startDate: params['startDate'],
            returnDueDate: params['returnDueDate'],
            totalRentAmount: params['totalRentAmount'],
            depositHeld: params['depositHeld'],
          ),
        ),
        'respondRentalRequest': _is.MethodConnector(
          name: 'respondRentalRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'ownerId': _is.ParameterDescription(
              name: 'ownerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'approve': _is.ParameterDescription(
              name: 'approve',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i4usf3rt.RentalEndpoint)
                  .respondRentalRequest(
            session,
            requestId: params['requestId'],
            ownerId: params['ownerId'],
            approve: params['approve'],
          ),
        ),
        'completeReturn': _is.MethodConnector(
          name: 'completeReturn',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'returnPhotosJson': _is.ParameterDescription(
              name: 'returnPhotosJson',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i4usf3rt.RentalEndpoint).completeReturn(
            session,
            requestId: params['requestId'],
            returnPhotosJson: params['returnPhotosJson'],
          ),
        ),
      },
    );
    connectors['resource'] = _is.EndpointConnector(
      name: 'resource',
      endpoint: endpoints['resource']!,
      methodConnectors: {
        'getResources': _is.MethodConnector(
          name: 'getResources',
          params: {
            'branchId': _is.ParameterDescription(
              name: 'branchId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'year': _is.ParameterDescription(
              name: 'year',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'semester': _is.ParameterDescription(
              name: 'semester',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'resourceType': _is.ParameterDescription(
              name: 'resourceType',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'sortBy': _is.ParameterDescription(
              name: 'sortBy',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .getResources(
            session,
            branchId: params['branchId'],
            year: params['year'],
            semester: params['semester'],
            subjectId: params['subjectId'],
            resourceType: params['resourceType'],
            sortBy: params['sortBy'],
            page: params['page'],
            limit: params['limit'],
          ),
        ),
        'getResourceById': _is.MethodConnector(
          name: 'getResourceById',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .getResourceById(
            session,
            params['id'],
          ),
        ),
        'uploadResource': _is.MethodConnector(
          name: 'uploadResource',
          params: {
            'resource': _is.ParameterDescription(
              name: 'resource',
              type: _is.getType<_iio1natz.Resource>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .uploadResource(
            session,
            params['resource'],
          ),
        ),
        'rateResource': _is.MethodConnector(
          name: 'rateResource',
          params: {
            'resourceId': _is.ParameterDescription(
              name: 'resourceId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'rating': _is.ParameterDescription(
              name: 'rating',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'review': _is.ParameterDescription(
              name: 'review',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .rateResource(
            session,
            resourceId: params['resourceId'],
            userId: params['userId'],
            userName: params['userName'],
            rating: params['rating'],
            review: params['review'],
          ),
        ),
        'addComment': _is.MethodConnector(
          name: 'addComment',
          params: {
            'resourceId': _is.ParameterDescription(
              name: 'resourceId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userName': _is.ParameterDescription(
              name: 'userName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'userAvatarUrl': _is.ParameterDescription(
              name: 'userAvatarUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'content': _is.ParameterDescription(
              name: 'content',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint).addComment(
            session,
            resourceId: params['resourceId'],
            userId: params['userId'],
            userName: params['userName'],
            userAvatarUrl: params['userAvatarUrl'],
            content: params['content'],
          ),
        ),
        'deleteComment': _is.MethodConnector(
          name: 'deleteComment',
          params: {
            'commentId': _is.ParameterDescription(
              name: 'commentId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .deleteComment(
            session,
            params['commentId'],
            params['userId'],
          ),
        ),
        'toggleFollow': _is.MethodConnector(
          name: 'toggleFollow',
          params: {
            'resourceId': _is.ParameterDescription(
              name: 'resourceId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .toggleFollow(
            session,
            params['resourceId'],
            params['userId'],
          ),
        ),
        'toggleBookmark': _is.MethodConnector(
          name: 'toggleBookmark',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'resourceType': _is.ParameterDescription(
              name: 'resourceType',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'targetId': _is.ParameterDescription(
              name: 'targetId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'subtitle': _is.ParameterDescription(
              name: 'subtitle',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint)
                  .toggleBookmark(
            session,
            userId: params['userId'],
            resourceType: params['resourceType'],
            targetId: params['targetId'],
            title: params['title'],
            subtitle: params['subtitle'],
          ),
        ),
        'reportAbuse': _is.MethodConnector(
          name: 'reportAbuse',
          params: {
            'reporterUserId': _is.ParameterDescription(
              name: 'reporterUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reporterUserName': _is.ParameterDescription(
              name: 'reporterUserName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'targetType': _is.ParameterDescription(
              name: 'targetType',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'targetId': _is.ParameterDescription(
              name: 'targetId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['resource'] as _i7u1ocs5.ResourceEndpoint).reportAbuse(
            session,
            reporterUserId: params['reporterUserId'],
            reporterUserName: params['reporterUserName'],
            targetType: params['targetType'],
            targetId: params['targetId'],
            reason: params['reason'],
          ),
        ),
      },
    );
    connectors['seed'] = _is.EndpointConnector(
      name: 'seed',
      endpoint: endpoints['seed']!,
      methodConnectors: {
        'seedDemoData': _is.MethodConnector(
          name: 'seedDemoData',
          params: {},
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['seed'] as _i8h1zywb.SeedEndpoint)
                  .seedDemoData(session),
        )
      },
    );
    connectors['timetable'] = _is.EndpointConnector(
      name: 'timetable',
      endpoint: endpoints['timetable']!,
      methodConnectors: {
        'getTodaySchedule': _is.MethodConnector(
          name: 'getTodaySchedule',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'dayOfWeek': _is.ParameterDescription(
              name: 'dayOfWeek',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['timetable'] as _in4fhk5u.TimetableEndpoint)
                  .getTodaySchedule(
            session,
            params['sectionId'],
            dayOfWeek: params['dayOfWeek'],
          ),
        ),
        'getWeeklySchedule': _is.MethodConnector(
          name: 'getWeeklySchedule',
          params: {
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['timetable'] as _in4fhk5u.TimetableEndpoint)
                  .getWeeklySchedule(
            session,
            params['sectionId'],
          ),
        ),
        'getAcademicCalendar': _is.MethodConnector(
          name: 'getAcademicCalendar',
          params: {
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['timetable'] as _in4fhk5u.TimetableEndpoint)
                  .getAcademicCalendar(
            session,
            collegeId: params['collegeId'],
            sectionId: params['sectionId'],
          ),
        ),
        'createTimetableEntry': _is.MethodConnector(
          name: 'createTimetableEntry',
          params: {
            'entry': _is.ParameterDescription(
              name: 'entry',
              type: _is.getType<_i2vl72e6.TimetableEntry>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['timetable'] as _in4fhk5u.TimetableEndpoint)
                  .createTimetableEntry(
            session,
            params['entry'],
          ),
        ),
        'createCalendarEvent': _is.MethodConnector(
          name: 'createCalendarEvent',
          params: {
            'event': _is.ParameterDescription(
              name: 'event',
              type: _is.getType<_istykq5y.CalendarEvent>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['timetable'] as _in4fhk5u.TimetableEndpoint)
                  .createCalendarEvent(
            session,
            params['event'],
          ),
        ),
      },
    );
    connectors['userProfile'] = _is.EndpointConnector(
      name: 'userProfile',
      endpoint: endpoints['userProfile']!,
      methodConnectors: {
        'getProfile': _is.MethodConnector(
          name: 'getProfile',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .getProfile(
            session,
            params['userId'],
          ),
        ),
        'getPublicProfile': _is.MethodConnector(
          name: 'getPublicProfile',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .getPublicProfile(
            session,
            params['userId'],
          ),
        ),
        'updateProfile': _is.MethodConnector(
          name: 'updateProfile',
          params: {
            'profile': _is.ParameterDescription(
              name: 'profile',
              type: _is.getType<_id91d1b0.UserProfile>(),
              nullable: false,
            )
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .updateProfile(
            session,
            params['profile'],
          ),
        ),
        'completeOnboarding': _is.MethodConnector(
          name: 'completeOnboarding',
          params: {
            'userInfoId': _is.ParameterDescription(
              name: 'userInfoId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'collegeId': _is.ParameterDescription(
              name: 'collegeId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'collegeName': _is.ParameterDescription(
              name: 'collegeName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'branchId': _is.ParameterDescription(
              name: 'branchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'branchName': _is.ParameterDescription(
              name: 'branchName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'sectionId': _is.ParameterDescription(
              name: 'sectionId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'sectionName': _is.ParameterDescription(
              name: 'sectionName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'year': _is.ParameterDescription(
              name: 'year',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'semester': _is.ParameterDescription(
              name: 'semester',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'interests': _is.ParameterDescription(
              name: 'interests',
              type: _is.getType<List<String>>(),
              nullable: false,
            ),
            'skills': _is.ParameterDescription(
              name: 'skills',
              type: _is.getType<List<String>>(),
              nullable: false,
            ),
            'bio': _is.ParameterDescription(
              name: 'bio',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'githubUrl': _is.ParameterDescription(
              name: 'githubUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'linkedinUrl': _is.ParameterDescription(
              name: 'linkedinUrl',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'sgpaJson': _is.ParameterDescription(
              name: 'sgpaJson',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i5r4pchv.UserProfileEndpoint)
                  .completeOnboarding(
            session,
            userInfoId: params['userInfoId'],
            fullName: params['fullName'],
            email: params['email'],
            collegeId: params['collegeId'],
            collegeName: params['collegeName'],
            branchId: params['branchId'],
            branchName: params['branchName'],
            sectionId: params['sectionId'],
            sectionName: params['sectionName'],
            year: params['year'],
            semester: params['semester'],
            interests: params['interests'],
            skills: params['skills'],
            bio: params['bio'],
            githubUrl: params['githubUrl'],
            linkedinUrl: params['linkedinUrl'],
            sgpaJson: params['sgpaJson'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i1n3uhu0.Endpoints()
      ..initializeEndpoints(server);
  }
}
