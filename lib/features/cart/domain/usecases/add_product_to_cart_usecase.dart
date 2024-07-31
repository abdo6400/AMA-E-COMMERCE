import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class AddProductToCartUseCase implements UseCase<void, String> {
  final CartRepository repository;

  AddProductToCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String productId) async {
    return await repository.addProductToCart(productId);
  }
}
