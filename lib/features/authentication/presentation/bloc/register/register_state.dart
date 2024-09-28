part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class CheckEmailLoadedState extends RegisterState {
  final String secureKey;
  final Map<String, dynamic> data;
  const CheckEmailLoadedState({required this.secureKey, required this.data});
  @override
  List<Object> get props => [secureKey, data];
}

class ResendCodeLoadedState extends RegisterState {
  final String secureKey;
  const ResendCodeLoadedState({required this.secureKey});

  @override
  List<Object> get props => [];
}

class RegisterLoadedState extends RegisterState {
  final Auth auth;

  const RegisterLoadedState({required this.auth});

  @override
  List<Object> get props => [auth];
}
