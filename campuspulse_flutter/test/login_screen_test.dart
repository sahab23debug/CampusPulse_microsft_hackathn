import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/auth/presentation/login_screen.dart';
import 'package:campuspulse_flutter/core/widgets/campus_pulse_logo.dart';
import 'package:campuspulse_flutter/core/theme/app_theme.dart';

void main() {
  testWidgets('LoginScreen renders brand elements, inputs, and demo buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      ),
    );

    // Verify Custom Unique Brand Logo
    expect(find.byType(CampusPulseLogo), findsOneWidget);

    // Verify Brand Title & Tagline
    expect(find.text('Kampuzz'), findsOneWidget);
    expect(find.text('QUICK DEMO SIGN-IN (1-TAP)'), findsOneWidget);

    // Verify Demo Action Chips
    expect(find.text('Aarav (Student, IITD)'), findsOneWidget);
    expect(find.text('Priya (Club Admin, DTU)'), findsOneWidget);

    // Verify Inputs
    expect(find.text('College Email ID'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Continue with Google / Institute SSO'), findsOneWidget);
    expect(find.text('Join in 60s →'), findsOneWidget);
  });
}
