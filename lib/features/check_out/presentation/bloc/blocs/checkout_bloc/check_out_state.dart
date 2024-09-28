part of 'check_out_bloc.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object> get props => [];
}

class CheckOutInitial extends CheckOutState {}

class CheckoutLoading extends CheckOutState {}

class CheckoutFailure extends CheckOutState {
  final String message;

  const CheckoutFailure(this.message);
}

class CheckoutCashSuccess extends CheckOutState {
  final String message;

  const CheckoutCashSuccess(this.message);
}

class CheckoutCardSuccess extends CheckOutState {
  final Payment payment;

  const CheckoutCardSuccess(this.payment);
}
