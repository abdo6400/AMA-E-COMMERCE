import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';

class AddProductToWishlistUseCase implements UseCase<void, int> {
  final WishlistRepository repository;

  AddProductToWishlistUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int productId) async {
    return await repository.addProductToWishlist(productId);
  }
}
