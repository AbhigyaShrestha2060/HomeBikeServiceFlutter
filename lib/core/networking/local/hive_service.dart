import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/auth/data/model/auth_hive_model.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

final hiveserviceProvider = Provider((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters

    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(ConfirmBookingEntityAdapter());
    Hive.registerAdapter(ServiceEntityAdapter());
  }

  //================ User Query =================

  // Register Query
  Future<void> registerUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
  }

  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere(
        (element) => element.email == email && element.password == password,
        orElse: () => AuthHiveModel.empty());
    return user;
  }

  Future<void> logout() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.clear();
  }

  Future<AuthHiveModel> getUserByEmail(String email) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) => element.email == email,
        orElse: () => AuthHiveModel.empty());
    return user;
  }

  Future<void> saveUserBookings(List<ConfirmBookingEntity> bookings) async {
    Map<String, ConfirmBookingEntity> bookingsMap = {};
    var bookingBox =
        await Hive.openBox<ConfirmBookingEntity>(HiveTableConstant.bookingBox);
    bookingsMap.addEntries(
      bookings.map(
        (element) {
          return MapEntry(element.bikeId!, element);
        },
      ),
    );
    try{
      await bookingBox.putAll(bookingsMap);
    }catch (e){
     print('error ---> ${e.toString()}');
    }
  }

  Future<List<ConfirmBookingEntity>> getUserBookings() async {
    var bookingBox =
        await Hive.openBox<ConfirmBookingEntity>(HiveTableConstant.bookingBox);
    return bookingBox.values.toList();
  }
}
