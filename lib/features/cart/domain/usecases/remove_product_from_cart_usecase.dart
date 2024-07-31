import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class RemoveProductFromCartUseCase implements UseCase<void, String> {
  final CartRepository repository;

  RemoveProductFromCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String productId) async {
    return await repository.removeProductFromCart(productId);
  }
}
