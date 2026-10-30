import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class TimetableEndpoint extends Endpoint {
  /// Fetches today's timetable for the user's section.
  /// [dayOfWeek]: 1 = Monday, 7 = Sunday. Defaults to current day of week.
  Future<List<TimetableEntry>> getTodaySchedule(
    Session session,
    int sectionId, {
    int? dayOfWeek,
  }) async {
    final day = dayOfWeek ?? DateTime.now().weekday;
    return await TimetableEntry.db.find(
      session,
      where: (t) => t.sectionId.equals(sectionId) & t.dayOfWeek.equals(day),
      orderBy: (t) => t.startTime,
    );
  }

  /// Fetches weekly timetable grid for user's section.
  Future<List<TimetableEntry>> getWeeklySchedule(Session session, int sectionId) async {
    return await TimetableEntry.db.find(
      session,
      where: (t) => t.sectionId.equals(sectionId),
      orderBy: (t) => t.startTime,
    );
  }

  /// Fetches academic calendar events (exams, holidays, fests, deadlines).
  Future<List<CalendarEvent>> getAcademicCalendar(
    Session session, {
    int? collegeId,
    int? sectionId,
  }) async {
    return await CalendarEvent.db.find(
      session,
      where: (t) {
        var expr = t.id.notEquals(0);
        if (collegeId != null) expr = expr & (t.collegeId.equals(collegeId) | t.collegeId.equals(null));
        if (sectionId != null) expr = expr & (t.sectionId.equals(sectionId) | t.sectionId.equals(null));
        return expr;
      },
      orderBy: (t) => t.startDate,
    );
  }

  /// CR/Admin can create timetable entry.
  Future<TimetableEntry> createTimetableEntry(Session session, TimetableEntry entry) async {
    return await TimetableEntry.db.insertRow(session, entry);
  }

  /// CR/Admin can create calendar event.
  Future<CalendarEvent> createCalendarEvent(Session session, CalendarEvent event) async {
    return await CalendarEvent.db.insertRow(session, event);
  }
}
