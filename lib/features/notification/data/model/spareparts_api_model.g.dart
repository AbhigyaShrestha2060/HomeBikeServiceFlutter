// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spareparts_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparepartsApiModel _$SparepartsApiModelFromJson(Map<String, dynamic> json) =>
    SparepartsApiModel(
      id: json['_id'] as String?,
      sparePartName: json['sparePartName'] as String,
      sparePartDescription: json['sparePartDescription'] as String,
      sparePartPrice: json['sparePartPrice'] as String,
      sparePartImage: json['sparePartImage'] as String,
    );

Map<String, dynamic> _$SparepartsApiModelToJson(SparepartsApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sparePartName': instance.sparePartName,
      'sparePartDescription': instance.sparePartDescription,
      'sparePartPrice': instance.sparePartPrice,
      'sparePartImage': instance.sparePartImage,
    };
