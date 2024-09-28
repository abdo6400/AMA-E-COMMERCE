import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../datasources/cart_remote_data_source.dart';
import '../../domain/entities/cart_product.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CartProduct>>> getCartProducts() async {
    try {
      final cartProducts = await remoteDataSource.getCartProducts();
      return Right(cartProducts);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, CartProduct>> addProductToCart(
      int productId, int quantity) async {
    try {
      final cartProduct =
          await remoteDataSource.addProductToCart(productId, quantity);
      return Right(cartProduct);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, CartProduct>> removeProductFromCart(int id) async {
    try {
      final cartProduct = await remoteDataSource.removeProductFromCart(id);
      return Right(cartProduct);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, CartProduct>> updateCartQuantity(
      int id, int quantity) async {
    try {
      final cartProduct =
          await remoteDataSource.updateCartQuantity(id, quantity);
      return Right(cartProduct);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
