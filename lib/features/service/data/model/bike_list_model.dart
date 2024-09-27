import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bike_list_model.g.dart';

final bikeListModelProvider =
    Provider<BikeListModel>((ref) => BikeListModel.empty());

@JsonSerializable()
class BikeListModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String bikeName;
  final List<ServiceEntity> data;
  final String bikeImage;

  const BikeListModel({
    this.id,
    required this.bikeName,
    required this.data,
    required this.bikeImage,
  });
  BikeListModel.empty()
      : id = '',
        bikeName = '',
        data = [],
        bikeImage = '';

  BikeListEntity toEntity() {
    return BikeListEntity(
      id: id,
      bikeName: bikeName,
      data: data,
      bikeImage: bikeImage,
    );
  }

  factory BikeListModel.fromEntity(BikeListEntity entity) {
    return BikeListModel(
      id: entity.id,
      bikeName: entity.bikeName,
      data: entity.data,
      bikeImage: entity.bikeImage,
    );
  }

  factory BikeListModel.fromJson(Map<String, dynamic> json) =>
      _$BikeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BikeListModelToJson(this);
  List<BikeListEntity> toEntityList(List<BikeListModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [id, bikeName, data, bikeImage];
}
