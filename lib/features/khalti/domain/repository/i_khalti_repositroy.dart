import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/khalti_remote_repository.dart';

final ikhaltiRepositoryProvider = Provider<IKhaltiRepository>(
  (ref) {
    return ref.read(khaltiRemoteRepositoryProvider);
  },
);

abstract class IKhaltiRepository {
  Future<Either<Failure, String>> completeKhalti(KhaltiEntity entity);

  Future<Either<Failure, String>> initializeKhalti(
      {required  List<ConfirmBookingEntity> itemId, required double totalPrice});
}
