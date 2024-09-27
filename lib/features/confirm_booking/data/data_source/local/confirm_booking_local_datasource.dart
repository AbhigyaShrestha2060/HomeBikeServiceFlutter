import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/local/hive_service.dart';
import 'package:final_assignment/features/confirm_booking/data/model/confirm_booking_api_model.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmBookingLocalDataSourceProvider =
    Provider((ref) => ConfirmBookingLocalDataSource(
          hiveService: ref.read(hiveserviceProvider),
          confirmBookingApiModel: ref.read(confirmBookingApiModelProvider),
        ));

class ConfirmBookingLocalDataSource {
  final HiveService hiveService;
  final ConfirmBookingApiModel confirmBookingApiModel;

  ConfirmBookingLocalDataSource({
    required this.hiveService,
    required this.confirmBookingApiModel,
  });

  Future<Either<Failure, bool>> saveBookingsInHive(
      List<ConfirmBookingEntity> bookings) async {
    try {
      await hiveService.saveUserBookings(bookings);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<List<ConfirmBookingEntity>> getBookingsFromHive() async {
    return await hiveService.getUserBookings();
  }
}
