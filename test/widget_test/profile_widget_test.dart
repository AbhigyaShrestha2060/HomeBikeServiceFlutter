import 'package:final_assignment/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileView Widget Tests', () {
    testWidgets('renders ProfileView', (tester) async {
      // Pump the widget tree containing the ProfileView
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: ProfileView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the ProfileView is rendered
      expect(find.byType(ProfileView), findsOneWidget);
    });

    testWidgets('Profile Header displays user information correctly',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: ProfileView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check if the profile header is displayed with placeholder info
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('email@example.com'), findsOneWidget);
    });
  });
}
