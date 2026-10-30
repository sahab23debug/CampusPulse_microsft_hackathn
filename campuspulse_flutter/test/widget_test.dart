import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campuspulse_flutter/features/bunk_meter/presentation/bunk_meter_screen.dart';
import 'package:campuspulse_flutter/core/theme/app_theme.dart';

void main() {
  testWidgets('BunkMeterScreen renders attendance and formulas correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const BunkMeterScreen(),
        ),
      ),
    );

    // Verify Title and Cards
    expect(find.text('Bunk-Meter'), findsOneWidget);
    expect(find.text('OVERALL ATTENDANCE'), findsOneWidget);
    expect(find.text('Safe Bunks'), findsOneWidget);
    expect(find.text('What-If Attendance Simulator'), findsOneWidget);
    expect(find.text('Database Management Systems'), findsOneWidget);
  });
}
