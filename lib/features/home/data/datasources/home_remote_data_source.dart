import 'package:flutter/foundation.dart';

import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/best_selling_and_recommended_product_model.dart';
import '../models/category_model.dart';
import '../models/offer_model.dart';
import '../models/ad_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BestSellingAndRecommendedProductModel>> getBestSellerProducts();
  Future<List<CategoryModel>> getCategories();
  Future<List<OfferModel>> getOffers();
  Future<List<AdModel>> getAds();
  Future<List<BestSellingAndRecommendedProductModel>>
      getRecommendationProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<List<BestSellingAndRecommendedProductModel>>
      getRecommendationProducts() async {
    // Fetch data from the API in production mode
    final response = await _apiConsumer.get(EndPoints.recommendationProducts);
    return (response as List)
        .map((e) => BestSellingAndRecommendedProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<BestSellingAndRecommendedProductModel>>
      getBestSellerProducts() async {
    final response = await _apiConsumer.get(EndPoints.bestSellerProducts);
    return (response as List)
        .map((json) => BestSellingAndRecommendedProductModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiConsumer.get(EndPoints.categories);
    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<OfferModel>> getOffers() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 2));
      return [
        OfferModel(
          id: 1,
          title: "Up to 50% off on all clothing",
          subtitle: "Limited time offer",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        ),
        OfferModel(
          id: 2,
          title: "Buy 1 Get 1 Free",
          subtitle: "On selected items",
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
        // Add more offers as needed
      ];
    }

    final response = await _apiConsumer.get(EndPoints.offers);
    return (response as List).map((json) => OfferModel.fromJson(json)).toList();
  }

  @override
  Future<List<AdModel>> getAds() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 2));
      return [
        AdModel(
          id: 1,
          link: "https://fakestoreapi.com",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        ),
        AdModel(
          id: 2,
          link: "https://fakestoreapi.com",
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        ),
        // Add more ads as needed
      ];
    }

    final response = await _apiConsumer.get(EndPoints.ads);
    return (response as List).map((json) => AdModel.fromJson(json)).toList();
  }
}
