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
  Future<Either<Failure, void>> addProductToWishlist(int productId) async {
    try {
      await remoteDataSource.addProductToWishlist(productId);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromWishlist(int productId) async {
    try {
      await remoteDataSource.removeProductFromWishlist(productId);
      return const Right(null);
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
