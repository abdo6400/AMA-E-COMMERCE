import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/cart_product.dart';
import '../repositories/cart_repository.dart';

class AddProductToCartUseCase
    implements UseCase<CartProduct, AddProductToCartParams> {
  final CartRepository repository;

  AddProductToCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartProduct>> call(
          AddProductToCartParams params) async =>
      await repository.addProductToCart(params.productId, params.quantity);
}

class AddProductToCartParams {
  final int productId;
  final int quantity;

  AddProductToCartParams({required this.productId, required this.quantity});
}
