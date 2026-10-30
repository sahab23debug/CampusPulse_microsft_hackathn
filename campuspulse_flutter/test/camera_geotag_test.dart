import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/camera/domain/camera_models.dart';
import 'package:campuspulse_flutter/features/camera/controllers/camera_controller.dart';
import 'package:campuspulse_flutter/features/camera/presentation/campus_camera_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CampusGeoLocation & PhotoSnap Domain Tests', () {
    test('CampusGeoLocation calculates formatted coordinates and Google Maps URL', () {
      const loc = CampusGeoLocation(
        latitude: 28.5450,
        longitude: 77.1926,
        altitude: 216.4,
        accuracy: 3.2,
        campusName: 'IIT Delhi Main Campus',
        landmarkName: 'Lecture Hall Complex (LHC)',
      );

      expect(loc.formattedCoords, contains('28.5450° N, 77.1926° E'));
      expect(loc.googleMapsUrl, equals('https://maps.google.com/?q=28.545,77.1926'));
      expect(loc.landmarkName, equals('Lecture Hall Complex (LHC)'));
    });

    test('CampusPhotoSnap contains complete metadata', () {
      final snap = CampusPhotoSnap(
        id: 'snap_1',
        imageUrl: 'https://images.unsplash.com/photo-test',
        location: kDefaultCampusLocations.first,
        timestamp: DateTime(2026, 10, 30, 14, 0),
        capturedBy: 'Aarav Sharma',
        caption: 'Chilling at Central Library',
        isSaved: false,
        mode: CameraCaptureMode.campusSpot,
      );

      expect(snap.id, equals('snap_1'));
      expect(snap.capturedBy, equals('Aarav Sharma'));
      expect(snap.location.landmarkName, contains('Lecture Hall Complex'));
      expect(snap.isSaved, isFalse);

      final saved = snap.copyWith(isSaved: true, caption: 'Saved Moment');
      expect(saved.isSaved, isTrue);
      expect(saved.caption, equals('Saved Moment'));
    });
  });

  group('CameraController Unit Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial CameraState has default landmark, back camera, and grid enabled', () {
      final state = container.read(cameraControllerProvider);
      expect(state.currentLocation.landmarkName, contains('Lecture Hall Complex'));
      expect(state.isFrontCamera, isFalse);
      expect(state.showGrid, isTrue);
      expect(state.isFlashOn, isFalse);
      expect(state.activeMode, equals(CameraCaptureMode.campusSpot));
      expect(state.capturedSnap, isNull);
      expect(state.savedSnaps.length, greaterThanOrEqualTo(2));
    });

    test('setLocation updates current location', () {
      final notifier = container.read(cameraControllerProvider.notifier);
      final newLoc = kDefaultCampusLocations[2]; // Open Air Theatre (OAT)
      notifier.setLocation(newLoc);

      final state = container.read(cameraControllerProvider);
      expect(state.currentLocation.landmarkName, contains('Open Air Theatre'));
    });

    test('toggleFlash flips flash on and off', () {
      final notifier = container.read(cameraControllerProvider.notifier);

      notifier.toggleFlash();
      expect(container.read(cameraControllerProvider).isFlashOn, isTrue);

      notifier.toggleFlash();
      expect(container.read(cameraControllerProvider).isFlashOn, isFalse);
    });

    test('toggleGrid flips grid visibility', () {
      final notifier = container.read(cameraControllerProvider.notifier);
      expect(container.read(cameraControllerProvider).showGrid, isTrue);

      notifier.toggleGrid();
      expect(container.read(cameraControllerProvider).showGrid, isFalse);

      notifier.toggleGrid();
      expect(container.read(cameraControllerProvider).showGrid, isTrue);
    });

    test('toggleCamera flips front and rear lens', () {
      final notifier = container.read(cameraControllerProvider.notifier);
      expect(container.read(cameraControllerProvider).isFrontCamera, isFalse);

      notifier.toggleCamera();
      expect(container.read(cameraControllerProvider).isFrontCamera, isTrue);

      notifier.toggleCamera();
      expect(container.read(cameraControllerProvider).isFrontCamera, isFalse);
    });

    test('setMode changes camera mode', () {
      final notifier = container.read(cameraControllerProvider.notifier);

      notifier.setMode(CameraCaptureMode.notesScanner);
      expect(container.read(cameraControllerProvider).activeMode, equals(CameraCaptureMode.notesScanner));

      notifier.setMode(CameraCaptureMode.studentMoment);
      expect(container.read(cameraControllerProvider).activeMode, equals(CameraCaptureMode.studentMoment));
    });

    test('clickPhoto snaps freeze-frame with geotag metadata', () {
      final notifier = container.read(cameraControllerProvider.notifier);

      notifier.clickPhoto(customCaption: 'Exam prep group!');
      final state = container.read(cameraControllerProvider);

      expect(state.capturedSnap, isNotNull);
      expect(state.capturedSnap!.caption, equals('Exam prep group!'));
      expect(state.capturedSnap!.location.landmarkName, contains('Lecture Hall Complex'));
      expect(state.capturedSnap!.isSaved, isFalse);
    });

    test('saveCapturedSnap saves photo into memories gallery and clear returns to viewfinder', () {
      final notifier = container.read(cameraControllerProvider.notifier);
      final initialCount = container.read(cameraControllerProvider).savedSnaps.length;

      notifier.clickPhoto(customCaption: 'Hackathon Win');
      notifier.saveCapturedSnap('Hackathon Final Pitch');

      final state = container.read(cameraControllerProvider);
      expect(state.savedSnaps.length, equals(initialCount + 1));
      expect(state.capturedSnap!.isSaved, isTrue);
      expect(state.capturedSnap!.caption, equals('Hackathon Final Pitch'));

      notifier.clearCapturedSnap();
      expect(container.read(cameraControllerProvider).capturedSnap, isNull);
    });

    test('deleteSavedSnap removes photo from memories gallery', () {
      final notifier = container.read(cameraControllerProvider.notifier);
      final initialMemories = container.read(cameraControllerProvider).savedSnaps;
      final targetId = initialMemories.first.id;

      notifier.deleteSavedSnap(targetId);
      final updatedMemories = container.read(cameraControllerProvider).savedSnaps;
      expect(updatedMemories.any((m) => m.id == targetId), isFalse);
    });
  });

  group('CampusCameraScreen Widget Tests', () {
    testWidgets('Renders camera viewfinder with Geotag HUD bar and controls', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CampusCameraScreen(),
          ),
        ),
      );
      await tester.pump();

      // Top HUD check
      expect(find.text('Kampuzz Geo-Cam'), findsWidgets);
      expect(find.textContaining('Lecture Hall Complex'), findsWidgets);
      expect(find.textContaining('28.5450° N'), findsWidgets);

      // Mode chips check
      expect(find.textContaining('Campus Spot'), findsOneWidget);
      expect(find.textContaining('Notes Scan'), findsOneWidget);
      expect(find.textContaining('Moment'), findsOneWidget);

      // Controls check
      expect(find.byIcon(Icons.flash_off_rounded), findsOneWidget);
      expect(find.byIcon(Icons.grid_on_rounded), findsOneWidget);
      expect(find.byIcon(Icons.flip_camera_ios_rounded), findsOneWidget);
      expect(find.byKey(const Key('memories_button')), findsOneWidget);
      expect(find.byKey(const Key('shutter_button')), findsOneWidget);
    });

    testWidgets('Tapping shutter button captures photo and opens Review Studio', (tester) async {
      tester.view.physicalSize = const Size(800, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CampusCameraScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap shutter
      await tester.tap(find.byKey(const Key('shutter_button')));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Check Review Studio is now visible
      expect(find.text('Campus Geotag Studio'), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
      expect(find.text('Download'), findsOneWidget);
      expect(find.text('Share Real-Time Location & Photo'), findsOneWidget);
      expect(find.text('Retake / Back to Viewfinder'), findsOneWidget);

      // Tap Share button to open location share modal
      await tester.ensureVisible(find.text('Share Real-Time Location & Photo'));
      await tester.tap(find.text('Share Real-Time Location & Photo'));
      await tester.pumpAndSettle();

      expect(find.text('Share Real-Time Campus Location'), findsOneWidget);
      expect(find.textContaining('Exact GPS:'), findsOneWidget);
      expect(find.text('Copy Location & Google Maps Link'), findsOneWidget);
      expect(find.text('Post to Kampuzz Community Updates'), findsOneWidget);
    });

    testWidgets('Tapping Landmark picker chip opens landmark selector', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CampusCameraScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap landmark selector pill in HUD
      await tester.tap(find.byKey(const Key('landmark_picker_pill')));
      await tester.pumpAndSettle();

      // Bottom sheet with landmarks list should appear
      expect(find.text('Fetch Live Campus Location'), findsOneWidget);
      expect(find.textContaining('Central Library'), findsOneWidget);
      expect(find.textContaining('Open Air Theatre'), findsOneWidget);

      // Select Central Library
      await tester.tap(find.textContaining('Central Library'));
      await tester.pumpAndSettle();

      // Should update location to Central Library
      expect(find.textContaining('Central Library'), findsWidgets);
    });

    testWidgets('Tapping Memories gallery icon opens Saved Memories drawer', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CampusCameraScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap Memories button
      await tester.tap(find.byKey(const Key('memories_button')));
      await tester.pumpAndSettle();

      // Verify Memories BottomSheet
      expect(find.text('Campus Memories Gallery'), findsOneWidget);
      expect(find.textContaining('Saved Geotagged Photos'), findsOneWidget);
    });
  });
}
