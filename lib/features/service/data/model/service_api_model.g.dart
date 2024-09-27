// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceApiModel _$ServiceApiModelFromJson(Map<String, dynamic> json) =>
    ServiceApiModel(
      id: json['_id'] as String?,
      bikeName: json['bikeName'] as String,
      bikeModel: json['bikeModel'] as String,
      bikePrice: json['bikePrice'] as String,
      bikeImage: json['bikeImage'] as String,
    );

Map<String, dynamic> _$ServiceApiModelToJson(ServiceApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bikeName': instance.bikeName,
      'bikeModel': instance.bikeModel,
      'bikePrice': instance.bikePrice,
      'bikeImage': instance.bikeImage,
    };
