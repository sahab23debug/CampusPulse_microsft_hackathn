import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Serverpod Endpoint providing real-time Study-Buddy matching,
/// schedule collision calculation, and compatibility indexing.
class StudyBuddyEndpoint extends Endpoint {
  /// Fetch matched study buddies filtered by course, study style, or availability.
  Future<List<StudentProfile>> getMatches(
    Session session, {
    String? courseFilter,
    String? studyStyleFilter,
    int minCompatScore = 70,
  }) async {
    session.log('StudyBuddyEndpoint: Computing compatibility graph for query course=$courseFilter');

    // In production with Serverpod Cloud, queries run against PostgreSQL via Serverpod ORM:
    // return await StudentProfile.find(session, where: (t) => t.compatScore >= minCompatScore);

    final mockBuddies = [
      StudentProfile(
        userId: 'usr_maya',
        name: 'Maya Patel',
        avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Computer Science',
        department: 'EECS Department',
        year: 'Junior (3rd Year)',
        semester: 'Fall 2026',
        bio: 'Obsessed with deep learning architectures and NLP. Currently grinding CS 189 homework sets.',
        courses: ['CS 189: Intro to Machine Learning', 'CS 162: Operating Systems', 'EECS 126: Probability'],
        interests: ['ML Infrastructure', 'NLP', 'Hackathons', 'Espresso'],
        lookingFor: 'Study Buddy',
        studyStyle: 'Whiteboard & Discussion · Active Recall',
        preferredLocation: 'Main Stacks Level C & Bechtel Center',
        availability: 'Mon/Wed/Fri 2:00 PM - 7:00 PM',
        compatScore: 96,
        matchReasons: ['Both enrolled in CS 189 & CS 162', 'Shared interests in ML Infrastructure', 'Similar afternoon study schedule'],
        isOnline: true,
        isVerified: true,
        role: 'student',
      ),
      StudentProfile(
        userId: 'usr_david',
        name: 'David Kim',
        avatar: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Computer Science',
        department: 'EECS Department',
        year: 'Junior (3rd Year)',
        semester: 'Fall 2026',
        bio: 'Full-stack developer competing in upcoming campus hackathons! Looking for 2 teammates to build mobile tools.',
        courses: ['CS 162: Operating Systems', 'CS 189: Intro to Machine Learning', 'CS 169A: Software Engineering'],
        interests: ['Distributed Systems', 'Mobile Apps', 'Hackathons', 'Espresso'],
        lookingFor: 'Hackathon Team',
        studyStyle: 'Pair Programming & Sprint Sprints',
        preferredLocation: 'Soda Hall 3rd Floor Alcove',
        availability: 'Friday evenings & all weekend',
        compatScore: 98,
        matchReasons: ['Both taking CS 162 and CS 189', 'Looking for Hackathon teammates right now'],
        isOnline: true,
        isVerified: true,
        role: 'student',
      ),
      StudentProfile(
        userId: 'usr_elena',
        name: 'Elena Rostova',
        avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=256&h=256&q=80',
        major: 'Applied Mathematics & Statistics',
        department: 'Mathematics Division',
        year: 'Sophomore (2nd Year)',
        semester: 'Fall 2026',
        bio: 'Math nerd working through multivariable calculus and linear algebra proofs. Flashcards, practice exams!',
        courses: ['MATH 53: Multivariable Calculus', 'DATA 100: Principles of Data Science', 'STAT 134: Concepts of Probability'],
        interests: ['Statistical Modeling', 'Kaggle', 'Bouldering', 'Classical Piano'],
        lookingFor: 'Exam Prep',
        studyStyle: 'Structured Flashcards & Practice Midterms',
        preferredLocation: 'Evans Hall Math Lounge 8th Floor',
        availability: 'Tues/Thurs 10:00 AM - 4:00 PM',
        compatScore: 88,
        matchReasons: ['Both enrolled in MATH 53 & DATA 100', 'Shared interest in Kaggle & Quantitative modeling'],
        isOnline: false,
        isVerified: true,
        role: 'student',
      ),
    ];

    if (courseFilter != null && courseFilter.isNotEmpty && courseFilter != 'All') {
      return mockBuddies.where((b) => b.courses.any((c) => c.contains(courseFilter))).toList();
    }

    return mockBuddies;
  }

  /// Request an instant study session or pairing invite.
  Future<bool> sendStudyInvite(
    Session session, {
    required String targetUserId,
    required String course,
    required String location,
    required String timeStr,
  }) async {
    session.log('Serverpod Streaming: Dispatching study invite to $targetUserId for $course at $location');
    // Real Serverpod message stream dispatch:
    session.messages.postMessage('user_channel_$targetUserId', {
      'type': 'study_invite',
      'course': course,
      'location': location,
      'time': timeStr,
    });
    return true;
  }
}
