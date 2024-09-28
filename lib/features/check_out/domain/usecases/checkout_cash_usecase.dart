import 'package:ama/config/database/error/failures.dart';
import 'package:ama/core/bloc/usecases/usecase.dart';
import 'package:ama/features/check_out/domain/repositories/check_out_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CheckoutCashUsecase extends UseCase<String, CheckoutCashParams> {
  final CheckOutRepository _repository;
  CheckoutCashUsecase(this._repository);
  @override
  Future<Either<Failure, String>> call(CheckoutCashParams params) {
    return _repository.checkoutCash(
        addressId: params.addressId, couponCode: params.couponCode);
  }
}

class CheckoutCashParams extends Equatable {
  final String addressId;
  final String? couponCode;
  const CheckoutCashParams({required this.addressId, this.couponCode});

  @override
  List<Object?> get props => [addressId, couponCode];
}
