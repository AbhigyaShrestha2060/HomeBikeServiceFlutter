import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userSharedPrefsProvider = Provider<UserSharedPrefs>((ref) {
  return UserSharedPrefs();
});

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;

  // Set User token
  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // get user token
  Future<Either<Failure, String?>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');

      return Right(token);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> removeUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  //   save state in shared preferences
  Future<Either<Failure, bool>> saveFingerPrintId(String id) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('fingerPrintId', id);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

//   load state from shared preferences
  Future<Either<Failure, String>> checkId() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final id = _sharedPreferences.getString('fingerPrintId');

      if (id != null) {
        return Right(id);
      } else {
        return Left(Failure(error: 'Id not found'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
