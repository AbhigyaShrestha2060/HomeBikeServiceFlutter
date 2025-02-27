// Mocks generated by Mockito 5.4.4 from annotations
// in final_assignment/test/unit_test/bike_test/bike_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:final_assignment/core/failure/failure.dart' as _i6;
import 'package:final_assignment/features/service/domain/entity/bike_list_entity.dart'
    as _i7;
import 'package:final_assignment/features/service/domain/entity/service_entity.dart'
    as _i9;
import 'package:final_assignment/features/service/domain/repository/i_service_repository.dart'
    as _i2;
import 'package:final_assignment/features/service/domain/usecases/service_usecase.dart'
    as _i4;
import 'package:final_assignment/features/service/presentation/navigator/model_navigator.dart'
    as _i10;
import 'package:final_assignment/features/service/presentation/navigator/service_navigator.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIServiceRepository_0 extends _i1.SmartFake
    implements _i2.IServiceRepository {
  _FakeIServiceRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ServiceUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockServiceUsecase extends _i1.Mock implements _i4.ServiceUsecase {
  @override
  _i2.IServiceRepository get iServiceRepository => (super.noSuchMethod(
        Invocation.getter(#iServiceRepository),
        returnValue: _FakeIServiceRepository_0(
          this,
          Invocation.getter(#iServiceRepository),
        ),
        returnValueForMissingStub: _FakeIServiceRepository_0(
          this,
          Invocation.getter(#iServiceRepository),
        ),
      ) as _i2.IServiceRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>> getAllBikes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBikes,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #getAllBikes,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #getAllBikes,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>> paginationBike(
    int? page,
    int? limit,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #paginationBike,
          [
            page,
            limit,
          ],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #paginationBike,
            [
              page,
              limit,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #paginationBike,
            [
              page,
              limit,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>);

  @override
  _i5.Future<
      _i3.Either<_i6.Failure,
          List<_i7.BikeListEntity>>> getBikeByModel() => (super.noSuchMethod(
        Invocation.method(
          #getBikeByModel,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #getBikeByModel,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BikeListEntity>>(
          this,
          Invocation.method(
            #getBikeByModel,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BikeListEntity>>>);
}

/// A class which mocks [ServiceViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockServiceViewNavigator extends _i1.Mock
    implements _i8.ServiceViewNavigator {
  @override
  void openServiceView() => super.noSuchMethod(
        Invocation.method(
          #openServiceView,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic openServiceModelView(
          {required List<_i9.ServiceEntity>? serviceEntity}) =>
      super.noSuchMethod(
        Invocation.method(
          #openServiceModelView,
          [],
          {#serviceEntity: serviceEntity},
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ServiceModelViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockServiceModelViewNavigator extends _i1.Mock
    implements _i10.ServiceModelViewNavigator {}
