import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/repository/i_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider(
  (ref) => AuthRemoteRepository(
    authRemoteDatasource: ref.read(authRemoteDatasourceProvider),
  ),
);

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRemoteRepository({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return authRemoteDatasource.loginUser(
      email: email,
      password: password,
    );
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return authRemoteDatasource.registerUser(user);
  }

  @override
  Future<Either<Failure, bool>> verifyUser() {
    return authRemoteDatasource.verifyUser();
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    return authRemoteDatasource.getMe();
  }

  @override
  Future<Either<Failure, bool>> fingerPrintLogin(String id) {
    return authRemoteDatasource.fingerPrintLogin(id);
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllUser() {
    return authRemoteDatasource.getAllUsers();
  }

  @override
  Future<Either<Failure, AuthEntity>> getUser(String id) {
    return authRemoteDatasource.getUser(id);
  }

  @override
  Future<Either<Failure, bool>> updateUser(AuthEntity user) {
    return authRemoteDatasource.updateProfile(user);
  }

  @override
  Future<Either<Failure, bool>> sendOtp(String phoneNumber) {
    return authRemoteDatasource.sentOtp(phoneNumber);
  }

  @override
  Future<Either<Failure, bool>> resetPass(
      {required String phoneNumber,
      required String password,
      required String otp}) {
    return authRemoteDatasource.resetPassword(
        phoneNumber: phoneNumber, password: password, otp: otp);
  }
}
