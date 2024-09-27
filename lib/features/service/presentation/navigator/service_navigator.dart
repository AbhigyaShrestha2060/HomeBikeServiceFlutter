import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/confirm_booking/presentation/navigator/Confirm_booking_navigator.dart';
import 'package:final_assignment/features/service/presentation/navigator/model_navigator.dart';
import 'package:final_assignment/features/service/presentation/view/service_category_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceViewNavigatorProvider = Provider<ServiceViewNavigator>((ref) {
  return ServiceViewNavigator();
});

class ServiceViewNavigator with ServiceModelViewRoute, ConfirmBookingRoute {
  void openServiceView() {}
}

mixin ServiceViewRoute {
  openServiceView() {
    NavigateRoute.pushRoute(const ServiceCategoryView());
  }
}
