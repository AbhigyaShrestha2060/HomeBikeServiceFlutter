import 'package:final_assignment/features/confirm_booking/data/model/confirm_booking_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_booking_dto.g.dart';

@JsonSerializable()
class GetAllBookingsDto {
  final bool success;
  final String message;
  final List<ConfirmBookingApiModel> bookings;

  GetAllBookingsDto({
    required this.success,
    required this.message,
    required this.bookings,
  });

  factory GetAllBookingsDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllBookingsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllBookingsDtoToJson(this);
  }
}
