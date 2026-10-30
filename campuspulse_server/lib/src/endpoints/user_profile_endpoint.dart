import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UserProfileEndpoint extends Endpoint {
  /// Fetches profile for a specific user.
  Future<UserProfile?> getProfile(Session session, int userId) async {
    return await UserProfile.db.findById(session, userId);
  }

  /// Fetches public profile representation.
  Future<UserProfile?> getPublicProfile(Session session, int userId) async {
    return await UserProfile.db.findById(session, userId);
  }

  /// Updates profile details.
  Future<UserProfile> updateProfile(Session session, UserProfile profile) async {
    return await UserProfile.db.updateRow(session, profile);
  }

  /// Fast <60-second onboarding completion.
  Future<UserProfile> completeOnboarding(
    Session session, {
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
  }) async {
    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );

    if (existing != null) {
      existing.fullName = fullName;
      existing.collegeId = collegeId;
      existing.collegeName = collegeName;
      existing.branchId = branchId;
      existing.branchName = branchName;
      existing.sectionId = sectionId;
      existing.sectionName = sectionName;
      existing.year = year;
      existing.semester = semester;
      existing.interests = interests;
      existing.skills = skills;
      existing.bio = bio;
      existing.githubUrl = githubUrl;
      existing.linkedinUrl = linkedinUrl;
      existing.sgpaJson = sgpaJson;
      return await UserProfile.db.updateRow(session, existing);
    }

    final newProfile = UserProfile(
      userInfoId: userInfoId,
      fullName: fullName,
      email: email,
      collegeId: collegeId,
      collegeName: collegeName,
      branchId: branchId,
      branchName: branchName,
      sectionId: sectionId,
      sectionName: sectionName,
      year: year,
      semester: semester,
      bio: bio,
      interests: interests,
      skills: skills,
      githubUrl: githubUrl,
      linkedinUrl: linkedinUrl,
      role: 'student',
      sgpaJson: sgpaJson,
      notesUploadedCount: 0,
      averageRatingReceived: 5.0,
      quizRank: 0,
      createdAt: DateTime.now(),
    );

    return await UserProfile.db.insertRow(session, newProfile);
  }
}
