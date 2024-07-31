import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class UpdateCartQuantityUseCase
    implements UseCase<void, UpdateCartQuantityParams> {
  final CartRepository repository;

  UpdateCartQuantityUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateCartQuantityParams params) async {
    return await repository.updateCartQuantity(
        params.productId, params.quantity);
  }
}

class UpdateCartQuantityParams {
  final String productId;
  final int quantity;

  UpdateCartQuantityParams({
    required this.productId,
    required this.quantity,
  });
}
