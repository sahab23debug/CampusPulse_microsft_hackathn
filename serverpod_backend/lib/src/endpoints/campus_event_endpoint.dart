import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Serverpod Endpoint managing campus events, role authorization,
/// capacity constraints, and live RSVP updates.
class CampusEventEndpoint extends Endpoint {
  /// Fetch all campus events with optional category filtering.
  Future<List<CampusEvent>> getEvents(Session session, {String? category}) async {
    session.log('CampusEventEndpoint: Querying events category=$category');

    final sampleEvents = [
      CampusEvent(
        eventId: 'evt_1',
        title: 'CS 189 Midterm Prep & Problem Jam',
        organizer: 'Prof. Sarah Martinez',
        organizerRole: 'Faculty Professor (EECS)',
        category: 'Study Sesh',
        dateStr: 'Tonight, 6:30 PM – 9:00 PM',
        location: 'Soda Hall - Wozniak Lounge',
        room: 'Room 430',
        description: 'Collaborative walk-through of previous exam questions on SVMs, kernel ridge regression, and loss gradient derivations. Whiteboard space and snacks provided!',
        imageUrl: './assets/images/library_study_hub_1792864911583.jpg',
        attendeesCount: 38,
        maxCapacity: 50,
        isRsvpd: true,
        isFeatured: true,
        isOfficial: true,
        tags: ['CS189', 'Exam Prep', 'Whiteboard', 'Snacks'],
        createdByUserId: 'usr_teacher_martinez',
      ),
      CampusEvent(
        eventId: 'evt_2',
        title: '48hr Campus Life Hackathon Sprint',
        organizer: 'Jordan Lee (Mobile Dev Guild)',
        organizerRole: 'Student Club President',
        category: 'Hackathon',
        dateStr: 'This Friday, 5:00 PM kickoff',
        location: 'Jacobs Hall Makerspace & Design Hall',
        room: 'Studio One',
        description: 'Build production-grade mobile web applications with Dart, Flutter, and Serverpod. Mentors will be on-site to assist teams throughout the weekend.',
        imageUrl: './assets/images/hackathon_team_jam_1792864909538.jpg',
        attendeesCount: 142,
        maxCapacity: 200,
        isRsvpd: false,
        isFeatured: true,
        isOfficial: false,
        tags: ['Dart', 'Flutter', '\$5k Prizes', 'Team Formation'],
        createdByUserId: 'usr_club_jordan',
      ),
      CampusEvent(
        eventId: 'evt_3',
        title: 'Sunset Acoustic Jam & Lawn Social',
        organizer: 'Campus Arts & Student Union',
        organizerRole: 'Student Club Head',
        category: 'Social',
        dateStr: 'Tomorrow, 5:30 PM – 8:00 PM',
        location: 'Memorial Glade North Lawn',
        room: 'Outdoor Amphitheater',
        description: 'Take a break from midterm grinding. Unwind with acoustic sets, artisan hot apple cider, lawn games, and meet fellow students across disciplines.',
        imageUrl: './assets/images/campus_event_concert_1792864910760.jpg',
        attendeesCount: 89,
        maxCapacity: 250,
        isRsvpd: false,
        isFeatured: false,
        isOfficial: false,
        tags: ['Live Music', 'Free Cider', 'Relaxation', 'Outdoor'],
        createdByUserId: 'usr_club_jordan',
      ),
      CampusEvent(
        eventId: 'evt_4',
        title: 'Operating Systems (CS 162) Threading Lab Clinic',
        organizer: 'Prof. Sarah Martinez & Tutors',
        organizerRole: 'Faculty Lead',
        category: 'Workshop',
        dateStr: 'Thursday, 3:00 PM – 5:00 PM',
        location: 'Cory Hall Systems Computing Lab',
        room: 'Lab 214',
        description: 'Hands-on debugging session for Pintos Project 1: Timer interrupts, priority scheduling, and synchronization primitives. Bring your laptops.',
        imageUrl: './assets/images/campus_quad_banner_1792864909368.jpg',
        attendeesCount: 24,
        maxCapacity: 35,
        isRsvpd: true,
        isFeatured: false,
        isOfficial: true,
        tags: ['CS162', 'Pintos', 'Concurrency', 'Code Clinic'],
        createdByUserId: 'usr_teacher_martinez',
      ),
    ];

    if (category != null && category.isNotEmpty && category != 'All') {
      return sampleEvents.where((e) => e.category == category).toList();
    }
    return sampleEvents;
  }

  /// Post a new campus event.
  /// ENFORCEMENT: Normal students are prohibited. Only 'teacher', 'club_head', or 'admin' may post.
  Future<CampusEvent> createEvent(
    Session session, {
    required String creatorRole,
    required String title,
    required String category,
    required String dateStr,
    required String location,
    String? room,
    required String description,
    required String imageUrl,
    int? maxCapacity,
    List<String>? tags,
  }) async {
    // Role Authorization Check
    final authorizedRoles = ['teacher', 'club_head', 'admin'];
    if (!authorizedRoles.contains(creatorRole.toLowerCase())) {
      throw ServerpodClientException(
        'Access Denied: Standard student accounts cannot publish campus events. Only Teachers, Student Club Heads, and Campus Admins possess publishing rights.',
        403,
      );
    }

    session.log('CampusEventEndpoint: Authorized event creation by role=$creatorRole: $title');

    final newEvent = CampusEvent(
      eventId: 'evt_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      organizer: creatorRole == 'teacher'
          ? 'Prof. Sarah Martinez'
          : creatorRole == 'club_head'
              ? 'Jordan Lee (Mobile Dev Guild)'
              : 'Dean Marcus Holloway',
      organizerRole: creatorRole == 'teacher'
          ? 'Faculty Professor (EECS)'
          : creatorRole == 'club_head'
              ? 'Student Club President'
              : 'Campus Administrator',
      category: category,
      dateStr: dateStr,
      location: location,
      room: room,
      description: description,
      imageUrl: imageUrl.isNotEmpty ? imageUrl : './assets/images/library_study_hub_1792864911583.jpg',
      attendeesCount: 1,
      maxCapacity: maxCapacity ?? 50,
      isRsvpd: true,
      isFeatured: false,
      isOfficial: creatorRole == 'teacher' || creatorRole == 'admin',
      tags: tags ?? ['CampusEvent'],
      createdByUserId: 'usr_creator',
    );

    // Broadcast live event creation to all connected Flutter clients
    session.messages.postMessage('campus_events_feed', {
      'action': 'event_created',
      'eventId': newEvent.eventId,
      'title': newEvent.title,
    });

    return newEvent;
  }

  /// RSVP toggle endpoint
  Future<bool> toggleRsvp(Session session, {required String eventId, required String userId}) async {
    session.log('User $userId toggled RSVP for event $eventId');
    session.messages.postMessage('campus_events_feed', {
      'action': 'rsvp_toggled',
      'eventId': eventId,
      'userId': userId,
    });
    return true;
  }
}
