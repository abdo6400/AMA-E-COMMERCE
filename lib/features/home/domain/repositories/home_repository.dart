import 'package:dartz/dartz.dart';
import '../../../../core/entities/product.dart';
import '../entities/category.dart';
import '../entities/offer.dart';
import '../entities/ad.dart';
import '../../../../config/database/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Product>>> getBestSellerProducts();
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Offer>>> getOffers();
  Future<Either<Failure, List<Ad>>> getAds(); Future<Either<Failure, List<Product>>> getRecommendationProducts();
}
