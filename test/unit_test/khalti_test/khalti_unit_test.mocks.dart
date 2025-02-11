// Mocks generated by Mockito 5.4.4 from annotations
// in final_assignment/test/unit_test/khalti_test/khalti_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i3;
import 'package:final_assignment/core/failure/failure.dart' as _i8;
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart'
    as _i5;
import 'package:final_assignment/features/confirm_booking/domain/entity/confirm_booking_entity.dart'
    as _i10;
import 'package:final_assignment/features/confirm_booking/domain/repository/i_confirm_booking_repository.dart'
    as _i4;
import 'package:final_assignment/features/confirm_booking/domain/usecases/confirm_booking_usecase.dart'
    as _i12;
import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart'
    as _i9;
import 'package:final_assignment/features/khalti/domain/repository/i_khalti_repositroy.dart'
    as _i2;
import 'package:final_assignment/features/khalti/domain/usecases/khalti_usecase.dart'
    as _i6;
import 'package:final_assignment/features/khalti/presentation/navigator/khalti_navigator.dart'
    as _i11;
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

class _FakeIKhaltiRepository_0 extends _i1.SmartFake
    implements _i2.IKhaltiRepository {
  _FakeIKhaltiRepository_0(
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

class _FakeIConfirmBookingRepository_2 extends _i1.SmartFake
    implements _i4.IConfirmBookingRepository {
  _FakeIConfirmBookingRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserSharedPrefs_3 extends _i1.SmartFake
    implements _i5.UserSharedPrefs {
  _FakeUserSharedPrefs_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [KhaltiUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockKhaltiUsecase extends _i1.Mock implements _i6.KhaltiUsecase {
  @override
  _i2.IKhaltiRepository get khaltiRepository => (super.noSuchMethod(
        Invocation.getter(#khaltiRepository),
        returnValue: _FakeIKhaltiRepository_0(
          this,
          Invocation.getter(#khaltiRepository),
        ),
        returnValueForMissingStub: _FakeIKhaltiRepository_0(
          this,
          Invocation.getter(#khaltiRepository),
        ),
      ) as _i2.IKhaltiRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> completeKhalti(
          _i9.KhaltiEntity? entity) =>
      (super.noSuchMethod(
        Invocation.method(
          #completeKhalti,
          [entity],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #completeKhalti,
            [entity],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, String>>.value(
                _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #completeKhalti,
            [entity],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> initializeKhalti({
    required List<_i10.ConfirmBookingEntity>? itemId,
    required double? totalPrice,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initializeKhalti,
          [],
          {
            #itemId: itemId,
            #totalPrice: totalPrice,
          },
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #initializeKhalti,
            [],
            {
              #itemId: itemId,
              #totalPrice: totalPrice,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, String>>.value(
                _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #initializeKhalti,
            [],
            {
              #itemId: itemId,
              #totalPrice: totalPrice,
            },
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);
}

/// A class which mocks [KhaltiViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockKhaltiViewNavigator extends _i1.Mock
    implements _i11.KhaltiViewNavigator {
  @override
  void openPaymentSuccessView(String? transactionId) => super.noSuchMethod(
        Invocation.method(
          #openPaymentSuccessView,
          [transactionId],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ConfirmBookingUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockConfirmBookingUseCase extends _i1.Mock
    implements _i12.ConfirmBookingUseCase {
  @override
  _i4.IConfirmBookingRepository get confirmBookingRepository =>
      (super.noSuchMethod(
        Invocation.getter(#confirmBookingRepository),
        returnValue: _FakeIConfirmBookingRepository_2(
          this,
          Invocation.getter(#confirmBookingRepository),
        ),
        returnValueForMissingStub: _FakeIConfirmBookingRepository_2(
          this,
          Invocation.getter(#confirmBookingRepository),
        ),
      ) as _i4.IConfirmBookingRepository);

  @override
  _i5.UserSharedPrefs get userSharedprefs => (super.noSuchMethod(
        Invocation.getter(#userSharedprefs),
        returnValue: _FakeUserSharedPrefs_3(
          this,
          Invocation.getter(#userSharedprefs),
        ),
        returnValueForMissingStub: _FakeUserSharedPrefs_3(
          this,
          Invocation.getter(#userSharedprefs),
        ),
      ) as _i5.UserSharedPrefs);

  @override
  _i4.IConfirmBookingRepository get confirmBookingLocalRepository =>
      (super.noSuchMethod(
        Invocation.getter(#confirmBookingLocalRepository),
        returnValue: _FakeIConfirmBookingRepository_2(
          this,
          Invocation.getter(#confirmBookingLocalRepository),
        ),
        returnValueForMissingStub: _FakeIConfirmBookingRepository_2(
          this,
          Invocation.getter(#confirmBookingLocalRepository),
        ),
      ) as _i4.IConfirmBookingRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> addToBooking(
          _i10.ConfirmBookingEntity? confirmBookingEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #addToBooking,
          [confirmBookingEntity],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #addToBooking,
            [confirmBookingEntity],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
                _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #addToBooking,
            [confirmBookingEntity],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);

  @override
  _i7.Future<
      _i3.Either<_i8.Failure,
          List<_i10.ConfirmBookingEntity>>> getUserBooking() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserBooking,
          [],
        ),
        returnValue: _i7.Future<
                _i3.Either<_i8.Failure, List<_i10.ConfirmBookingEntity>>>.value(
            _FakeEither_1<_i8.Failure, List<_i10.ConfirmBookingEntity>>(
          this,
          Invocation.method(
            #getUserBooking,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<
                _i3.Either<_i8.Failure, List<_i10.ConfirmBookingEntity>>>.value(
            _FakeEither_1<_i8.Failure, List<_i10.ConfirmBookingEntity>>(
          this,
          Invocation.method(
            #getUserBooking,
            [],
          ),
        )),
      ) as _i7
          .Future<_i3.Either<_i8.Failure, List<_i10.ConfirmBookingEntity>>>);

  @override
  _i7.Future<void> saveBookingsInHive(
          List<_i10.ConfirmBookingEntity>? bookings) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveBookingsInHive,
          [bookings],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<List<_i10.ConfirmBookingEntity>> getBookingsFromHive() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBookingsFromHive,
          [],
        ),
        returnValue: _i7.Future<List<_i10.ConfirmBookingEntity>>.value(
            <_i10.ConfirmBookingEntity>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i10.ConfirmBookingEntity>>.value(
                <_i10.ConfirmBookingEntity>[]),
      ) as _i7.Future<List<_i10.ConfirmBookingEntity>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> changeStatus(String? bookingId) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeStatus,
          [bookingId],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #changeStatus,
            [bookingId],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
                _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #changeStatus,
            [bookingId],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);
}
