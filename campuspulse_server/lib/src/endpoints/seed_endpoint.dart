import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/seed_service.dart';

class SeedEndpoint extends Endpoint {
  /// Populate complete realistic demo dataset for CampusPulse.
  Future<Map<String, dynamic>> seedDemoData(Session session) async {
    // 1. Seed Colleges
    for (final c in SeedService.colleges) {
      final existing = await College.db.findFirstRow(
        session,
        where: (t) => t.code.equals(c['code'] as String),
      );
      if (existing == null) {
        await College.db.insertRow(
          session,
          College(
            name: c['name'],
            code: c['code'],
            city: c['city'],
            state: c['state'],
          ),
        );
      }
    }

    // 2. Seed Branches
    for (final b in SeedService.branches) {
      final existing = await Branch.db.findFirstRow(
        session,
        where: (t) => t.collegeId.equals(b['collegeId'] as int) & t.code.equals(b['code'] as String),
      );
      if (existing == null) {
        await Branch.db.insertRow(
          session,
          Branch(
            collegeId: b['collegeId'],
            name: b['name'],
            code: b['code'],
            degree: b['degree'],
          ),
        );
      }
    }

    // 3. Seed Sections
    for (final s in SeedService.sections) {
      final existing = await Section.db.findFirstRow(
        session,
        where: (t) => t.branchId.equals(s['branchId'] as int) & t.name.equals(s['name'] as String),
      );
      if (existing == null) {
        await Section.db.insertRow(
          session,
          Section(
            branchId: s['branchId'],
            name: s['name'],
            year: s['year'],
            semester: s['semester'],
          ),
        );
      }
    }

    // 4. Seed Subjects
    for (final sub in SeedService.subjects) {
      final existing = await Subject.db.findFirstRow(
        session,
        where: (t) => t.branchId.equals(sub['branchId'] as int) & t.code.equals(sub['code'] as String),
      );
      if (existing == null) {
        await Subject.db.insertRow(
          session,
          Subject(
            branchId: sub['branchId'],
            semester: sub['semester'],
            name: sub['name'],
            code: sub['code'],
            credits: sub['credits'],
          ),
        );
      }
    }

    // 5. Seed Users
    for (final u in SeedService.users) {
      final existing = await UserProfile.db.findFirstRow(
        session,
        where: (t) => t.email.equals(u['email'] as String),
      );
      if (existing == null) {
        await UserProfile.db.insertRow(
          session,
          UserProfile(
            userInfoId: u['id'],
            fullName: u['fullName'],
            email: u['email'],
            avatarUrl: u['avatarUrl'],
            collegeId: u['collegeId'],
            collegeName: u['collegeName'],
            branchId: u['branchId'],
            branchName: u['branchName'],
            sectionId: u['sectionId'],
            sectionName: u['sectionName'],
            year: u['year'],
            semester: u['semester'],
            bio: u['bio'],
            interests: (u['interests'] as List).cast<String>(),
            skills: (u['skills'] as List).cast<String>(),
            githubUrl: u['githubUrl'],
            linkedinUrl: u['linkedinUrl'],
            role: u['role'],
            sgpaJson: u['sgpaJson'],
            notesUploadedCount: u['notesUploadedCount'],
            averageRatingReceived: (u['averageRatingReceived'] as num).toDouble(),
            quizRank: u['quizRank'],
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    // 6. Seed Resources (Notes)
    for (final r in SeedService.resources) {
      final existing = await Resource.db.findFirstRow(
        session,
        where: (t) => t.title.equals(r['title'] as String),
      );
      if (existing == null) {
        await Resource.db.insertRow(
          session,
          Resource(
            uploaderId: r['uploaderId'],
            uploaderName: r['uploaderName'],
            uploaderSgpa: (r['uploaderSgpa'] as num?)?.toDouble(),
            uploaderSemester: r['uploaderSemester'],
            title: r['title'],
            description: r['description'],
            subjectId: r['subjectId'],
            subjectName: r['subjectName'],
            semester: r['semester'],
            branchId: r['branchId'],
            year: r['year'],
            resourceType: r['resourceType'],
            fileUrl: r['fileUrl'],
            externalUrl: r['externalUrl'],
            tags: (r['tags'] as List).cast<String>(),
            viewsCount: r['viewsCount'],
            followCount: r['followCount'],
            averageRating: (r['averageRating'] as num).toDouble(),
            ratingCount: r['ratingCount'],
            createdAt: DateTime.now().subtract(const Duration(days: 3)),
          ),
        );
      }
    }

    // 7. Seed Events
    for (final e in SeedService.events) {
      final existing = await CampusEvent.db.findFirstRow(
        session,
        where: (t) => t.title.equals(e['title'] as String),
      );
      if (existing == null) {
        await CampusEvent.db.insertRow(
          session,
          CampusEvent(
            collegeId: e['collegeId'],
            organizerClub: e['organizerClub'],
            creatorUserId: e['creatorUserId'],
            title: e['title'],
            description: e['description'],
            posterUrl: e['posterUrl'],
            venue: e['venue'],
            eventDate: e['eventDate'],
            registrationDeadline: e['registrationDeadline'],
            capacity: e['capacity'],
            registrationCount: e['registrationCount'],
            registrationUrl: e['registrationUrl'],
            isInternalRegistration: e['isInternalRegistration'],
            tags: (e['tags'] as List).cast<String>(),
            isApproved: e['isApproved'],
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    // 8. Seed Communities
    for (final comm in SeedService.communities) {
      final existing = await Community.db.findFirstRow(
        session,
        where: (t) => t.name.equals(comm['name'] as String),
      );
      if (existing == null) {
        await Community.db.insertRow(
          session,
          Community(
            name: comm['name'],
            description: comm['description'],
            category: comm['category'],
            iconUrl: comm['iconUrl'],
            creatorUserId: comm['creatorUserId'],
            isPrivate: comm['isPrivate'],
            memberCount: comm['memberCount'],
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    // 9. Seed Quiz Questions Pool
    for (final q in SeedService.sampleQuizQuestions) {
      final textHash = SeedService.hashText(q['questionText'] as String);
      final existing = await QuizQuestion.db.findFirstRow(
        session,
        where: (t) => t.textHash.equals(textHash),
      );
      if (existing == null) {
        await QuizQuestion.db.insertRow(
          session,
          QuizQuestion(
            subject: q['subject'],
            topic: q['topic'],
            difficulty: q['difficulty'],
            questionText: q['questionText'],
            optionA: q['optionA'],
            optionB: q['optionB'],
            optionC: q['optionC'],
            optionD: q['optionD'],
            correctOptionIndex: q['correctOptionIndex'],
            explanation: q['explanation'],
            textHash: textHash,
            usageCount: 0,
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    return {
      'status': 'success',
      'message': 'CampusPulse demo dataset seeded successfully!',
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
