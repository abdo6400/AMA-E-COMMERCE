import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/entities/wishlist_product.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_remote_data_source.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource remoteDataSource;

  WishlistRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WithListProduct>> addProductToWishlist(
      int productId) async {
    try {
      final product = await remoteDataSource.addProductToWishlist(productId);
      return  Right(product);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, WithListProduct>> removeProductFromWishlist(
      int id) async {
    try {
      final product = await remoteDataSource.removeProductFromWishlist(id);
      return  Right(product);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<WithListProduct>>> getWishlistProducts() async {
    try {
      final products = await remoteDataSource.getWishlistProducts();
      return Right(products);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
