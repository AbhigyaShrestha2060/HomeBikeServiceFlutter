import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/confirm_booking/presentation/view/confirm_booking_view.dart';
import 'package:final_assignment/features/thankyou/navigator/thankyou_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingNavigatorProvider =
    Provider<ConfirmBookingNavigator>((ref) {
  return ConfirmBookingNavigator();
});

class ConfirmBookingNavigator with ThankyouRoute {}

mixin ConfirmBookingRoute {
  openConfirmBooking({required String id, required String bikeName}) {
    NavigateRoute.pushRoute(ConfirmBookingView(
      id: id,
      bikeName: bikeName,
    ));
  }
}
