import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("LoginView Widget Tests", () {
    testWidgets('renders LoginView', (tester) async {
      // Pump the widget tree containing the LoginView
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the LoginView is rendered
      expect(find.byType(LoginView), findsOneWidget);
    });

    testWidgets('Login form field and button interaction', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the form fields are present
      expect(find.byType(TextFormField),
          findsNWidgets(2)); // Email and Password fields

      // Enter text into email and password fields
      await tester.enterText(
          find.byType(TextFormField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'Test@123');

      // Tap on the login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify that the login button is still present
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Sign Up prompt navigation', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the 'Sign up' button is present
      expect(find.text('Sign up'), findsOneWidget);

      // Tap on the 'Sign up' button
      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();

      // Verify that the navigation to the RegisterView occurred (mock or check navigation)
      // In a real scenario, this might involve verifying a different screen or a callback.
    });

    testWidgets('FingerPrint login button interaction', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the fingerprint icon is present
      expect(find.byIcon(Icons.fingerprint), findsOneWidget);

      // Tap on the fingerprint icon
      await tester.tap(find.byIcon(Icons.fingerprint));
      await tester.pumpAndSettle();

      // Verify that some action occurs (mocked, could check navigation or callback execution)
    });
  });
}
