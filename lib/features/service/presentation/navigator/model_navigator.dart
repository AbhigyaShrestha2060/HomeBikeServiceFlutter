import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/confirm_booking/presentation/navigator/Confirm_booking_navigator.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:final_assignment/features/service/presentation/navigator/service_navigator.dart';
import 'package:final_assignment/features/service/presentation/view/service_model_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modelViewNavigatorProvider = Provider<ServiceModelViewNavigator>((ref) {
  return ServiceModelViewNavigator();
});

class ServiceModelViewNavigator with ServiceViewRoute, ConfirmBookingRoute {}

mixin ServiceModelViewRoute {
  openServiceModelView({
    required List<ServiceEntity> serviceEntity,
  }) {
    NavigateRoute.pushRoute(ServiceModelView(
      serviceEntity: serviceEntity,
    ));
  }
}
