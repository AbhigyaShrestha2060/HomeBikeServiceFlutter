// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_booking_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfirmBookingEntityAdapter extends TypeAdapter<ConfirmBookingEntity> {
  @override
  final int typeId = 1;

  @override
  ConfirmBookingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfirmBookingEntity(
      id: fields[11] as String?,
      authEntity: fields[1] as AuthEntity?,
      bikeId: fields[0] as String?,
      serviceEntity: fields[2] as ServiceEntity?,
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
  void write(BinaryWriter writer, ConfirmBookingEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.bikeId)
      ..writeByte(1)
      ..write(obj.authEntity)
      ..writeByte(2)
      ..write(obj.serviceEntity)
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
      other is ConfirmBookingEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
