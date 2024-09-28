import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/payment.dart';

abstract class CheckOutRepository {
  Future<Either<Failure, String>> checkoutCash(
      {required String addressId, String? couponCode});

  Future<Either<Failure, Payment>> checkoutCard(
      {required String addressId, String? couponCode});
}
