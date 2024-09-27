// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_assignment/features/notification/domain/entity/spareparts_entity.dart';

class SparepartsState {
  final bool isLoading;
  final List<SparepartsEntity> spareparts;
  final String error;
  final bool hasReachedMax;
  final int page;

  factory SparepartsState.initial() {
    return SparepartsState(
      isLoading: false,
      spareparts: [],
      error: '',
      hasReachedMax: false,
      page: 1,
    );
  }

  SparepartsState({
    this.isLoading = false,
    this.spareparts = const [],
    this.error = '',
    required this.hasReachedMax,
    required this.page,
  });

  SparepartsState copyWith({
    bool? isLoading,
    List<SparepartsEntity>? spareparts,
    String? error,
    bool? hasReachedMax,
    int? page,
  }) {
    return SparepartsState(
      isLoading: isLoading ?? this.isLoading,
      spareparts: spareparts ?? this.spareparts,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}
