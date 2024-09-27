// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spareparts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparepartsDto _$SparepartsDtoFromJson(Map<String, dynamic> json) =>
    SparepartsDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      spareparts: (json['spareparts'] as List<dynamic>)
          .map((e) => SparepartsApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SparepartsDtoToJson(SparepartsDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'spareparts': instance.spareparts,
    };
