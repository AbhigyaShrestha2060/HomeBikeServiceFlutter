import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/confirm_booking/data/data_source/remote/confirm_booking_remote_datasource.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/confirm_booking/domain/repository/i_confirm_booking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingRemoteRepositoryProvider = Provider(
  (ref) => ConfirmBookingRemoteRepository(
    confirmBookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider),
  ),
);

class ConfirmBookingRemoteRepository implements IConfirmBookingRepository {
  final ConfirmBookingRemoteDataSource confirmBookingRemoteDataSource;

  ConfirmBookingRemoteRepository(
      {required this.confirmBookingRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addToBooking(
      ConfirmBookingEntity bookingEntity) {
    return confirmBookingRemoteDataSource.addToBooking(bookingEntity);
  }

  @override
  Future<Either<Failure, List<ConfirmBookingEntity>>> getBooking() {
    return confirmBookingRemoteDataSource.getBooking();
  }

  @override
  Future<Either<Failure, bool>> saveBookingsInHive(
      List<ConfirmBookingEntity> bookings) {
    throw UnimplementedError();
  }

  @override
  Future<List<ConfirmBookingEntity>> getBookingsFromHive() {
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, bool>> changeStatus(String bookingId) {
    return confirmBookingRemoteDataSource.changeStatus(bookingId);
  }
}
