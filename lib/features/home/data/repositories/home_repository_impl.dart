import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/entities/product.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/offer.dart';
import '../../domain/entities/ad.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  @override

  Future<Either<Failure, List<Product>>> getRecommendationProducts() async {
    try {
      final remoteRecommendationProducts =
          await remoteDataSource.getRecommendationProducts();
      return Right(remoteRecommendationProducts);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBestSellerProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getBestSellerProducts();
      return Right(remoteProducts);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final remoteCategories = await remoteDataSource.getCategories();
      return Right(remoteCategories);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Offer>>> getOffers() async {
    try {
      final remoteOffers = await remoteDataSource.getOffers();
      return Right(remoteOffers);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Ad>>> getAds() async {
    try {
      final remoteAds = await remoteDataSource.getAds();
      return Right(remoteAds);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
