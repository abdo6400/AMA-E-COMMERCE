import 'package:dartz/dartz.dart';
import '../entities/best_selling_and_reommended_product.dart';
import '../entities/category.dart';
import '../entities/offer.dart';
import '../entities/ad.dart';
import '../../../../config/database/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BestSellingAndRecommendedProduct>>> getBestSellerProducts();
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Offer>>> getOffers();
  Future<Either<Failure, List<Ad>>> getAds(); Future<Either<Failure, List<BestSellingAndRecommendedProduct>>> getRecommendationProducts();
}
