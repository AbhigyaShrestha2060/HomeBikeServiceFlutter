import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, void>((ref) {
  final navigator = ref.watch(loginNavigatorProvider);
  return LoginViewModel(navigator, LocalAuthentication());
});

class LoginViewModel extends StateNotifier<void> {
  LoginViewModel(this.navigator, this.auth) : super(null);

  final LoginViewNavigator navigator;
  late LocalAuthentication auth;

  void openRegisterView() {
    navigator.openRegisterView();
  }

  void openForgotPasswordView() {
    navigator.openForgotPasswordView();
  }
}
