import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../entities/cart_product.dart';


abstract class CartRepository {
  Future<Either<Failure, List<CartProduct>>> getCartProducts();
  Future<Either<Failure, CartProduct>> addProductToCart(int productId, int quantity);
  Future<Either<Failure, CartProduct>> removeProductFromCart(int id);
  Future<Either<Failure, CartProduct>> updateCartQuantity(int id, int quantity);
}
