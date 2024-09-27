// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceEntityAdapter extends TypeAdapter<ServiceEntity> {
  @override
  final int typeId = 3;

  @override
  ServiceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceEntity(
      id: fields[0] as String?,
      bikeName: fields[1] as String,
      bikeModel: fields[2] as String,
      bikePrice: fields[3] as String,
      bikeImage: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bikeName)
      ..writeByte(2)
      ..write(obj.bikeModel)
      ..writeByte(3)
      ..write(obj.bikePrice)
      ..writeByte(4)
      ..write(obj.bikeImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) =>
    ServiceEntity(
      id: json['_id'] as String?,
      bikeName: json['bikeName'] as String,
      bikeModel: json['bikeModel'] as String,
      bikePrice: json['bikePrice'] as String,
      bikeImage: json['bikeImage'] as String,
    );

Map<String, dynamic> _$ServiceEntityToJson(ServiceEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bikeName': instance.bikeName,
      'bikeModel': instance.bikeModel,
      'bikePrice': instance.bikePrice,
      'bikeImage': instance.bikeImage,
    };
