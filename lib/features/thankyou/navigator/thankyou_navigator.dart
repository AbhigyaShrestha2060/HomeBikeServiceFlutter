import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/thankyou/view/thankyou.dart';
import 'package:final_assignment/features/home/presentation/navigator/home_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final thankYouNavigatorProvider = Provider<ThankYouNavigator>((ref) {
  return ThankYouNavigator();
});

class ThankYouNavigator with HomeViewRoute {}

mixin ThankyouRoute {
  openThankyouView() {
    NavigateRoute.pushRoute(const SuccessScreen());
  }
}
