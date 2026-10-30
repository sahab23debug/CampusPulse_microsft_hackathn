import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_client/campuspulse_client.dart';

/// Pre-populated realistic demo accounts for Indian college hackathons
final List<UserProfile> kDemoUsers = [
  UserProfile(
    id: 1,
    userInfoId: 101,
    fullName: 'Aarav Sharma',
    email: 'aarav.sharma@iitd.ac.in',
    avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
    collegeId: 1,
    collegeName: 'IIT Delhi',
    branchId: 1,
    branchName: 'Computer Science & Engineering',
    sectionId: 1,
    sectionName: 'CSE-3A',
    year: 3,
    semester: 5,
    bio: 'Full-stack builder passionate about distributed systems and Flutter. Hackathon finalist & peer tutor for DBMS.',
    interests: ['Tech', 'Coding', 'Gaming', 'Music', 'Robotics'],
    skills: ['Flutter', 'Dart', 'Go', 'Docker', 'PostgreSQL', 'Redis'],
    githubUrl: 'https://github.com/aarav-sharma',
    linkedinUrl: 'https://linkedin.com/in/aarav-sharma',
    role: 'student',
    sgpaJson: '{"Semester 1": 9.2, "Semester 2": 9.4, "Semester 3": 9.1, "Semester 4": 9.5}',
    notesUploadedCount: 6,
    averageRatingReceived: 4.9,
    quizRank: 2,
    createdAt: DateTime.now(),
  ),
  UserProfile(
    id: 2,
    userInfoId: 102,
    fullName: 'Priya Patel',
    email: 'priya.patel@dtu.ac.in',
    avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
    collegeId: 2,
    collegeName: 'Delhi Technological University (DTU)',
    branchId: 2,
    branchName: 'Electronics & Communication Engineering',
    sectionId: 2,
    sectionName: 'ECE-4B',
    year: 4,
    semester: 7,
    bio: 'President of DTU Robotics Society & IEEE Student Branch Lead. Organizing Invictus Tech Fest 2026.',
    interests: ['Robotics', 'Tech', 'Design', 'Event Management'],
    skills: ['Embedded C', 'ROS', 'Python', 'Leadership', 'Figma'],
    githubUrl: 'https://github.com/priyapatel-dtu',
    linkedinUrl: 'https://linkedin.com/in/priya-patel',
    role: 'club_admin',
    sgpaJson: '{"Semester 1": 9.0, "Semester 2": 9.2, "Semester 3": 9.3, "Semester 4": 9.4}',
    notesUploadedCount: 9,
    averageRatingReceived: 4.95,
    quizRank: 1,
    createdAt: DateTime.now(),
  ),
  UserProfile(
    id: 3,
    userInfoId: 103,
    fullName: 'Sahab Raza',
    email: 'sahab.raza@nsut.ac.in',
    avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
    collegeId: 3,
    collegeName: 'Netaji Subhas University of Technology (NSUT)',
    branchId: 3,
    branchName: 'Information Technology',
    sectionId: 3,
    sectionName: 'IT-2A',
    year: 2,
    semester: 3,
    bio: 'Data structures enthusiast & competitive programmer. Top notes contributor for Discrete Mathematics.',
    interests: ['Coding', 'Algorithms', 'Mathematics', 'Chess'],
    skills: ['C++', 'Algorithms', 'Discrete Math', 'Python'],
    githubUrl: 'https://github.com/sahabraza',
    linkedinUrl: 'https://linkedin.com/in/sahab-raza',
    role: 'student',
    sgpaJson: '{"Semester 1": 9.2, "Semester 2": 9.3}',
    notesUploadedCount: 14,
    averageRatingReceived: 4.9,
    quizRank: 3,
    createdAt: DateTime.now(),
  ),
];

class AuthState {
  final bool isAuthenticated;
  final UserProfile? currentUser;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    required this.isAuthenticated,
    this.currentUser,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    UserProfile? currentUser,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      currentUser: currentUser ?? this.currentUser,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState(isAuthenticated: false));

  /// Log in with email & password (authenticates against Serverpod / Demo accounts)
  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate Serverpod Auth roundtrip
    await Future.delayed(const Duration(milliseconds: 500));

    final trimmedEmail = email.trim().toLowerCase();
    UserProfile matchedUser;
    try {
      matchedUser = kDemoUsers.firstWhere(
        (u) => u.email.toLowerCase() == trimmedEmail,
      );
    } catch (_) {
      final namePart = email.split('@').first.replaceAll(RegExp(r'[._\-]'), ' ');
      final capitalized = namePart
          .split(' ')
          .where((s) => s.isNotEmpty)
          .map((s) => '${s[0].toUpperCase()}${s.substring(1)}')
          .join(' ');
      final displayName = capitalized.isNotEmpty ? capitalized : 'Kampuzz Student';
      final domain = email.contains('@') ? email.split('@').last.toLowerCase() : '';
      final collegeName = domain.contains('dtu')
          ? 'Delhi Technological University (DTU)'
          : (domain.contains('nsut')
              ? 'Netaji Subhas University of Technology (NSUT)'
              : (domain.contains('bits')
                  ? 'BITS Pilani'
                  : 'IIT Delhi'));

      matchedUser = UserProfile(
        id: 77,
        userInfoId: 777,
        fullName: displayName,
        email: email.trim(),
        avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
        collegeId: 1,
        collegeName: collegeName,
        branchId: 1,
        branchName: 'Computer Science & Engineering',
        sectionId: 1,
        sectionName: 'CSE-3A',
        year: 3,
        semester: 5,
        bio: 'Kampuzz student builder & tech enthusiast at $collegeName.',
        interests: ['Tech', 'Coding', 'Events', 'Robotics'],
        skills: ['Flutter', 'Python', 'Algorithms', 'Docker'],
        role: 'student',
        sgpaJson: '{"Semester 1": 9.2, "Semester 2": 9.4, "Semester 3": 9.1}',
        notesUploadedCount: 3,
        averageRatingReceived: 4.85,
        quizRank: 4,
        createdAt: DateTime.now(),
      );
    }

    state = AuthState(
      isAuthenticated: true,
      currentUser: matchedUser,
      isLoading: false,
    );
    return true;
  }

  /// Instant 1-tap demo sign-in for judges & testers
  void loginWithDemoUser(UserProfile user) {
    state = AuthState(
      isAuthenticated: true,
      currentUser: user,
      isLoading: false,
    );
  }

  /// Complete onboarding and create user profile
  void completeOnboarding({
    required String name,
    required String email,
    required String collegeName,
    required String branchName,
    required int year,
    required String sectionName,
    required List<String> interests,
    required List<String> skills,
    required String bio,
    required double sgpa,
  }) {
    final newUser = UserProfile(
      id: 99,
      userInfoId: 999,
      fullName: name,
      email: email,
      avatarUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=300',
      collegeId: 1,
      collegeName: collegeName,
      branchId: 1,
      branchName: branchName,
      sectionId: 1,
      sectionName: sectionName,
      year: year,
      semester: (year * 2) - 1,
      bio: bio,
      interests: interests,
      skills: skills,
      role: 'student',
      sgpaJson: '{"Current": $sgpa}',
      notesUploadedCount: 0,
      averageRatingReceived: 0.0,
      quizRank: 10,
      createdAt: DateTime.now(),
    );

    state = AuthState(
      isAuthenticated: true,
      currentUser: newUser,
      isLoading: false,
    );
  }

  /// Sign out
  void logout() {
    state = const AuthState(isAuthenticated: false, currentUser: null);
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
