import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/bunk_calculator.dart';

class AttendanceEndpoint extends Endpoint {
  /// Fetches all subject attendance records for the user.
  Future<List<AttendanceRecord>> getUserAttendance(Session session, int userId) async {
    return await AttendanceRecord.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.subjectName,
    );
  }

  /// Calculates Bunk stats for a given record.
  Future<BunkCalculationResult> getBunkStats(
    Session session, {
    int? subjectId,
    String? subjectName,
    required int attended,
    required int total,
    double requiredPercentage = 75.0,
    int? plannedTotal,
  }) async {
    final currentPct = BunkCalculator.calculateCurrentPercentage(attended, total);
    final safeBunks = BunkCalculator.calculateSafeBunks(attended, total, requiredPercentage);
    final recovery = BunkCalculator.calculateRecoveryClasses(attended, total, requiredPercentage);
    final statusColor = BunkCalculator.getStatusColor(attended, total, requiredPercentage);

    final whatIfs = <String>[];
    for (int i = 1; i <= 5; i++) {
      final newPct = BunkCalculator.calculateWhatIfPercentage(
        attended,
        total,
        i,
        projectedSemesterTotal: plannedTotal,
      );
      whatIfs.add('If you bunk $i more: ${newPct.toStringAsFixed(1)}%');
    }

    return BunkCalculationResult(
      subjectId: subjectId,
      subjectName: subjectName,
      classesAttended: attended,
      totalClassesHeld: total,
      currentPercentage: double.parse(currentPct.toStringAsFixed(1)),
      requiredPercentage: requiredPercentage,
      safeBunks: safeBunks,
      recoveryClassesNeeded: recovery,
      statusColor: statusColor,
      whatIfBunkScenarios: whatIfs,
    );
  }

  /// Upserts user's attendance record for a subject.
  Future<AttendanceRecord> upsertRecord(Session session, AttendanceRecord record) async {
    final existing = await AttendanceRecord.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(record.userId) & t.subjectId.equals(record.subjectId),
    );

    record.lastUpdated = DateTime.now();

    if (existing != null) {
      existing.classesAttended = record.classesAttended;
      existing.totalClassesHeld = record.totalClassesHeld;
      existing.requiredPercentage = record.requiredPercentage;
      existing.plannedTotalClasses = record.plannedTotalClasses;
      existing.lastUpdated = record.lastUpdated;
      return await AttendanceRecord.db.updateRow(session, existing);
    } else {
      return await AttendanceRecord.db.insertRow(session, record);
    }
  }

  /// Quick "Mark Present / Mark Absent" for today's class.
  Future<AttendanceRecord?> markTodayAttendance(
    Session session, {
    required int userId,
    required int subjectId,
    required bool isPresent,
    String source = 'manual',
  }) async {
    final record = await AttendanceRecord.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.subjectId.equals(subjectId),
    );

    if (record == null) return null;

    record.totalClassesHeld += 1;
    if (isPresent) {
      record.classesAttended += 1;
    }
    record.lastUpdated = DateTime.now();

    // Log the daily attendance entry
    await AttendanceLog.db.insertRow(
      session,
      AttendanceLog(
        userId: userId,
        subjectId: subjectId,
        date: DateTime.now(),
        status: isPresent ? 'present' : 'absent',
        source: source,
      ),
    );

    return await AttendanceRecord.db.updateRow(session, record);
  }
}
