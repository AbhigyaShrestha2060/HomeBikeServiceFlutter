import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:final_assignment/features/service/domain/usecases/service_usecase.dart';
import 'package:final_assignment/features/service/presentation/navigator/service_navigator.dart';
import 'package:final_assignment/features/service/presentation/state/service_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigator/model_navigator.dart';

final serviceViewModelProvider =
    StateNotifierProvider<ServiceViewModel, ServiceState>((ref) {
  return ServiceViewModel(
    serviceUsecase: ref.read(
      serviceUsecaseProvider,
    ),
    navigator: ref.read(serviceViewNavigatorProvider),
    modelNavigator:
        ref.read(modelViewNavigatorProvider), // Add the missing argument here
  );
});

class ServiceViewModel extends StateNotifier<ServiceState> {
  ServiceViewModel({
    required this.serviceUsecase,
    required this.navigator,
    required this.modelNavigator,
  }) : super(ServiceState.initial()) {
    fetchBikes();
  }

  final ServiceUsecase serviceUsecase;
  final ServiceViewNavigator navigator;
  final ServiceModelViewNavigator modelNavigator;

  Future resetState() async {
    state = ServiceState.initial();
    fetchBikes();
  }

  getAllBikes() async {
    state = state.copyWith(isLoading: true);
    final result = await serviceUsecase.getAllBikes();
    result.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (r) {
      state = state.copyWith(isLoading: false, lstService: r, error: null);
    });
  }

  Future getBikeByModel() async {
    state = state.copyWith(isLoading: true);
    final result = await serviceUsecase.getBikeByModel();
    result.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (r) {
      state = state.copyWith(isLoading: false, lstService: r, error: null);
    });
  }

  Future fetchBikes() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final bikes = currentState.lstService;
    final hasReachedMax = currentState.hasReachedMax;

    if (!hasReachedMax) {
      final result = await serviceUsecase.paginationBike(page, 10);
      result.fold(
        (failure) => state = state.copyWith(
          hasReachedMax: true,
          isLoading: false,
          error: failure.error,
        ),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(
              hasReachedMax: true,
              isLoading: false,
            );
          } else {
            state = state.copyWith(
              lstService: [...bikes, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }

  // New method for search functionality
  void searchBikes(String query) {
    if (query.isEmpty) {
      state = state.copyWith(filteredService: []);
    } else {
      final filteredBikes = state.lstService
          .where((bike) =>
              bike.bikeName.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = state.copyWith(filteredService: filteredBikes);
    }
  }

  // void openModelView() {
  //   navigator.openModelView();
  // }

  void openServiceModelView({
    required List<ServiceEntity> serviceEntity,
  }) {
    navigator.openServiceModelView(
      serviceEntity: serviceEntity,
    );
  }

  void openConfirmBookingView({
    required String id,
    required String bikeName,
  }) {
    modelNavigator.openConfirmBooking(
      id: id,
      bikeName: bikeName,
    );
  }
}
