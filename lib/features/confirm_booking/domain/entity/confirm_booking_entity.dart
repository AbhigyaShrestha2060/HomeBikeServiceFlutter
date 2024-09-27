// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'confirm_booking_entity.g.dart';

@HiveType(typeId: 1, adapterName: 'ConfirmBookingEntityAdapter')
class ConfirmBookingEntity extends Equatable {
  @HiveField(0)
  final String? bikeId;
  @HiveField(1)
  final AuthEntity? authEntity;
  @HiveField(2)
  final ServiceEntity? serviceEntity;
  @HiveField(3)
  final double? total;
  @HiveField(4)
  final String bikeChasisNumber;
  @HiveField(5)
  final String bikeNumber;
  @HiveField(6)
  final String bikeDescription;
  @HiveField(7)
  final String bookingTime;
  @HiveField(8)
  final DateTime bookingDate;
  @HiveField(9)
  final String? status;
  @HiveField(10)
  final String bookingAddress;
  @HiveField(11)
  final String? id;

  const ConfirmBookingEntity({
    this.id,
    this.authEntity,
    this.bikeId,
    this.serviceEntity,
    this.total,
    required this.bikeChasisNumber,
    required this.bikeNumber,
    required this.bikeDescription,
    required this.bookingTime,
    required this.bookingDate,
    this.status,
    required this.bookingAddress,
  });

  @override
  List<Object?> get props => [
        bikeId,
        authEntity,
        serviceEntity,
        total,
        bikeChasisNumber,
        bikeNumber,
        bikeDescription,
        bookingTime,
        bookingDate,
        status,
        bookingAddress,
        id
      ];
}
