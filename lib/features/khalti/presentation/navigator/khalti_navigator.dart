import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/khalti/presentation/view/khalti_pay_view.dart';
import 'package:final_assignment/features/payment_success/presentation/navigator/payment_success_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final khaltiViewNavigatorProvider = Provider<KhaltiViewNavigator>((ref) {
  return KhaltiViewNavigator();
});

class KhaltiViewNavigator with PaymentSuccessViewRoute {}

mixin KhaltiViewRoute {
  void openKhaltiView(
      String pidx, double amount) {
    NavigateRoute.pushRoute(
        KhaltiSDKDemo(pidx: pidx, amount: amount));
  }
}
