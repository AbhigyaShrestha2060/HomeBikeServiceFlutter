import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';

class InventoryState {
  final bool isLoading;
  final String? error;
  final ConfirmBookingEntity? bookingEntity;

  InventoryState({
    required this.isLoading,
    required this.error,
    required this.bookingEntity,
  });

  InventoryState copyWith({
    bool? isLoading,
    String? error,
    ConfirmBookingEntity? bookingEntity,
  }) {
    return InventoryState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      bookingEntity: bookingEntity ?? this.bookingEntity,
    );
  }

  factory InventoryState.initial() {
    return InventoryState(
      isLoading: false,
      error: null,
      bookingEntity: null,
    );
  }
}
