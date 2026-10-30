import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/home_feed/presentation/home_feed_screen.dart';
import '../../features/study_hub/presentation/study_hub_screen.dart';
import '../../features/quiz_arena/presentation/quiz_arena_screen.dart';
import '../../features/community/presentation/community_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/connect/presentation/connect_screen.dart';
import '../../features/rental/presentation/rental_screen.dart';
import '../../features/bunk_meter/presentation/bunk_meter_screen.dart';
import '../../features/timetable/presentation/timetable_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/sam_ai/presentation/sam_copilot_screen.dart';
import '../../features/chat/presentation/chat_detail_screen.dart';
import '../../features/camera/presentation/campus_camera_screen.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../widgets/responsive_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final List<RouteBase> _appRoutes = [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/onboarding',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: '/connect',
    builder: (context, state) => const ConnectScreen(),
  ),
  GoRoute(
    path: '/rent',
    builder: (context, state) => const RentalScreen(),
  ),
  GoRoute(
    path: '/bunk-meter',
    builder: (context, state) => const BunkMeterScreen(),
  ),
  GoRoute(
    path: '/timetable',
    builder: (context, state) => const TimetableScreen(),
  ),
  GoRoute(
    path: '/sam-copilot',
    builder: (context, state) {
      final mediaUrl = state.uri.queryParameters['mediaUrl'];
      final landmark = state.uri.queryParameters['landmark'];
      return SamCopilotScreen(
        initialMediaUrl: mediaUrl,
        initialLandmark: landmark,
      );
    },
  ),
  GoRoute(
    path: '/chat/:id',
    builder: (context, state) {
      final id = state.pathParameters['id'] ?? 'conv_sahab';
      return ChatDetailScreen(conversationId: id);
    },
  ),
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return ResponsiveScaffold(child: child);
    },
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomeFeedScreen(),
        ),
      ),
      GoRoute(
        path: '/study',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: StudyHubScreen(),
        ),
      ),
      GoRoute(
        path: '/camera',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CampusCameraScreen(),
        ),
      ),
      GoRoute(
        path: '/arena',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: QuizArenaScreen(),
        ),
      ),
      GoRoute(
        path: '/community',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CommunityScreen(),
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfileScreen(),
        ),
      ),
    ],
  ),
];

/// Listenable that notifies GoRouter when the Riverpod AuthState changes
class AuthRouterNotifier extends ChangeNotifier {
  AuthRouterNotifier(Ref ref) {
    ref.listen<AuthState>(authControllerProvider, (_, __) {
      notifyListeners();
    });
  }
}

/// Riverpod provider for GoRouter with reactive authentication guards
final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = AuthRouterNotifier(ref);
  ref.onDispose(authNotifier.dispose);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final isLoggedIn = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';
      final isOnboarding = state.matchedLocation == '/onboarding';

      // Guard: Unauthenticated users are redirected to /login
      if (!isLoggedIn) {
        return (isLoggingIn || isOnboarding) ? null : '/login';
      }

      // Guard: Authenticated users visiting /login are redirected to /home
      if (isLoggedIn && isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: _appRoutes,
  );
});

/// Static fallback router for direct standalone references
final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: _appRoutes,
);
