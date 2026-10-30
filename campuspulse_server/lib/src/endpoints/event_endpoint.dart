import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class EventEndpoint extends Endpoint {
  /// Fetches event feed with interest-based or deadline ordering.
  Future<List<CampusEvent>> getEventFeed(
    Session session, {
    int? collegeId,
    int page = 0,
    int limit = 20,
  }) async {
    return await CampusEvent.db.find(
      session,
      where: (t) {
        var expr = t.isApproved.equals(true);
        if (collegeId != null) expr = expr & t.collegeId.equals(collegeId);
        return expr;
      },
      orderBy: (t) => t.registrationDeadline,
      limit: limit,
      offset: page * limit,
    );
  }

  /// Registers user for an event. One registration per user per event.
  Future<bool> registerForEvent(
    Session session, {
    required int eventId,
    required int userId,
    required String userName,
    required String userEmail,
  }) async {
    final event = await CampusEvent.db.findById(session, eventId);
    if (event == null) return false;

    // Check deadline
    if (event.registrationDeadline.isBefore(DateTime.now())) {
      throw Exception('Registration is closed for this event.');
    }

    final existing = await EventRegistration.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(eventId) & t.userId.equals(userId),
    );

    if (existing != null) {
      return true; // Already registered
    }

    await EventRegistration.db.insertRow(
      session,
      EventRegistration(
        eventId: eventId,
        userId: userId,
        userName: userName,
        userEmail: userEmail,
        registeredAt: DateTime.now(),
      ),
    );

    event.registrationCount += 1;
    await CampusEvent.db.updateRow(session, event);
    return true;
  }

  /// Get events registered by user ("My Events").
  Future<List<CampusEvent>> getMyRegisteredEvents(Session session, int userId) async {
    final registrations = await EventRegistration.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final eventIds = registrations.map((r) => r.eventId).toList();
    if (eventIds.isEmpty) return [];

    return await CampusEvent.db.find(
      session,
      where: (t) => t.id.inSet(eventIds.toSet()),
      orderBy: (t) => t.eventDate,
    );
  }

  /// Create new event (club admin or student with approval flag).
  Future<CampusEvent> createEvent(Session session, CampusEvent event) async {
    return await CampusEvent.db.insertRow(session, event);
  }
}
