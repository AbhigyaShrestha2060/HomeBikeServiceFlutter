import 'package:final_assignment/features/khalti/presentation/navigator/khalti_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingViewNavigatorProvider = Provider<BookingViewNavigator>((ref) {
  return BookingViewNavigator();
});

class BookingViewNavigator with KhaltiViewRoute {

}

