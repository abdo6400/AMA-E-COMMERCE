import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/cart_product.dart';
import '../repositories/cart_repository.dart';

class RemoveProductFromCartUseCase implements UseCase<CartProduct, int> {
  final CartRepository repository;

  RemoveProductFromCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartProduct>> call(int id) async {
    return await repository.removeProductFromCart(id);
  }
}
