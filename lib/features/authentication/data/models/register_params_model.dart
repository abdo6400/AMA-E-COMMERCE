class RegisterParamsModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String otp;
  final String otpSecret;

  RegisterParamsModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.otp,
      required this.otpSecret});
}
