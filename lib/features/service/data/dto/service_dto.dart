import 'package:final_assignment/features/service/data/model/bike_list_model.dart';
import 'package:final_assignment/features/service/data/model/service_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_dto.g.dart';

@JsonSerializable()
class ServiceDto {
  final bool success;
  final String message;
  final List<BikeListModel> bikes;

  ServiceDto({
    required this.success,
    required this.message,
    required this.bikes,
  });

  Map<String, dynamic> toJson() => _$ServiceDtoToJson(this);
  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);
}
