import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/service/data/dto/service_dto.dart';
import 'package:final_assignment/features/service/data/model/bike_list_model.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceRemoteDatasourceProvider =
    Provider<ServiceRemoteDatasource>((ref) {
  final dio = ref.read(httpServiceProvider);
  final bikeListModel = ref.read(bikeListModelProvider);
  final userSharedPrefs = ref.read(userSharedPrefsProvider);

  return ServiceRemoteDatasource(
    dio: dio,
    bikeListModel: bikeListModel,
    userSharedPrefs: userSharedPrefs,
  );
});

class ServiceRemoteDatasource {
  final Dio dio;
  final BikeListModel bikeListModel;
  final UserSharedPrefs userSharedPrefs;

  ServiceRemoteDatasource({
    required this.dio,
    required this.bikeListModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<BikeListEntity>>> getAllBikes() async {
    try {
      var response = await dio.get(ApiEndPoints.getAllBikes);
      if (response.statusCode == 201) {
        ServiceDto serviceDto = ServiceDto.fromJson(response.data);
        return Right(bikeListModel.toEntityList(serviceDto.bikes));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<BikeListEntity>>> getBikeByModel() async {
    try {
      var response = await dio.get(ApiEndPoints.getBikeByModel);
      if (response.statusCode == 200) {
        ServiceDto serviceDto = ServiceDto.fromJson(response.data);
        return Right(bikeListModel.toEntityList(serviceDto.bikes));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<BikeListEntity>>> paginationBike(
      {required int page, required int limit}) async {
    try {
      final token = await userSharedPrefs.getUserToken();
      token.fold((l) => throw Failure(error: l.error), (r) => r);
      final response = await dio.get(
        ApiEndPoints.paginationBike,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        options: Options(
          headers: {
            'authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 201) {
        final serviceDto = ServiceDto.fromJson(response.data);
        return Right(bikeListModel.toEntityList(serviceDto.bikes));
      }
      return Left(
        Failure(
          error: response.statusMessage.toString(),
          statusCode: response.statusCode.toString(),
        ),
      );
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }
}
