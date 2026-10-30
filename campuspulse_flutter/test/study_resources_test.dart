import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/study_hub/domain/study_resource.dart';
import 'package:campuspulse_flutter/features/study_hub/controllers/study_hub_controller.dart';
import 'package:campuspulse_flutter/features/study_hub/presentation/study_hub_screen.dart';
import 'package:campuspulse_flutter/features/study_hub/presentation/widgets/brief_resource_list_item.dart';
import 'package:campuspulse_flutter/features/study_hub/presentation/widgets/detailed_resource_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('StudyResource Domain Tests', () {
    test('Formatted file size calculates MB and KB accurately', () {
      final res1 = StudyResource(
        id: 'test_1',
        title: 'DBMS Master Notes',
        description: 'Complete SQL notes',
        subject: 'Database Management Systems',
        type: ResourceType.handwritten,
        fileName: 'DBMS.pdf',
        fileSizeBytes: 4404019, // ~4.2 MB
        uploaderName: 'Sahab Raza',
        uploadedAt: DateTime.now(),
      );

      expect(res1.formattedFileSize, equals('4.2 MB'));
      expect(res1.typeLabel, equals('Handwritten'));

      final res2 = res1.copyWith(fileSizeBytes: 850000, type: ResourceType.formulaSheet);
      expect(res2.formattedFileSize, equals('830 KB'));
      expect(res2.typeLabel, equals('Formula Sheet'));
    });
  });

  group('StudyHubController Unit Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state loads default verified study resources', () {
      final state = container.read(studyHubProvider);
      expect(state.resources.length, greaterThanOrEqualTo(5));
      expect(state.selectedType, equals('All'));
      expect(state.selectedSubject, equals('All Subjects'));
      expect(state.viewMode, equals(StudyResourceViewMode.cards));
    });

    test('setSearchQuery filters resources by title, subject, or tags', () {
      final notifier = container.read(studyHubProvider.notifier);

      notifier.setSearchQuery('Deadlock');
      var filtered = container.read(studyHubProvider).filteredResources;
      expect(filtered.any((r) => r.title.contains('Operating Systems') || r.tags.contains('Deadlock')), isTrue);

      notifier.setSearchQuery('NonExistentKeywordXYZ');
      filtered = container.read(studyHubProvider).filteredResources;
      expect(filtered, isEmpty);

      notifier.setSearchQuery('');
      filtered = container.read(studyHubProvider).filteredResources;
      expect(filtered.length, greaterThanOrEqualTo(5));
    });

    test('setTypeFilter filters resources by category type', () {
      final notifier = container.read(studyHubProvider.notifier);

      notifier.setTypeFilter('Handwritten');
      var filtered = container.read(studyHubProvider).filteredResources;
      expect(filtered.every((r) => r.type == ResourceType.handwritten), isTrue);

      notifier.setTypeFilter('PYQ');
      filtered = container.read(studyHubProvider).filteredResources;
      expect(filtered.every((r) => r.type == ResourceType.pyq), isTrue);
    });

    test('toggleViewMode switches between cards and briefList', () {
      final notifier = container.read(studyHubProvider.notifier);
      expect(container.read(studyHubProvider).viewMode, equals(StudyResourceViewMode.cards));

      notifier.toggleViewMode();
      expect(container.read(studyHubProvider).viewMode, equals(StudyResourceViewMode.briefList));

      notifier.toggleViewMode();
      expect(container.read(studyHubProvider).viewMode, equals(StudyResourceViewMode.cards));
    });

    test('toggleBookmark adds and removes resource from bookmarks', () {
      final notifier = container.read(studyHubProvider.notifier);
      const resId = 'res_1';

      notifier.toggleBookmark(resId);
      expect(container.read(studyHubProvider).bookmarkedIds.contains(resId), isTrue);

      notifier.toggleBookmark(resId);
      expect(container.read(studyHubProvider).bookmarkedIds.contains(resId), isFalse);
    });

    test('uploadResource inserts new document at the beginning of the catalog', () {
      final notifier = container.read(studyHubProvider.notifier);
      final initialCount = container.read(studyHubProvider).resources.length;

      final newDoc = notifier.uploadResource(
        title: 'Artificial Intelligence Search & Heuristics Notes',
        description: 'Comprehensive A* and Minimax game playing notes with worked examples',
        subject: 'Artificial Intelligence',
        type: ResourceType.pdf,
        fileName: 'AI_Search_Notes_2026.pdf',
        fileSizeBytes: 3145728, // 3.0 MB
        pageCount: 22,
        tags: ['AI', 'Search', 'Minimax'],
      );

      final state = container.read(studyHubProvider);
      expect(state.resources.length, equals(initialCount + 1));
      expect(state.resources.first.id, equals(newDoc.id));
      expect(state.resources.first.title, contains('Artificial Intelligence'));
      expect(state.resources.first.fileName, equals('AI_Search_Notes_2026.pdf'));
    });
  });

  group('StudyHubScreen & UploadResourceModal Widget Tests', () {
    testWidgets('Renders StudyHubScreen with search bar, banner, and resources', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: StudyHubScreen(),
          ),
        ),
      );
      await tester.pump();

      // Check header and search bar
      expect(find.text('Study Hub'), findsOneWidget);
      expect(find.byKey(const Key('study_search_input')), findsOneWidget);
      expect(find.textContaining('Course Resources'), findsOneWidget);

      // Check default cards render
      expect(find.byType(DetailedResourceCard), findsWidgets);
      expect(find.textContaining('DBMS Comprehensive Handwritten Notes'), findsOneWidget);
    });

    testWidgets('Toggling view mode switches to Brief Resource Listing', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: StudyHubScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap View Mode toggle pill
      await tester.tap(find.byKey(const Key('view_mode_toggle_pill')));
      await tester.pumpAndSettle();

      // Should now render BriefResourceListItem widgets
      expect(find.byType(BriefResourceListItem), findsWidgets);
      expect(find.text('Tap any item for full brief & viewer'), findsOneWidget);

      // Verify brief descriptions are visible in brief list view
      expect(find.textContaining('Complete Unit 1-4 master notes with relational algebra'), findsOneWidget);
    });

    testWidgets('Tapping Upload Document FAB opens UploadResourceModal', (tester) async {
      tester.view.physicalSize = const Size(800, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: StudyHubScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap Floating Action Button
      await tester.tap(find.byKey(const Key('upload_document_fab')));
      await tester.pumpAndSettle();

      // Verify Upload Modal appeared
      expect(find.text('Upload Study Document'), findsOneWidget);
      expect(find.text('Attach File / Document'), findsOneWidget);
      expect(find.text('Resource Title'), findsOneWidget);
      expect(find.text('Brief Summary & Description'), findsOneWidget);
      expect(find.byKey(const Key('submit_upload_resource_button')), findsOneWidget);

      // Enter form details
      await tester.enterText(
        find.byKey(const Key('upload_title_input')),
        'Cloud Computing Distributed Systems Notes',
      );
      await tester.enterText(
        find.byKey(const Key('upload_desc_input')),
        'Concise summary of MapReduce, Raft consensus, and microservices architecture.',
      );

      // Submit upload
      await tester.ensureVisible(find.byKey(const Key('submit_upload_resource_button')));
      await tester.tap(find.byKey(const Key('submit_upload_resource_button')));
      await tester.pump(); // Start upload
      await tester.pump(const Duration(milliseconds: 700)); // Finish upload
      await tester.pumpAndSettle();

      // Modal closed, and new resource is displayed in the list
      expect(find.text('Cloud Computing Distributed Systems Notes'), findsOneWidget);
    });

    testWidgets('Tapping a brief resource item opens detail & document viewer sheet', (tester) async {
      tester.view.physicalSize = const Size(800, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: StudyHubScreen(),
          ),
        ),
      );
      await tester.pump();

      // Switch to Brief List view
      await tester.tap(find.byKey(const Key('view_mode_toggle_pill')));
      await tester.pumpAndSettle();

      // Tap first brief item
      await tester.tap(find.byType(BriefResourceListItem).first);
      await tester.pumpAndSettle();

      // Verify Detail sheet
      expect(find.text('Resource Summary & Content'), findsOneWidget);
      expect(find.text('Download Document'), findsOneWidget);
      expect(find.text('Quick Preview'), findsOneWidget);
      expect(find.text('Student Discussion (2)'), findsOneWidget);
    });
  });
}
