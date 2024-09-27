import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/confirm_booking/data/model/confirm_booking_api_model.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingRemoteDataSourceProvider =
    Provider<ConfirmBookingRemoteDataSource>((ref) {
  final dio = ref.watch(httpServiceProvider);
  final confirmBookingModel = ref.watch(confirmBookingApiModelProvider);
  final userSharedPrefs = ref.watch(userSharedPrefsProvider);
  return ConfirmBookingRemoteDataSource(
      dio: dio,
      confirmBookingApiModel: confirmBookingModel,
      userSharedPrefs: userSharedPrefs);
});

class ConfirmBookingRemoteDataSource {
  final Dio dio;
  final ConfirmBookingApiModel confirmBookingApiModel;
  final UserSharedPrefs userSharedPrefs;

  ConfirmBookingRemoteDataSource(
      {required this.dio,
      required this.confirmBookingApiModel,
      required this.userSharedPrefs});

  Future<Either<Failure, bool>> addToBooking(
      ConfirmBookingEntity bookingEntity) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r,
      );
      Response response = await dio.post(
        ApiEndPoints.addToBookings,
        data: ConfirmBookingApiModel.fromEntity(bookingEntity).toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<ConfirmBookingEntity>>> getBooking() async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r,
      );
      Response response = await dio.get(
        ApiEndPoints.getBookings,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return Right(
            response.data['users'].map<ConfirmBookingEntity>((booking) {
          return ConfirmBookingEntity(
            bikeId: booking['_id'],
            serviceEntity: ServiceEntity(
              bikeName: booking['bikeId']['bikeName'] ?? '',
              bikeModel: booking['bikeId']['bikeModel'] ?? '',
              bikePrice: booking['bikeId']['bikePrice'] ?? '',
              bikeImage: booking['bikeId']['bikeImage'] ?? '',
            ),
            bikeChasisNumber: '',
            bikeNumber: booking['bikeNumber'],
            bikeDescription: booking['bikeDescription'],
            bookingTime: '',
            bookingDate: DateTime.now(),
            status: booking['status'],
            bookingAddress: booking['bookingAddress'],
            total: booking['total'].toDouble(),
          );
        }).toList());
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> changeStatus(String bookingId) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r);
      Response response = await dio.put(ApiEndPoints.changeStatus + bookingId,
          data: {'status': 'completed'},
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }
}
