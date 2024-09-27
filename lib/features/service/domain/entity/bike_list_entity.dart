import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';

class BikeListEntity extends Equatable {
  final String? id;
  final String bikeName;
  final List<ServiceEntity> data;
  final String bikeImage;

  const BikeListEntity({
    this.id,
    required this.bikeName,
    required this.data,
    required this.bikeImage,
  });
  BikeListEntity.empty()
      : id = '',
        bikeName = '',
        data = [],
        bikeImage = '';

  @override
  List<Object?> get props => [id, bikeName, data, bikeImage];
}
