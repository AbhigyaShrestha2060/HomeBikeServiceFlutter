import 'package:final_assignment/core/google_service/google_service.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final navigator = ref.watch(loginNavigatorProvider);
  final googleSignInService = ref.watch(googleSignInServiceProvider);
  return AuthViewModel(
      ref.watch(authUseCaseProvider), navigator, googleSignInService);
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUseCase, this.navigator, this.googleSignInService)
      : super(AuthState.initial());

  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;
  final GoogleSignInService googleSignInService;

  Future<void> registerUser(AuthEntity auth) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(auth);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        // showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false);
        // showMySnackBar(message: 'Registered');
      },
    );
  }

  void loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        // showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false);
        // showMySnackBar(
        //     message: 'User Logged In Successfully', color: Colors.green);
        navigator.openHomeView();
      },
    );
  }

  Future<void> fingerPrintLogin() async {
    final LocalAuthentication localAuth;

    localAuth = LocalAuthentication();

    bool authenticated = false;
    try {
      authenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to enable fingerprint',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      // showMySnackBar(
      // message: 'Fingerprint authentication failed', color: Colors.red);
    }

    if (authenticated) {
      authUseCase.fingerPrintLogin().then((data) {
        data.fold(
          (l) {
            // showMySnackBar(message: l.error, color: Colors.red);
          },
          (r) {
            // showMySnackBar(message: "User logged in successfully");
            navigator.openHomeView();
          },
        );
      });
    } else {
      // showMySnackBar(
      // message: 'Fingerprint authentication failed', color: Colors.red);
    }
  }

  Future<void> googleSignIn() async {
    state = state.copyWith(isLoading: true);
    var data = await googleSignInService.signInWithGoogle();
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        // showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        // showMySnackBar(message: "Successfully logged in");
        navigator.openHomeView();
      },
    );
  }
}
