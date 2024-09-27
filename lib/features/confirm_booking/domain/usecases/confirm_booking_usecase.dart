import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/confirm_booking/data/repository/local/confirm_booking_local_repository.dart';
import 'package:final_assignment/features/confirm_booking/data/repository/remote/confirm_booking_remote_repository.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/confirm_booking/domain/repository/i_confirm_booking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingUseCaseProvider = Provider<ConfirmBookingUseCase>(
  (ref) {
    return ConfirmBookingUseCase(
      ref.watch(confirmBookingLocalRepositoryProvider),
      confirmBookingRepository:
          ref.watch(confirmBookingRemoteRepositoryProvider),
      userSharedprefs: ref.watch(userSharedPrefsProvider),
    );
  },
);

class ConfirmBookingUseCase {
  final IConfirmBookingRepository confirmBookingRepository;
  final UserSharedPrefs userSharedprefs;
  final IConfirmBookingRepository confirmBookingLocalRepository;

  ConfirmBookingUseCase(
    this.confirmBookingLocalRepository, {
    required this.confirmBookingRepository,
    required this.userSharedprefs,
  });

  Future<Either<Failure, bool>> addToBooking(
      ConfirmBookingEntity? confirmBookingEntity) {
    return confirmBookingRepository.addToBooking(confirmBookingEntity!);
  }

  Future<Either<Failure, List<ConfirmBookingEntity>>> getUserBooking() {
    return confirmBookingRepository.getBooking();
  }

  Future<void> saveBookingsInHive(List<ConfirmBookingEntity> bookings) async {
    await confirmBookingLocalRepository.saveBookingsInHive(bookings);
  }

  Future<List<ConfirmBookingEntity>> getBookingsFromHive() async {
    return await confirmBookingLocalRepository.getBookingsFromHive();
  }
  Future<Either<Failure, bool>> changeStatus(String bookingId) {
    return confirmBookingRepository.changeStatus(bookingId);
  }
}
