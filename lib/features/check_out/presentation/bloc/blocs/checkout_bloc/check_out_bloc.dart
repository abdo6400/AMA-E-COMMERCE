import 'package:ama/features/check_out/domain/entities/payment.dart';
import 'package:ama/features/check_out/domain/usecases/checkout_card_usecase.dart';
import 'package:ama/features/check_out/domain/usecases/checkout_cash_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  final CheckoutCashUsecase _checkoutCashUsecase;
  final CheckoutCardUsecase _checkoutCardUsecase;

  CheckOutBloc(this._checkoutCashUsecase, this._checkoutCardUsecase)
      : super(CheckOutInitial()) {
    on<CheckoutCashRequested>(_onCheckoutCashRequested);
    on<CheckoutCardRequested>(_onCheckoutCardRequested);
  }

  Future<void> _onCheckoutCashRequested(
    CheckoutCashRequested event,
    Emitter<CheckOutState> emit,
  ) async {
    emit(CheckoutLoading());
    final result = await _checkoutCashUsecase(
      CheckoutCashParams(
          addressId: event.addressId, couponCode: event.couponCode),
    );
    result.fold(
      (failure) => emit(CheckoutFailure(failure.errorMessage)),
      (message) => emit(CheckoutCashSuccess(message)),
    );
  }

  Future<void> _onCheckoutCardRequested(
    CheckoutCardRequested event,
    Emitter<CheckOutState> emit,
  ) async {
    emit(CheckoutLoading());
    final result = await _checkoutCardUsecase(
      PaymentParams(addressId: event.addressId, couponCode: event.couponCode),
    );
    result.fold(
      (failure) => emit(CheckoutFailure(failure.errorMessage)),
      (payment) => emit(CheckoutCardSuccess(payment)),
    );
  }
}
