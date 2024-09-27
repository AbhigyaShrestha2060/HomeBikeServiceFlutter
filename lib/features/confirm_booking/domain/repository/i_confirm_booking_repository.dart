import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/common/provider/connectivity_status.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/confirm_booking/data/repository/local/confirm_booking_local_repository.dart';
import 'package:final_assignment/features/confirm_booking/data/repository/remote/confirm_booking_remote_repository.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingRepositoryProvider = Provider<IConfirmBookingRepository>((ref) {
  final checkConnectivity = ref.watch(connectivityStatusProvider);
  if (checkConnectivity == ConnectivityStatus.isConnected) {
    return ref.read(confirmBookingRemoteRepositoryProvider);
  } else {
    return ref.read(confirmBookingLocalRepositoryProvider);
  }
});

abstract class IConfirmBookingRepository {
  Future<Either<Failure, bool>> addToBooking(
      ConfirmBookingEntity bookingEntity);
  Future<Either<Failure, List<ConfirmBookingEntity>>> getBooking();
  Future<Either<Failure, bool>> saveBookingsInHive(
    List<ConfirmBookingEntity> bookings,
  );
  Future<List<ConfirmBookingEntity>> getBookingsFromHive();
  Future<Either<Failure, bool>> changeStatus(String bookingId);
}
