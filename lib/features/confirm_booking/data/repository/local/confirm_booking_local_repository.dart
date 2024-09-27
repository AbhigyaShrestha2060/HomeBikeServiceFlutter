import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/confirm_booking/data/data_source/local/confirm_booking_local_datasource.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/confirm_booking/domain/repository/i_confirm_booking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingLocalRepositoryProvider = Provider(
  (ref) => ConfirmBookingLocalRepository(
    confirmBookingLocalDataSource:
        ref.read(confirmBookingLocalDataSourceProvider),
  ),
);

class ConfirmBookingLocalRepository implements IConfirmBookingRepository {
  final ConfirmBookingLocalDataSource confirmBookingLocalDataSource;

  ConfirmBookingLocalRepository({required this.confirmBookingLocalDataSource});

  @override
  Future<Either<Failure, bool>> addToBooking(
      ConfirmBookingEntity bookingEntity) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveBookingsInHive(
      List<ConfirmBookingEntity> bookings) {
    return confirmBookingLocalDataSource.saveBookingsInHive(bookings);
  }

  @override
  Future<Either<Failure, List<ConfirmBookingEntity>>> getBooking() {
    throw UnimplementedError();
  }

  @override
  Future<List<ConfirmBookingEntity>> getBookingsFromHive() {
    return confirmBookingLocalDataSource.getBookingsFromHive();
  }

  @override
  Future<Either<Failure, bool>> changeStatus(String bookingId) {
    // TODO: implement changeStatus
    throw UnimplementedError();
  }
}
