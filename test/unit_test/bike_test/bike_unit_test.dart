import 'package:dartz/dartz.dart';
import 'package:final_assignment/features/service/domain/entity/service_entity.dart';
import 'package:final_assignment/features/service/domain/usecases/service_usecase.dart';
import 'package:final_assignment/features/service/presentation/navigator/model_navigator.dart';
import 'package:final_assignment/features/service/presentation/navigator/service_navigator.dart';
import 'package:final_assignment/features/service/presentation/viewmodel/service_catergory_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bike_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ServiceUsecase>(),
  MockSpec<ServiceViewNavigator>(),
  MockSpec<ServiceModelViewNavigator>(),
])
void main() {
  late MockServiceUsecase mockServiceUsecase;
  late MockServiceViewNavigator mockServiceViewNavigator;
  late MockServiceModelViewNavigator mockServiceModelViewNavigator;
  late ProviderContainer container;

  setUp(() {
    mockServiceUsecase = MockServiceUsecase();
    mockServiceViewNavigator = MockServiceViewNavigator();
    mockServiceModelViewNavigator = MockServiceModelViewNavigator();

    container = ProviderContainer(
      overrides: [
        serviceViewModelProvider.overrideWith(
          (ref) => ServiceViewModel(
            serviceUsecase: mockServiceUsecase,
            navigator: mockServiceViewNavigator,
            modelNavigator: mockServiceModelViewNavigator,
          ),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('fetchBikes should set hasReachedMax if no more bikes are available',
      () async {
    when(mockServiceUsecase.paginationBike(1, 10)).thenAnswer(
      (_) async => const Right([]),
    );

    final viewModel = container.read(serviceViewModelProvider.notifier);
    await viewModel.fetchBikes();

    final state = container.read(serviceViewModelProvider);
    expect(state.hasReachedMax, true);
    expect(state.isLoading, false);
  });



  test('fetchBikes should set isLoading to false when fetching bikes is done',
      () async {
    when(mockServiceUsecase.paginationBike(1, 10)).thenAnswer(
      (_) async => const Right([]),
    );

    final viewModel = container.read(serviceViewModelProvider.notifier);
    await viewModel.fetchBikes();

    final state = container.read(serviceViewModelProvider);
    expect(state.isLoading, false);
  });


 

 
 

  

}
