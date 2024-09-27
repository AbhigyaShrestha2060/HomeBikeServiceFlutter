import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/data/model/auth_api_model.dart';
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart';
import 'package:final_assignment/features/service/data/model/service_api_model.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_booking_api_model.g.dart';

final confirmBookingApiModelProvider = Provider<ConfirmBookingApiModel>(
  (ref) => ConfirmBookingApiModel.empty(),
);

@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'ConfirmBookingApiModelAdapter')
class ConfirmBookingApiModel extends Equatable {
  @HiveField(0)
  final String? bikeId;
  @HiveField(1)
  final AuthApiModel? auth;
  @HiveField(2)
  final ServiceApiModel? service;
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
  @JsonKey(name: '_id')
  final String? id;

  const ConfirmBookingApiModel({
    this.id,
    this.bikeId,
    this.auth,
    this.service,
    this.total,
    required this.bikeChasisNumber,
    required this.bikeNumber,
    required this.bikeDescription,
    required this.bookingTime,
    required this.bookingDate,
    this.status,
    required this.bookingAddress,
  });

  factory ConfirmBookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmBookingApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmBookingApiModelToJson(this);

  factory ConfirmBookingApiModel.empty() => ConfirmBookingApiModel(
        auth: const AuthApiModel.empty(),
        service: const ServiceApiModel.empty(),
        bikeId: '',
        total: 0,
        id: '',
        bikeChasisNumber: '',
        bikeNumber: '',
        bikeDescription: '',
        bookingTime: '',
        bookingDate: DateTime.now(),
        status: '',
        bookingAddress: '',
      );

  ConfirmBookingEntity toEntity() {
    return ConfirmBookingEntity(
      id: id,
      authEntity: auth!.toEntity(),
      serviceEntity: service!.toEntity(),
      bikeId: bikeId,
      total: total,
      bikeChasisNumber: bikeChasisNumber,
      bikeNumber: bikeNumber,
      bikeDescription: bikeDescription,
      bookingTime: bookingTime,
      bookingDate: bookingDate,
      status: status,
      bookingAddress: bookingAddress,
    );
  }

  factory ConfirmBookingApiModel.fromEntity(ConfirmBookingEntity entity) {
    return ConfirmBookingApiModel(
      auth: entity.authEntity != null
          ? AuthApiModel.fromEntity(entity: entity.authEntity)
          : null,
      service: entity.serviceEntity != null
          ? ServiceApiModel.fromEntity(
              entity.serviceEntity ?? const ServiceEntity.empty())
          : null,
      bikeId: entity.bikeId,
      total: 100,
      bikeChasisNumber: entity.bikeChasisNumber,
      bikeNumber: entity.bikeNumber,
      bikeDescription: entity.bikeDescription,
      bookingTime: entity.bookingTime,
      bookingDate: entity.bookingDate,
      bookingAddress: entity.bookingAddress,
    );
  }

  @override
  List<Object?> get props => [
        bikeId,
        auth,
        service,
        total,
        bikeChasisNumber,
        bikeNumber,
        bikeDescription,
        bookingTime,
        bookingDate,
        status,
        bookingAddress,
        id,
      ];
}
