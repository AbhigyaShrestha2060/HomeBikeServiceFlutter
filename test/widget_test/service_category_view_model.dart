import 'package:final_assignment/features/service/presentation/view/service_category_view.dart';
import 'package:final_assignment/features/service/presentation/widgets/bike_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders ServiceCategoryView and displays the title',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ServiceCategoryView(),
        ),
      ),
    );

    expect(find.text('Select Your Bike'), findsOneWidget);
  });

  testWidgets('displays loading indicator while fetching bikes',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ServiceCategoryView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays empty state when no bikes found',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ServiceCategoryView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('No Bike Found'), findsOneWidget);
    expect(find.text('Add a new bike model or try a different search'),
        findsOneWidget);
  });

  testWidgets('displays bike list when data is available',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ServiceCategoryView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Assuming there are bikes in the list
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(BikeCard), findsWidgets);
  });

  testWidgets('handles search bar input', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ServiceCategoryView(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'search query');
    await tester.pumpAndSettle();
  });
}
