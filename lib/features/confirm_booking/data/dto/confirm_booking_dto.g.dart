// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingsDto _$GetAllBookingsDtoFromJson(Map<String, dynamic> json) =>
    GetAllBookingsDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      bookings: (json['bookings'] as List<dynamic>)
          .map(
              (e) => ConfirmBookingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBookingsDtoToJson(GetAllBookingsDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'bookings': instance.bookings,
    };
