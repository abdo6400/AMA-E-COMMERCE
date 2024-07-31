import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../entities/cart_product.dart';


abstract class CartRepository {
  Future<Either<Failure, List<CartProduct>>> getCartProducts();
  Future<Either<Failure, void>> addProductToCart(String productId);
  Future<Either<Failure, void>> removeProductFromCart(String productId);
  Future<Either<Failure, void>> updateCartQuantity(String productId, int quantity);
}
