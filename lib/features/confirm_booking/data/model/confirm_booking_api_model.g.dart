// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_booking_api_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfirmBookingApiModelAdapter
    extends TypeAdapter<ConfirmBookingApiModel> {
  @override
  final int typeId = 2;

  @override
  ConfirmBookingApiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfirmBookingApiModel(
      id: fields[11] as String?,
      bikeId: fields[0] as String?,
      auth: fields[1] as AuthApiModel?,
      service: fields[2] as ServiceApiModel?,
      total: fields[3] as double?,
      bikeChasisNumber: fields[4] as String,
      bikeNumber: fields[5] as String,
      bikeDescription: fields[6] as String,
      bookingTime: fields[7] as String,
      bookingDate: fields[8] as DateTime,
      status: fields[9] as String?,
      bookingAddress: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ConfirmBookingApiModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.bikeId)
      ..writeByte(1)
      ..write(obj.auth)
      ..writeByte(2)
      ..write(obj.service)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.bikeChasisNumber)
      ..writeByte(5)
      ..write(obj.bikeNumber)
      ..writeByte(6)
      ..write(obj.bikeDescription)
      ..writeByte(7)
      ..write(obj.bookingTime)
      ..writeByte(8)
      ..write(obj.bookingDate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.bookingAddress)
      ..writeByte(11)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfirmBookingApiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmBookingApiModel _$ConfirmBookingApiModelFromJson(
        Map<String, dynamic> json) =>
    ConfirmBookingApiModel(
      id: json['_id'] as String?,
      bikeId: json['bikeId'] as String?,
      auth: json['auth'] == null
          ? null
          : AuthApiModel.fromJson(json['auth'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : ServiceApiModel.fromJson(json['service'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
      bikeChasisNumber: json['bikeChasisNumber'] as String,
      bikeNumber: json['bikeNumber'] as String,
      bikeDescription: json['bikeDescription'] as String,
      bookingTime: json['bookingTime'] as String,
      bookingDate: DateTime.parse(json['bookingDate'] as String),
      status: json['status'] as String?,
      bookingAddress: json['bookingAddress'] as String,
    );

Map<String, dynamic> _$ConfirmBookingApiModelToJson(
        ConfirmBookingApiModel instance) =>
    <String, dynamic>{
      'bikeId': instance.bikeId,
      'auth': instance.auth,
      'service': instance.service,
      'total': instance.total,
      'bikeChasisNumber': instance.bikeChasisNumber,
      'bikeNumber': instance.bikeNumber,
      'bikeDescription': instance.bikeDescription,
      'bookingTime': instance.bookingTime,
      'bookingDate': instance.bookingDate.toIso8601String(),
      'status': instance.status,
      'bookingAddress': instance.bookingAddress,
      '_id': instance.id,
    };
