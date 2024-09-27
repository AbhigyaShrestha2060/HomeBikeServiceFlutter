import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/service/data/repository/service_remote_repository.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceRepositoryProvider = Provider((ref) {
  return ref.watch(serviceRemoteRepositoryProvider);
});

abstract class IServiceRepository {
  Future<Either<Failure, List<BikeListEntity>>> getallBikes();
  Future<Either<Failure, List<BikeListEntity>>> paginationBike(
      int page, int limit);

  Future<Either<Failure, List<BikeListEntity>>> getBikeByModel();
}
