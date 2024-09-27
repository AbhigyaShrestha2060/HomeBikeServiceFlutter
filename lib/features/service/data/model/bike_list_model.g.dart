// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BikeListModel _$BikeListModelFromJson(Map<String, dynamic> json) =>
    BikeListModel(
      id: json['_id'] as String?,
      bikeName: json['bikeName'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ServiceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      bikeImage: json['bikeImage'] as String,
    );

Map<String, dynamic> _$BikeListModelToJson(BikeListModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bikeName': instance.bikeName,
      'data': instance.data,
      'bikeImage': instance.bikeImage,
    };
