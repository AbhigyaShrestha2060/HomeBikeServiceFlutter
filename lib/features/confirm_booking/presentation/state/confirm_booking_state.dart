import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';

class ConfirmBookingState {
  final List<ConfirmBookingEntity> bikes;
  final bool isLoading;
  final String? error;
  final bool fetchLoading;
  final String? fetchError;

  ConfirmBookingState({
    required this.bikes,
    required this.isLoading,
    required this.error,
    required this.fetchLoading,
    this.fetchError,
  });

  factory ConfirmBookingState.initial() {
    return ConfirmBookingState(
      bikes: [],
      isLoading: false,
      error: null,
      fetchLoading: false,
      fetchError: null,
    );
  }

  ConfirmBookingState copyWith({
    List<ConfirmBookingEntity>? bikes,
    bool? isLoading,
    String? error,
    bool? fetchLoading,
    String? fetchError,
  }) {
    return ConfirmBookingState(
      bikes: bikes ?? this.bikes,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      fetchLoading: fetchLoading ?? this.fetchLoading,
      fetchError: fetchError ?? this.fetchError,
    );
  }
}
