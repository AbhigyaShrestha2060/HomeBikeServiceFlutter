// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      bikes: (json['bikes'] as List<dynamic>)
          .map((e) => BikeListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceDtoToJson(ServiceDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'bikes': instance.bikes,
    };
