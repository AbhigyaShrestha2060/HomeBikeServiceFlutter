import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/change_password/presentation/view/change_password_view.dart';
import 'package:final_assignment/features/profile/presentation/navigator/profile_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordViewNavigatorProvider =
    Provider<ChangePasswordViewNavigator>((ref) {
  return ChangePasswordViewNavigator();
});

class ChangePasswordViewNavigator with ProfileRoute {}

mixin ChangePasswordViewRoute {
  openChangePasswordView() {
    NavigateRoute.pushRoute(const ChangePasswordView());
  }
}
