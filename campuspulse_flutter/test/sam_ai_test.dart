import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/sam_ai/domain/sam_engine.dart';
import 'package:campuspulse_flutter/features/sam_ai/controllers/sam_controller.dart';
import 'package:campuspulse_flutter/features/sam_ai/presentation/sam_copilot_screen.dart';
import 'package:campuspulse_flutter/features/auth/controllers/auth_controller.dart';
import 'package:campuspulse_flutter/core/theme/app_theme.dart';

void main() {
  group('Sam AI Campus Knowledge Engine Tests', () {
    final demoUser = kDemoUsers[0]; // Aarav Sharma

    test('Answers next class query with room location and faculty', () {
      final reply = SamEngine.processQuery('what is my next class?', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Design & Analysis of Algorithms Lab'));
      expect(reply.text, contains('CS Lab 3'));
      expect(reply.text, contains('Prof. R. Sen'));
      expect(reply.actions.any((a) => a.route == '/timetable'), isTrue);
    });

    test('Answers today schedule query with all 4 classes', () {
      final reply = SamEngine.processQuery('show me my schedule for today', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('DBMS'));
      expect(reply.text, contains('Operating Systems'));
      expect(reply.text, contains('DAA Lab'));
      expect(reply.text, contains('Computer Networks'));
    });

    test('Bunk DBMS query calculates safe bunks accurately', () {
      final reply = SamEngine.processQuery('can i bunk dbms today?', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Yes, you can bunk DBMS today!'));
      expect(reply.text, contains('26/30'));
      expect(reply.actions.any((a) => a.route == '/bunk-meter'), isTrue);
    });

    test('Bunk DAA query warns critically against skipping', () {
      final reply = SamEngine.processQuery('can i bunk daa?', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('DO NOT Bunk DAA'));
      expect(reply.text, contains('63.6%'));
    });

    test('Notes query recommends top handwritten DBMS notes', () {
      final reply = SamEngine.processQuery('where can i find handwritten notes?', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Sahab Raza'));
      expect(reply.text, contains('DBMS'));
      expect(reply.actions.any((a) => a.route == '/study'), isTrue);
    });

    test('Events query returns HackPulse 2026 hackathon details', () {
      final reply = SamEngine.processQuery('upcoming hackathons on campus', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('HackPulse 2026'));
      expect(reply.actions.any((a) => a.route == '/home'), isTrue);
    });

    test('Empathetic exam stress advice provides practical tips', () {
      final reply = SamEngine.processQuery('i am feeling so stressed about exams', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Take a Deep Breath, Aarav'));
      expect(reply.text, contains('Pomodoro'));
    });

    test('Coding & DSA query returns core patterns, tech stacks, and interview advice', () {
      final reply = SamEngine.processQuery('how should i practice coding and dsa?', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Coding & DSA Blueprint'));
      expect(reply.text, contains('Two Pointers & Sliding Window'));
      expect(reply.text, contains('Dynamic Programming'));
      expect(reply.text, contains('Flutter & Dart'));
      expect(reply.actions.any((a) => a.route == '/arena'), isTrue);
    });

    test('CV & Resume query provides ATS guidelines and Google XYZ formula', () {
      final reply = SamEngine.processQuery('help me build a strong cv for software engineering', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('ATS-Friendly Tech CV & Resume Architecture'));
      expect(reply.text, contains('XYZ'));
      expect(reply.text, contains('1 page'));
      expect(reply.text, contains('Technical Skills'));
    });

    test('Certification query suggests top industry credentials for Cloud, AI, and Software', () {
      final reply = SamEngine.processQuery('suggest certification for cloud and software engineering', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Top High-ROI Industry Certifications'));
      expect(reply.text, contains('AWS Certified Cloud Practitioner'));
      expect(reply.text, contains('AWS Certified Solutions Architect'));
      expect(reply.text, contains('Google Cloud Associate Cloud Engineer'));
      expect(reply.text, contains('GitHub Student Developer Pack'));
    });

    test('Study strategy query returns scientific active recall and high-yield plans', () {
      final reply = SamEngine.processQuery('give me a study plan for high-yield semester exam topics', demoUser);

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Scientific Semester Study & Subject Mastery Blueprint'));
      expect(reply.text, contains('Feynman & Active Recall'));
      expect(reply.text, contains('High-Yield Unit Prioritization'));
      expect(reply.text, contains('Spaced Repetition'));
    });

    test('Multimodal Photo Solver extracts and solves Master Theorem question', () {
      final reply = SamEngine.processQuery(
        'solve question in photo',
        demoUser,
        mediaUrl: 'https://images.unsplash.com/photo-test',
        geoLandmark: 'Bharti School CS Lab 3',
      );

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Vision OCR: Algorithmic Problem Analysis from Photo'));
      expect(reply.text, contains('Master Theorem'));
      expect(reply.text, contains('Case 2'));
      expect(reply.text, contains('Θ(n log n)'));
      expect(reply.text, contains('Bharti School CS Lab 3'));
    });

    test('Multimodal Photo Solver solves OS Banker\'s Algorithm Safe State table', () {
      final reply = SamEngine.processQuery(
        'solve this os deadlock banker algorithm table',
        demoUser,
        mediaUrl: 'https://images.unsplash.com/photo-test',
      );

      expect(reply.isUser, isFalse);
      expect(reply.text, contains('Operating Systems Deadlock Problem Detected'));
      expect(reply.text, contains('Banker’s Algorithm'));
      expect(reply.text, contains('SAFE STATE'));
      expect(reply.text, contains('Safe Execution Sequence'));
    });
  });

  group('Sam AI Controller State Tests', () {
    test('Initializes with greeting and quick suggestions', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(samControllerProvider);
      expect(state.messages.length, equals(1));
      expect(state.messages.first.text, contains('I\'m **Sam**'));
      expect(state.quickSuggestions.isNotEmpty, isTrue);
      expect(state.quickSuggestions, contains('📸 Solve Question from Photo'));
      expect(state.quickSuggestions, contains('💻 Coding & DSA Blueprint'));
      expect(state.quickSuggestions, contains('📄 Build an ATS-Friendly CV'));
      expect(state.quickSuggestions, contains('🎓 Top Industry Certifications'));
    });

    test('Sending a message with media attachment receives multimodal vision explanation', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(samControllerProvider.notifier).sendMessage(
        'explain this recurrence problem',
        mediaUrl: 'https://images.unsplash.com/photo-test',
        geoLandmark: 'LHC Central Lawn',
      );

      final state = container.read(samControllerProvider);
      expect(state.messages.length, equals(3));
      expect(state.messages[1].isUser, isTrue);
      expect(state.messages[1].mediaUrl, equals('https://images.unsplash.com/photo-test'));
      expect(state.messages[1].geoLandmark, equals('LHC Central Lawn'));
      expect(state.messages[2].isUser, isFalse);
      expect(state.messages[2].text, contains('Master Theorem'));
    });

    test('Clear chat resets back to initial greeting', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(samControllerProvider.notifier).sendMessage('bunk dbms');
      expect(container.read(samControllerProvider).messages.length, equals(3));

      container.read(samControllerProvider.notifier).clearChat();
      expect(container.read(samControllerProvider).messages.length, equals(1));
    });
  });

  testWidgets('SamCopilotScreen renders title, media button, suggestions, and input', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const SamCopilotScreen(),
        ),
      ),
    );

    expect(find.text('Sam AI Copilot'), findsOneWidget);
    expect(find.byKey(const Key('sam_message_input')), findsOneWidget);
    expect(find.byKey(const Key('attach_media_button')), findsOneWidget);
    expect(find.text('📸 Solve Question from Photo'), findsOneWidget);
    expect(find.text('💻 Coding & DSA Blueprint'), findsOneWidget);
  });
}
