import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/home_feed/presentation/home_feed_screen.dart';
import 'package:campuspulse_flutter/core/theme/app_theme.dart';

final Uint8List _kTransparentImage = Uint8List.fromList(<int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
  0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
  0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
  0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
  0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
]);

class _TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _FakeHttpClient();
  }
}

class _FakeHttpClient implements HttpClient {
  @override
  bool autoUncompress = true;
  @override
  Duration? connectionTimeout;
  @override
  Duration idleTimeout = const Duration(seconds: 15);
  @override
  int? maxConnectionsPerHost;
  @override
  String? userAgent;

  @override
  void addCredentials(Uri url, String realm, HttpClientCredentials credentials) {}
  @override
  void addProxyCredentials(String host, int port, String realm, HttpClientCredentials credentials) {}
  @override
  set authenticate(Future<bool> Function(Uri url, String scheme, String? realm)? f) {}
  @override
  set authenticateProxy(Future<bool> Function(String host, int port, String scheme, String? realm)? f) {}
  @override
  set badCertificateCallback(bool Function(X509Certificate cert, String host, int port)? callback) {}
  @override
  set findProxy(String Function(Uri url)? f) {}

  @override
  void close({bool force = false}) {}

  @override
  Future<HttpClientRequest> getUrl(Uri url) => openUrl('GET', url);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async {
    return _FakeHttpClientRequest();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpClientRequest implements HttpClientRequest {
  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  Future<HttpClientResponse> close() async {
    return _FakeHttpClientResponse();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpHeaders implements HttpHeaders {
  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {}
  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {}
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHttpClientResponse extends Stream<List<int>> implements HttpClientResponse {
  @override
  int get statusCode => 200;
  @override
  int get contentLength => _kTransparentImage.length;
  @override
  HttpClientResponseCompressionState get compressionState => HttpClientResponseCompressionState.notCompressed;
  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.fromIterable([_kTransparentImage]).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = _TestHttpOverrides();

  Widget createHomeScreen() {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const HomeFeedScreen(),
      ),
    );
  }

  group('HomeFeedScreen Event List and Add Event Tests', () {
    testWidgets('Renders Main Screen with Feed view and action buttons', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pump();

      // Brand and AppBar verification
      expect(find.text('Kampuzz'), findsOneWidget);
      expect(find.byKey(const Key('toggle_view_mode_button')), findsOneWidget);
      expect(find.byKey(const Key('appbar_add_event_button')), findsOneWidget);

      // Verify Swipe Feed is active initially
      expect(find.byKey(const Key('events_page_view_feed')), findsOneWidget);
      expect(find.textContaining('HackPulse 2026'), findsOneWidget);
    });

    testWidgets('Tapping view mode toggle switches to List Events view', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pump();

      // Tap view mode toggle to switch to List Events
      final toggleBtn = find.byKey(const Key('toggle_view_mode_button'));
      await tester.tap(toggleBtn);
      await tester.pump();

      // Verify List View elements are rendered
      expect(find.byKey(const Key('events_search_input')), findsOneWidget);
      expect(find.byKey(const Key('list_view_add_event_btn')), findsOneWidget);
      expect(find.text('Hackathon'), findsWidgets);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Robotics'), findsWidgets);
      expect(find.textContaining('HackPulse 2026'), findsOneWidget);
      expect(find.textContaining('Acoustic Night'), findsOneWidget);
    });

    testWidgets('Search input filters the events list in List View', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pump();

      // Switch to list view
      await tester.tap(find.byKey(const Key('toggle_view_mode_button')));
      await tester.pump();

      // Enter search query
      final searchInput = find.byKey(const Key('events_search_input'));
      await tester.enterText(searchInput, 'RoboWars');
      await tester.pump();

      // RoboWars should be found, others filtered out
      expect(find.textContaining('RoboWars 2026'), findsOneWidget);
      expect(find.textContaining('Acoustic Night'), findsNothing);
    });

    testWidgets('Tapping Add Event opens modal and publishes a new event', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pump();

      // Open Add Event modal from AppBar
      final addBtn = find.byKey(const Key('appbar_add_event_button'));
      await tester.tap(addBtn);
      await tester.pumpAndSettle();

      // Verify Modal fields are visible
      expect(find.text('Add Campus Event'), findsOneWidget);
      expect(find.byKey(const Key('add_event_title_input')), findsOneWidget);
      expect(find.byKey(const Key('add_event_club_input')), findsOneWidget);
      expect(find.byKey(const Key('add_event_venue_input')), findsOneWidget);
      expect(find.byKey(const Key('add_event_description_input')), findsOneWidget);
      expect(find.byKey(const Key('submit_new_event_button')), findsOneWidget);

      // Enter details
      await tester.enterText(find.byKey(const Key('add_event_title_input')), 'Google Cloud Day 2026');
      await tester.enterText(find.byKey(const Key('add_event_club_input')), 'Google Developer Club');
      await tester.enterText(find.byKey(const Key('add_event_venue_input')), 'Auditorium Hall A');
      await tester.enterText(find.byKey(const Key('add_event_description_input')), 'Full day cloud computing and Kubernetes workshop with swag.');
      await tester.pump();

      // Scroll down until the submit button is visible
      await tester.scrollUntilVisible(find.byKey(const Key('submit_new_event_button')), 100, scrollable: find.byType(Scrollable).last);
      await tester.pumpAndSettle();

      // Submit new event
      await tester.tap(find.byKey(const Key('submit_new_event_button')));
      await tester.pumpAndSettle();

      // Verify modal is closed
      expect(find.text('Add Campus Event'), findsNothing);

      // Switch to List View and verify the new event is listed at the top
      await tester.tap(find.byKey(const Key('toggle_view_mode_button')));
      await tester.pump();

      expect(find.text('Google Cloud Day 2026'), findsOneWidget);
      expect(find.textContaining('Google Developer Club'), findsOneWidget);
    });

    testWidgets('Tapping Register button updates registration state', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pump();

      // Switch to list view
      await tester.tap(find.byKey(const Key('toggle_view_mode_button')));
      await tester.pump();

      // Find first Register Now button and tap
      final registerButtons = find.text('Register Now');
      expect(registerButtons, findsWidgets);

      await tester.tap(registerButtons.first);
      await tester.pump();

      // Button should now reflect Registered
      expect(find.text('Registered'), findsWidgets);
    });
  });
}
