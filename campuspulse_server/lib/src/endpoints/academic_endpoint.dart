import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AcademicEndpoint extends Endpoint {
  Future<List<College>> getColleges(Session session) async {
    return await College.db.find(session, orderBy: (t) => t.name);
  }

  Future<College> addCollege(Session session, College college) async {
    return await College.db.insertRow(session, college);
  }

  Future<List<Branch>> getBranches(Session session, int collegeId) async {
    return await Branch.db.find(
      session,
      where: (t) => t.collegeId.equals(collegeId),
      orderBy: (t) => t.name,
    );
  }

  Future<List<Section>> getSections(Session session, int branchId, int year) async {
    return await Section.db.find(
      session,
      where: (t) => t.branchId.equals(branchId) & t.year.equals(year),
      orderBy: (t) => t.name,
    );
  }

  Future<List<Subject>> getSubjects(Session session, int branchId, int semester) async {
    return await Subject.db.find(
      session,
      where: (t) => t.branchId.equals(branchId) & t.semester.equals(semester),
      orderBy: (t) => t.name,
    );
  }
}
