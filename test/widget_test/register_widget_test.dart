import 'package:final_assignment/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("RegisterView Widget Tests", () {
    testWidgets('renders RegisterView', (tester) async {
      // Pump the widget tree containing the RegisterView
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the RegisterView is rendered
      expect(find.byType(RegisterView), findsOneWidget);
    });

    testWidgets('Register form fields and button interaction', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the form fields are present
      expect(
          find.byType(TextFormField),
          findsNWidgets(
              5)); // Full Name, Email, Phone Number, Password, Confirm Password

      // Enter text into each field
      await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
      await tester.enterText(
          find.byType(TextFormField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
      await tester.enterText(find.byType(TextFormField).at(3), 'Test@123');
      await tester.enterText(find.byType(TextFormField).at(4), 'Test@123');

      // Tap on the Sign Up button
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Verify that the Sign Up button is still present
      expect(find.text('Sign Up'), findsOneWidget);

      // Additional verification could include checking that the form submitted properly
    });

    testWidgets('Sign In prompt navigation', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the 'Sign in' button is present
      expect(find.text('Sign in'), findsOneWidget);

      // Tap on the 'Sign in' button
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();

      // Verify that navigation to the LoginView occurred (mock or check navigation)
    });
  });
}
