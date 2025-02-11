import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart';
import 'package:final_assignment/features/khalti/domain/repository/i_khalti_repositroy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../confirm_booking/domain/entity/confirm_booking_entity.dart';

final khaltiUsecaseProvider = Provider(
  (ref) => KhaltiUsecase(
    khaltiRepository: ref.read(ikhaltiRepositoryProvider),
  ),
);

class KhaltiUsecase {
  final IKhaltiRepository khaltiRepository;

  KhaltiUsecase({
    required this.khaltiRepository,
  });

  Future<Either<Failure, String>> completeKhalti(KhaltiEntity entity) {
    return khaltiRepository.completeKhalti(entity);
  }

  Future<Either<Failure, String>> initializeKhalti(
      {required  List<ConfirmBookingEntity> itemId, required double totalPrice}) {
    return khaltiRepository.initializeKhalti(
      itemId: itemId,
      totalPrice: totalPrice,
    );
  }
}
