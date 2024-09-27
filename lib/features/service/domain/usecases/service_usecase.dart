import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:final_assignment/features/service/domain/repository/i_service_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceUsecaseProvider = Provider(
  (ref) => ServiceUsecase(
    iServiceRepository: ref.read(
      serviceRepositoryProvider,
    ),
  ),
);

class ServiceUsecase {
  final IServiceRepository iServiceRepository;

  ServiceUsecase({
    required this.iServiceRepository,
  });

  Future<Either<Failure, List<BikeListEntity>>> getAllBikes() {
    return iServiceRepository.getallBikes();
  }

  Future<Either<Failure, List<BikeListEntity>>> paginationBike(
      int page, int limit) {
    return iServiceRepository.paginationBike(page, limit);
  }

  Future<Either<Failure, List<BikeListEntity>>> getBikeByModel() {
    return iServiceRepository.getBikeByModel();
  }
}
