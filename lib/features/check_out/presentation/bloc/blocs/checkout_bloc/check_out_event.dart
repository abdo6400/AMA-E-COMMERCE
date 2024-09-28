part of 'check_out_bloc.dart';

abstract class CheckOutEvent extends Equatable {
  const CheckOutEvent();

  @override
  List<Object> get props => [];
}

class CheckoutCashRequested extends CheckOutEvent {
  final String addressId;
  final String? couponCode;

  const CheckoutCashRequested({required this.addressId, this.couponCode});
}

class CheckoutCardRequested extends CheckOutEvent {
  final String addressId;
  final String? couponCode;

  const CheckoutCardRequested({required this.addressId, this.couponCode});
}