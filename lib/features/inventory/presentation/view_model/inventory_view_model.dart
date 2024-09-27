import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/inventory/presentation/state/inventory_state.dart';
import 'package:final_assignment/features/khalti/domain/usecases/khalti_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigator/booking_navigator.dart';

final inventoryViewModelProvider =
    StateNotifierProvider<InventoryViewModel, InventoryState>((ref) {
  return InventoryViewModel(
    ref.watch(khaltiUsecaseProvider),
    ref.watch(bookingViewNavigatorProvider),
  );
});

class InventoryViewModel extends StateNotifier<InventoryState> {
  InventoryViewModel(this.khaltiUsecase,this.navigator) : super(InventoryState.initial());

  void updateState(InventoryState state) {
    state = state.copyWith();
  }

  final KhaltiUsecase khaltiUsecase;
  final BookingViewNavigator navigator;

  initializeKhalti(List<ConfirmBookingEntity> entity ,double amount) async {
    state = state.copyWith(isLoading: true);
    final result = await khaltiUsecase.initializeKhalti(itemId: entity ,totalPrice:amount,);
    result.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      state = state.copyWith(
        isLoading: false,
      );
      navigator.openKhaltiView(
        r,amount
      );
    });
  }
//
}
