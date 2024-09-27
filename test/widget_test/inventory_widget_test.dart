import 'package:final_assignment/features/inventory/presentation/view/inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InventoryView Widget Tests', () {
    testWidgets('renders InventoryView and displays the title', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: InventoryView(),
          ),
        ),
      );

      // Artificially advance time to ensure async tasks complete
      await tester.pump();

      // Verify that the InventoryView is rendered with the correct title
      expect(find.text('My Bookings'), findsOneWidget);
    });

    testWidgets('displays loading indicator while fetching bookings',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: InventoryView(),
          ),
        ),
      );

      // Since the data is fetched asynchronously, expect a CircularProgressIndicator
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
