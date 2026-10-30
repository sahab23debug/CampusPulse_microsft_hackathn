import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/auth/controllers/auth_controller.dart';

void main() {
  group('Kampuzz Authentication System Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial AuthState is unauthenticated', () {
      final authState = container.read(authControllerProvider);
      expect(authState.isAuthenticated, isFalse);
      expect(authState.currentUser, isNull);
    });

    test('1-Tap Demo sign-in logs in Aarav Sharma (IIT Delhi student)', () {
      final aarav = kDemoUsers[0];

      container.read(authControllerProvider.notifier).loginWithDemoUser(aarav);

      final state = container.read(authControllerProvider);
      expect(state.isAuthenticated, isTrue);
      expect(state.currentUser?.fullName, equals('Aarav Sharma'));
      expect(state.currentUser?.email, equals('aarav.sharma@iitd.ac.in'));
      expect(state.currentUser?.collegeName, equals('IIT Delhi'));
      expect(state.currentUser?.role, equals('student'));
      expect(state.currentUser?.skills, contains('Flutter'));
    });

    test('1-Tap Demo sign-in switches to Priya Patel (DTU Club Admin)', () {
      final priya = kDemoUsers[1];

      container.read(authControllerProvider.notifier).loginWithDemoUser(priya);

      final state = container.read(authControllerProvider);
      expect(state.isAuthenticated, isTrue);
      expect(state.currentUser?.fullName, equals('Priya Patel'));
      expect(state.currentUser?.role, equals('club_admin'));
      expect(state.currentUser?.collegeName, contains('DTU'));
    });

    test('Logout clears session and resets to unauthenticated', () {
      container.read(authControllerProvider.notifier).loginWithDemoUser(kDemoUsers[0]);
      expect(container.read(authControllerProvider).isAuthenticated, isTrue);

      container.read(authControllerProvider.notifier).logout();

      final state = container.read(authControllerProvider);
      expect(state.isAuthenticated, isFalse);
      expect(state.currentUser, isNull);
    });

    test('Complete Onboarding registers a new verified student profile', () {
      container.read(authControllerProvider.notifier).completeOnboarding(
        name: 'Rohan Mehra',
        email: 'rohan.mehra@dtu.ac.in',
        collegeName: 'Delhi Technological University (DTU)',
        branchName: 'Software Engineering',
        year: 2,
        sectionName: 'SE-2B',
        interests: ['Tech', 'Gaming', 'Robotics'],
        skills: ['Flutter', 'Python', 'Firebase'],
        bio: 'Building mobile apps for campus life.',
        sgpa: 9.35,
      );

      final state = container.read(authControllerProvider);
      expect(state.isAuthenticated, isTrue);
      expect(state.currentUser?.fullName, equals('Rohan Mehra'));
      expect(state.currentUser?.email, equals('rohan.mehra@dtu.ac.in'));
      expect(state.currentUser?.collegeName, equals('Delhi Technological University (DTU)'));
      expect(state.currentUser?.year, equals(2));
      expect(state.currentUser?.skills, contains('Flutter'));
      expect(state.currentUser?.interests, contains('Gaming'));
    });

    test('Custom email login parses student name and university domain', () async {
      final success = await container
          .read(authControllerProvider.notifier)
          .login('vikram.singh@nsut.ac.in', 'Password123');

      expect(success, isTrue);
      final state = container.read(authControllerProvider);
      expect(state.isAuthenticated, isTrue);
      expect(state.currentUser?.fullName, equals('Vikram Singh'));
      expect(state.currentUser?.collegeName, contains('NSUT'));
    });
  });
}
