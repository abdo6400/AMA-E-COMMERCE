part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class CheckEmailEvent extends RegisterEvent {
  final String emailOrPhone;
  final Map<String, dynamic> data;
  const CheckEmailEvent(this.data, {required this.emailOrPhone});
}

class ResendCodeEvent extends RegisterEvent {
  final String emailOrPhone;

  const ResendCodeEvent({required this.emailOrPhone});
}

class SignUpEvent extends RegisterEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String otp;
  final String otpSecret;

  const SignUpEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.otp,
    required this.otpSecret,
  });
}
