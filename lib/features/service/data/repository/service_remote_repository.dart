import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/service/data/data_source/remote/service_api_datasource.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:final_assignment/features/service/domain/repository/i_service_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceRemoteRepositoryProvider = Provider(
  (ref) => ServiceRemoteRepository(
    serviceRemoteDatasource: ref.read(
      serviceRemoteDatasourceProvider,
    ),
  ),
);

class ServiceRemoteRepository implements IServiceRepository {
  final ServiceRemoteDatasource serviceRemoteDatasource;

  ServiceRemoteRepository({
    required this.serviceRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<BikeListEntity>>> getallBikes() {
    return serviceRemoteDatasource.getAllBikes();
  }

  @override
  Future<Either<Failure, List<BikeListEntity>>> getBikeByModel() {
    return serviceRemoteDatasource.getBikeByModel();
  }

  @override
  Future<Either<Failure, List<BikeListEntity>>> paginationBike(
      int page, int limit) {
    return serviceRemoteDatasource.paginationBike(page: page, limit: limit);
  }
}
