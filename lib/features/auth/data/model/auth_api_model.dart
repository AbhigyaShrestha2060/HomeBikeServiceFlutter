import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider =
    Provider<AuthApiModel>((ref) => const AuthApiModel.empty());

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.password,
  });

  const AuthApiModel.empty()
      : id = '',
        fullName = '',
        email = '',
        phoneNumber = '',
        password = '';

  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }

  factory AuthApiModel.fromEntity({AuthEntity? entity}) {
    if (entity == null) {
      return const AuthApiModel.empty();
    } else {
      return AuthApiModel(
        id: entity.userId,
        fullName: entity.fullName,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        password: entity.password,
      );
    }
  }

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phoneNumber,
        password,
      ];

  fromEntity(AuthEntity authEntity) {}
}
