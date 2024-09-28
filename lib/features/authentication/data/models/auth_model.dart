import '../../domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({required super.token, required super.refreshToken});
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(token: json["token"], refreshToken: json["refreshToken"]);
}
