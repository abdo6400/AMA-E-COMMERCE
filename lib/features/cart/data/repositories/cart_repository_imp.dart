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
      final remoteCartProducts = await remoteDataSource.getCartProducts();
      return Right(remoteCartProducts);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToCart(String productId) async {
    try {
      await remoteDataSource.addProductToCart(productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromCart(String productId) async {
    try {
      await remoteDataSource.removeProductFromCart(productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartQuantity(
      String productId, int quantity) async {
    try {
      await remoteDataSource.updateCartQuantity(productId, quantity);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
