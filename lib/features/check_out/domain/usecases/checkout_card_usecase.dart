import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/payment.dart';
import '../repositories/check_out_repository.dart';

class CheckoutCardUsecase implements UseCase<Payment, PaymentParams> {
  final CheckOutRepository _repository;

  CheckoutCardUsecase(this._repository);

  @override
  Future<Either<Failure, Payment>> call(PaymentParams params) async {
    return await _repository.checkoutCard(
        addressId: params.addressId, couponCode: params.couponCode);
  }
}

class PaymentParams extends Equatable {
  final String addressId;
  final String? couponCode;
  const PaymentParams({required this.addressId, this.couponCode});

  @override
  List<Object?> get props => [addressId, couponCode];
}
