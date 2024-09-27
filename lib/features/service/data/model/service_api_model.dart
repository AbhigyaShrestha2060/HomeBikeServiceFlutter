import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_api_model.g.dart';

final serviceApiModelProvider =
    Provider<ServiceApiModel>((ref) => const ServiceApiModel.empty());

@JsonSerializable()
class ServiceApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String bikeName;
  final String bikeModel;
  final String bikePrice;
  final String bikeImage;

  const ServiceApiModel({
     this.id,
    required this.bikeName,
    required this.bikeModel,
    required this.bikePrice,
    required this.bikeImage,
  });
  const ServiceApiModel.empty()
      :id='',
       bikeName = '',
        bikeModel = '',
        bikePrice = '',
        bikeImage = '';

  ServiceEntity toEntity() {
    return ServiceEntity(
      id:id,
      bikeName: bikeName,
      bikeModel: bikeModel,
      bikePrice: bikePrice,
      bikeImage: bikeImage,
    );
  }

  factory ServiceApiModel.fromEntity(ServiceEntity entity) {
    return ServiceApiModel(
      id:entity.id,
      bikeName: entity.bikeName,
      bikeModel: entity.bikeModel,
      bikePrice: entity.bikePrice,
      bikeImage: entity.bikeImage,
    );
  }

  factory ServiceApiModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceApiModelToJson(this);

  List<ServiceEntity> toEntityList(List<ServiceApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [id,bikeName, bikeModel, bikePrice, bikeImage];
}
