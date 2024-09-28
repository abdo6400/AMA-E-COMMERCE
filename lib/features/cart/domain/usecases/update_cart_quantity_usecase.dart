import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/cart_product.dart';
import '../repositories/cart_repository.dart';

class UpdateCartQuantityUseCase
    implements UseCase<CartProduct, UpdateCartQuantityParams> {
  final CartRepository repository;

  UpdateCartQuantityUseCase(this.repository);

  @override
  Future<Either<Failure, CartProduct>> call(
      UpdateCartQuantityParams params) async {
    return await repository.updateCartQuantity(params.id, params.quantity);
  }
}

class UpdateCartQuantityParams {
  final int id;
  final int quantity;

  UpdateCartQuantityParams({
    required this.id,
    required this.quantity,
  });
}
