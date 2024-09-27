import 'package:final_assignment/features/notification/data/model/spareparts_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spareparts_dto.g.dart';

@JsonSerializable()
class SparepartsDto {
  final bool success;
  final String message;
  final List<SparepartsApiModel> spareparts;

  SparepartsDto({
    required this.success,
    required this.message,
    required this.spareparts,
  });

  Map<String, dynamic> toJson() => _$SparepartsDtoToJson(this);
  factory SparepartsDto.fromJson(Map<String, dynamic> json) =>
      _$SparepartsDtoFromJson(json);
}
