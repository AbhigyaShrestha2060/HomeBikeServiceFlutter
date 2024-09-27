import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/confirm_booking/domain/usecases/confirm_booking_usecase.dart';
import 'package:final_assignment/features/khalti/domain/usecases/khalti_usecase.dart';
import 'package:final_assignment/features/khalti/presentation/navigator/khalti_navigator.dart';
import 'package:final_assignment/features/khalti/presentation/viewmodel/khalti_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'khalti_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<KhaltiUsecase>(),
  MockSpec<KhaltiViewNavigator>(),
  MockSpec<ConfirmBookingUseCase>(),
])
void main() {
  late MockKhaltiUsecase mockKhaltiUsecase;
  late MockKhaltiViewNavigator mockKhaltiViewNavigator;
  late MockConfirmBookingUseCase mockConfirmBookingUseCase;
  late KhaltiViewModel khaltiViewModel;

  setUp(() {
    mockKhaltiUsecase = MockKhaltiUsecase();
    mockKhaltiViewNavigator = MockKhaltiViewNavigator();
    mockConfirmBookingUseCase = MockConfirmBookingUseCase();

    khaltiViewModel = KhaltiViewModel(
      khaltiUsecase: mockKhaltiUsecase,
      navigator: mockKhaltiViewNavigator,
      confirmBooking: mockConfirmBookingUseCase,
    );
  });

  group('KhaltiViewModel Tests', () {
    test('Initial state should be correct', () {
      expect(khaltiViewModel.state.isLoading, false);
      expect(khaltiViewModel.state.error, null);
    });

    test('changeStatus should handle failure', () async {
      when(mockConfirmBookingUseCase.changeStatus('bookingId'))
          .thenAnswer((_) async => Left(Failure(error: 'Error')));

      await khaltiViewModel.changeStatus('bookingId', 'transactionId');

      verify(mockConfirmBookingUseCase.changeStatus('bookingId')).called(1);
      expect(khaltiViewModel.state.isLoading, false);
      expect(khaltiViewModel.state.error, 'Error');
    });

    test('openPaymentSuccessView should call navigator method', () {
      khaltiViewModel.openPaymentSuccessView('transactionId');

      verify(mockKhaltiViewNavigator.openPaymentSuccessView('transactionId'))
          .called(1);
    });
  });
}
