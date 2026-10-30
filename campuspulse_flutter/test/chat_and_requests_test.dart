import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/chat/domain/chat_models.dart';
import 'package:campuspulse_flutter/features/chat/controllers/chat_controller.dart';
import 'package:campuspulse_flutter/features/chat/presentation/requests_tab.dart';
import 'package:campuspulse_flutter/features/chat/presentation/conversations_tab.dart';
import 'package:campuspulse_flutter/features/chat/presentation/chat_detail_screen.dart';
import 'package:campuspulse_flutter/core/theme/app_theme.dart';

void main() {
  group('Chat and Requests Controller Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state loads pending requests and active conversations', () {
      final state = container.read(chatControllerProvider);

      expect(state.requests.isNotEmpty, isTrue);
      expect(state.pendingRequestCount, greaterThan(0));
      expect(state.conversations.isNotEmpty, isTrue);
      expect(state.requests.any((r) => r.senderName == 'Sahab Raza'), isTrue);
      expect(state.requests.any((r) => r.senderName == 'Priya Patel'), isTrue);
    });

    test('Searching specific person filters requests accurately', () {
      final controller = container.read(chatControllerProvider.notifier);

      // Search for Sahab
      controller.setRequestSearchQuery('Sahab');
      var state = container.read(chatControllerProvider);
      expect(state.filteredRequests.length, equals(1));
      expect(state.filteredRequests.first.senderName, equals('Sahab Raza'));

      // Search by college NSUT
      controller.setRequestSearchQuery('NSUT');
      state = container.read(chatControllerProvider);
      expect(state.filteredRequests.length, equals(1));
      expect(state.filteredRequests.first.senderCollege, contains('NSUT'));

      // Search by skill ROS
      controller.setRequestSearchQuery('ROS');
      state = container.read(chatControllerProvider);
      expect(state.filteredRequests.length, equals(1));
      expect(state.filteredRequests.first.senderName, equals('Priya Patel'));

      // Non-existent search
      controller.setRequestSearchQuery('NonExistentPersonXYZ');
      state = container.read(chatControllerProvider);
      expect(state.filteredRequests.isEmpty, isTrue);
    });

    test('Accepting request updates status and creates active conversation', () {
      final controller = container.read(chatControllerProvider.notifier);
      final initialConvsCount = container.read(chatControllerProvider).conversations.length;

      final conv = controller.acceptRequest('req_3'); // Rohan Das

      final state = container.read(chatControllerProvider);
      final updatedReq = state.requests.firstWhere((r) => r.id == 'req_3');

      expect(updatedReq.status, equals(RequestStatus.accepted));
      expect(conv.peerName, equals('Rohan Das'));
      expect(state.conversations.length, equals(initialConvsCount + 1));
      expect(conv.messages.length, greaterThanOrEqualTo(2));
    });

    test('Declining request sets status to declined', () {
      final controller = container.read(chatControllerProvider.notifier);

      controller.declineRequest('req_4'); // Ananya Gupta

      final state = container.read(chatControllerProvider);
      final updatedReq = state.requests.firstWhere((r) => r.id == 'req_4');
      expect(updatedReq.status, equals(RequestStatus.declined));
    });

    test('Sending real-time message appends and triggers interactive peer response', () async {
      final controller = container.read(chatControllerProvider.notifier);

      await controller.sendMessage('conv_sahab', 'Where should we meet today?');

      final state = container.read(chatControllerProvider);
      final conv = state.conversations.firstWhere((c) => c.id == 'conv_sahab');

      expect(conv.messages.any((m) => m.text == 'Where should we meet today?' && m.isMe), isTrue);
      // Peer should reply contextually about meeting at LHC
      expect(conv.messages.any((m) => !m.isMe && m.text.contains('LHC')), isTrue);
    });
  });

  group('Chat and Requests Widget Tests', () {
    testWidgets('RequestsTab renders search bar and received cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(body: RequestsTab()),
          ),
        ),
      );

      // Verify Search bar
      expect(find.byType(TextField), findsOneWidget);
      expect(find.textContaining('Search specific person'), findsOneWidget);

      // Verify Request cards rendered
      expect(find.text('Sahab Raza'), findsOneWidget);
      expect(find.text('Priya Patel'), findsOneWidget);
      expect(find.text('Accept & Chat'), findsWidgets);
      expect(find.text('Decline'), findsWidgets);
    });

    testWidgets('ConversationsTab renders active chats list with search', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(body: ConversationsTab()),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Sahab Raza'), findsOneWidget);
      expect(find.text('Priya Patel'), findsOneWidget);
    });

    testWidgets('ChatDetailScreen renders peer header, message feed, and quick prompts', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const ChatDetailScreen(conversationId: 'conv_sahab'),
          ),
        ),
      );

      expect(find.text('Sahab Raza'), findsOneWidget);
      expect(find.text('96% MATCH'), findsOneWidget);
      expect(find.text('📍 Meet at LHC Foyer at 4 PM'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
