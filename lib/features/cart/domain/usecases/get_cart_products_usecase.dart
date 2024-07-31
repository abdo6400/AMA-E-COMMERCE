import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/cart_product.dart';
import '../repositories/cart_repository.dart';


class GetCartProductsUseCase implements UseCase<List<CartProduct>, NoParams> {
  final CartRepository repository;

  GetCartProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartProduct>>> call(NoParams params) async {
    return await repository.getCartProducts();
  }
}
