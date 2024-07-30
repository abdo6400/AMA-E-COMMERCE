// repositories/wishlist_repository.dart

import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/wishlist_product.dart';

abstract class WishlistRepository {
  Future<Either<Failure, void>> addProductToWishlist(int productId);
  Future<Either<Failure, void>> removeProductFromWishlist(int productId);
  Future<Either<Failure, List<WithListProduct>>> getWishlistProducts();
}
