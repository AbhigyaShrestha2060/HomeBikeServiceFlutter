import 'package:final_assignment/core/common/snackbar/show_my_snackbar.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/confirm_booking/domain/usecases/confirm_booking_usecase.dart';
import 'package:final_assignment/features/confirm_booking/presentation/navigator/Confirm_booking_navigator.dart';
import 'package:final_assignment/features/confirm_booking/presentation/state/confirm_booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingViewModelProvider =
    StateNotifierProvider<ConfirmBookingViewModel, ConfirmBookingState>(
  (ref) => ConfirmBookingViewModel(
    ref.read(confirmBookingNavigatorProvider),
    ref.read(confirmBookingUseCaseProvider),
  ),
);

class ConfirmBookingViewModel extends StateNotifier<ConfirmBookingState> {
  ConfirmBookingViewModel(
      this.confirmBookingNavigator, this.confirmBookingUseCase)
      : super(ConfirmBookingState.initial());

  final ConfirmBookingNavigator confirmBookingNavigator;
  final ConfirmBookingUseCase confirmBookingUseCase;

  void openThankyou() {
    confirmBookingNavigator.openThankyouView();
  }

  Future<void> addToBooking(ConfirmBookingEntity confirmBookingEntity) async {
    state = state.copyWith(isLoading: true);
    var data = await confirmBookingUseCase.addToBooking(confirmBookingEntity);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false);
        showMySnackBar(message: 'Booked');
        openThankyou();
      },
    );
  }

  Future<void> getBooking() async {
    state = state.copyWith(fetchLoading: true);
    var data = await confirmBookingUseCase.getUserBooking();
    data.fold(
      (l) async {
        state = state.copyWith(fetchLoading: false, fetchError: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (bookings) async {
        state = state.copyWith(
            fetchLoading: false, fetchError: null, bikes: bookings);
      },
    );
  }
}
