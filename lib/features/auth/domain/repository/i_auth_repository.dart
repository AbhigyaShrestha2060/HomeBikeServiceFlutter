import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/common/provider/connectivity_status.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/data/repository/auth_local_repository.dart';
import 'package:final_assignment/features/auth/data/repository/auth_remote_repository.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final checkConnectivity = ref.watch(connectivityStatusProvider);
  if (checkConnectivity == ConnectivityStatus.isConnected) {
    return ref.read(authRemoteRepositoryProvider);
  } else {
    return ref.read(authLocalRepositoryProvider);
  }
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, bool>> verifyUser();
  Future<Either<Failure, AuthEntity>> getCurrentUser();
  Future<Either<Failure, bool>> fingerPrintLogin(String id);
  Future<Either<Failure, AuthEntity>> getUser(String id);
  Future<Either<Failure, bool>> updateUser(AuthEntity user);

  Future<Either<Failure, List<AuthEntity>>> getAllUser();
  Future<Either<Failure, bool>> sendOtp(String phoneNumber);

  Future<Either<Failure, bool>> resetPass(
      {required String phoneNumber,
      required String password,
      required String otp});
}
