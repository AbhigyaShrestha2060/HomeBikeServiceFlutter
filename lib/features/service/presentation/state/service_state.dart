// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart';

class ServiceState {
  final List<BikeListEntity> lstService;
  final List<BikeListEntity> filteredService;
  final bool isLoading;
  final String? error;
  final bool hasReachedMax;
  final int page;

  ServiceState({
    required this.lstService,
    List<BikeListEntity>? filteredService,
    required this.isLoading,
    this.error,
    required this.hasReachedMax,
    required this.page,
  }) : filteredService = filteredService ?? [];

  factory ServiceState.initial() {
    return ServiceState(
      lstService: [],
      isLoading: false,
      error: null,
      hasReachedMax: false,
      page: 0,
    );
  }

  ServiceState copyWith({
    List<BikeListEntity>? lstService,
    List<BikeListEntity>? filteredService,
    bool? isLoading,
    String? error,
    bool? hasReachedMax,
    int? page,
  }) {
    return ServiceState(
      lstService: lstService ?? this.lstService,
      filteredService: filteredService ?? this.filteredService,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}
