import 'package:equatable/equatable.dart';

class SparepartsEntity extends Equatable {
  final String sparePartName;
  final String sparePartDescription;
  final String sparePartPrice;
  final String sparePartImage;

  const SparepartsEntity({
    required this.sparePartName,
    required this.sparePartDescription,
    required this.sparePartPrice,
    required this.sparePartImage,
  });

  @override
  List<Object?> get props => [
        sparePartName,
        sparePartDescription,
        sparePartPrice,
        sparePartImage,
      ];
}
