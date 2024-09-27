import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_entity.g.dart';

@HiveType(typeId: 3, adapterName: 'ServiceEntityAdapter')
@JsonSerializable()
class ServiceEntity extends Equatable {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String bikeName;
  @HiveField(2)
  final String bikeModel;
  @HiveField(3)
  final String bikePrice;
  @HiveField(4)
  final String bikeImage;

  const ServiceEntity({
    this.id,
    required this.bikeName,
    required this.bikeModel,
    required this.bikePrice,
    required this.bikeImage,
  });
  const ServiceEntity.empty()
      : id = '',
        bikeName = '',
        bikeModel = '',
        bikePrice = '',
        bikeImage = '';

  @override
  List<Object?> get props => [id, bikeName, bikeModel, bikePrice, bikeImage];

  factory ServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceEntityToJson(this);
}
