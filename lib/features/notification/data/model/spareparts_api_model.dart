import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/notification/domain/entity/spareparts_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spareparts_api_model.g.dart';

final sparepartsApiModelProvider =
    Provider<SparepartsApiModel>((ref) => const SparepartsApiModel.empty());

@JsonSerializable()
class SparepartsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String sparePartName;
  final String sparePartDescription;
  final String sparePartPrice;
  final String sparePartImage;

  const SparepartsApiModel({
    this.id,
    required this.sparePartName,
    required this.sparePartDescription,
    required this.sparePartPrice,
    required this.sparePartImage,
  });

  const SparepartsApiModel.empty()
      : id = '',
        sparePartName = '',
        sparePartDescription = '',
        sparePartPrice = '',
        sparePartImage = '';

  SparepartsEntity toEntity() {
    return SparepartsEntity(
      sparePartName: sparePartName,
      sparePartDescription: sparePartDescription,
      sparePartPrice: sparePartPrice,
      sparePartImage: sparePartImage,
    );
  }

  SparepartsApiModel fromEntity(SparepartsEntity entity) {
    return SparepartsApiModel(
      sparePartName: entity.sparePartName,
      sparePartDescription: entity.sparePartDescription,
      sparePartPrice: entity.sparePartPrice,
      sparePartImage: entity.sparePartImage,
    );
  }

  factory SparepartsApiModel.fromJson(Map<String, dynamic> json) =>
      _$SparepartsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SparepartsApiModelToJson(this);

  List<SparepartsEntity> toEntityList(List<SparepartsApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
  @override
  List<Object?> get props => [
        id,
        sparePartName,
        sparePartDescription,
        sparePartPrice,
        sparePartImage,
      ];
}
