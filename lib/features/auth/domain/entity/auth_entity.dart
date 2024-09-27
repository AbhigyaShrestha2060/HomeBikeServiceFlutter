// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? password;

  const AuthEntity({
    this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.password,
  });

  const AuthEntity.empty()
      : this(
          userId: '',
          fullName: '',
          email: '',
          phoneNumber: '',
          password: '',
        );

  @override
  List<Object?> get props => [
        userId,
        fullName,
        email,
        phoneNumber,
        password,
      ];
}
