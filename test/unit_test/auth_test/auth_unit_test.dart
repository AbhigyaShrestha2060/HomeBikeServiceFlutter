import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/google_service/google_service.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_unit_test.mocks.dart';

@GenerateNiceMocks([
  // Created mock classes for AuthUseCase and LoginViewNavigator So that we dont have to call the original api
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<LocalAuthentication>(),
  MockSpec<GoogleSignInService>()
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;
  late GoogleSignInService mockGoogleSignInService;

  setUp(() {
    mockAuthUseCase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    mockGoogleSignInService = MockGoogleSignInService();
    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
        (ref) => AuthViewModel(
          mockAuthUseCase,
          mockLoginViewNavigator,
          mockGoogleSignInService,
        ),
      )
    ]);
  });

  test('check for the initial state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, null);
  });

  test("Login test with the valid username and passowrd", () async {
    const correctUsername = 'abhigya';
    const correctPassword = 'abhigya123';

    when(mockAuthUseCase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctUsername && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: "invalid ")));
    });

    container
        .read(authViewModelProvider.notifier)
        .loginUser('abhigya', 'abhigya123');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  // Act

  test(
    "Register test with the valid Name, email, phone number and password",
    () async {
      when(mockAuthUseCase.registerUser(any)).thenAnswer((innovation) {
        final auth = innovation.positionalArguments[0] as AuthEntity;
        return Future.value(
          auth.fullName.isNotEmpty &&
                  auth.email.isNotEmpty &&
                  auth.phoneNumber.isNotEmpty &&
                  auth.password!.isNotEmpty
              ? const Right(true)
              : Left(
                  Failure(error: 'Invalid'),
                ),
        );
      });
      await container
          .read(authViewModelProvider.notifier)
          .registerUser(const AuthEntity(
            fullName: "Abhigya Shrestha",
            email: "abhigyashrestha730@gmail.com",
            phoneNumber: "9844642649",
            password: "abhigya12",
          ));

      final state = container.read(authViewModelProvider);

      // Assert
      expect(state.isLoading, false);
      expect(state.error, null);
    },
  );
  // test('Fingerprint login test', () async {
  //   // Arrange
  //   final mockLocalAuthentication = MockLocalAuthentication();
  //   final mockAuthUseCase = MockAuthUseCase();
  //   final mockNavigator = MockLoginViewNavigator();

  //   final authViewModel = AuthViewModel(
  //     mockAuthUseCase,
  //     mockNavigator,
  //     mockLocalAuthentication,
  //   );

  //   when(mockLocalAuthentication.authenticate(
  //     localizedReason: anyNamed('localizedReason'),
  //     options: anyNamed('options'),
  //   )).thenAnswer((_) async => true);

  //   when(mockAuthUseCase.fingerPrintLogin())
  //       .thenAnswer((_) async => const Right(true));

  //   // Act
  //   await authViewModel.fingerPrintLogin();

  //   // Assert
  //   verifyNever(mockNavigator.openHomeView()).called(0);
  // });
  test(
    'Register new user test with minimal input',
    () async {
      // Arrange
      when(mockAuthUseCase.registerUser(any)).thenAnswer((invocation) {
        final auth = invocation.positionalArguments[0] as AuthEntity;

        return Future.value(
          auth.fullName.isNotEmpty &&
                  auth.email.isNotEmpty &&
                  auth.password!.isNotEmpty &&
                  auth.phoneNumber.isNotEmpty &&
                  auth.email.contains('@') &&
                  auth.email.contains('.') &&
                  auth.phoneNumber.length == 10
              ? const Right(true)
              : Left(
                  Failure(error: 'Invalid details'),
                ),
        );
      });

      // Act
      await container
          .read(authViewModelProvider.notifier)
          .registerUser(const AuthEntity(
            fullName: '', // Empty username
            email: 'test@test.com',
            password: '1234', // Minimal password length
            phoneNumber: '1234567890',
          ));

      final state = container.read(authViewModelProvider);

      // Assert
      expect(state.isLoading, false);
      expect(state.error, 'Invalid details');
    },
  );

  tearDown(() {
    container.dispose();
  });




  test(
    'Register new user test with invalid email',
    () async {
      // Arrange
      when(mockAuthUseCase.registerUser(any)).thenAnswer((invocation) {
        final auth = invocation.positionalArguments[0] as AuthEntity;

        return Future.value(
          auth.fullName.isNotEmpty &&
                  auth.email.isNotEmpty &&
                  auth.password!.isNotEmpty &&
                  auth.phoneNumber.isNotEmpty &&
                  auth.email.contains('@') &&
                  auth.email.contains('.') &&
                  auth.phoneNumber.length == 10
              ? const Right(true)
              : Left(
                  Failure(error: 'Invalid details'),
                ),
        );
      });

      // Act
      await container
          .read(authViewModelProvider.notifier)
          .registerUser(const AuthEntity(
            fullName: 'Test User',
            email: 'test.com', // Invalid email
            password: '12345678',
            phoneNumber: '1234567890',
          ));

      final state = container.read(authViewModelProvider);

      // Assert
      expect(state.isLoading, false);
      expect(state.error, 'Invalid details');
    },
  );



}
