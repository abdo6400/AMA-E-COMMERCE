import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/wishlist_product.dart';
import '../repositories/wishlist_repository.dart';

class AddProductToWishlistUseCase implements UseCase< WithListProduct, int> {
  final WishlistRepository repository;

  AddProductToWishlistUseCase(this.repository);

  @override
  Future<Either<Failure,  WithListProduct>> call(int productId) async {
    return await repository.addProductToWishlist(productId);
  }
}
