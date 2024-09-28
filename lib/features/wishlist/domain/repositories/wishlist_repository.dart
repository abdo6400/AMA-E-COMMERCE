

import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/wishlist_product.dart';

abstract class WishlistRepository {
  Future<Either<Failure, WithListProduct>> addProductToWishlist(int productId);
  Future<Either<Failure, WithListProduct>> removeProductFromWishlist(int id);
  Future<Either<Failure, List<WithListProduct>>> getWishlistProducts();
}
