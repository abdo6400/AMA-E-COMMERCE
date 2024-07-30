import 'package:flutter/foundation.dart';

import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/best_selling_model.dart';
import '../models/category_model.dart';
import '../models/offer_model.dart';
import '../models/ad_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BestSellingProductModel>> getBestSellerProducts();
  Future<List<CategoryModel>> getCategories();
  Future<List<OfferModel>> getOffers();
  Future<List<AdModel>> getAds();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<BestSellingProductModel>> getBestSellerProducts() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 10));
      return [
        BestSellingProductModel(
          id: 1,
          name: "Fjallraven - Foldsack No. 1 Backpack",
          rating: 3.9,
          price: 109.95,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          isAvailable: true,
          discount: 0.0,
        ),
        BestSellingProductModel(
          id: 2,
          name: "Mens Casual Premium Slim Fit T-Shirts",
          rating: 4.1,
          price: 22.3,
          image:
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
          isAvailable: true,
          discount: 0.0,
        ),
        // Add more products as needed
      ];
    }

    final response = await _apiConsumer.get(EndPoints.bestSellerProducts);
    return (response as List)
        .map((json) => BestSellingProductModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 10));
      return [
        CategoryModel(
          id: 1,
          name: "men's clothing",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        ),
        CategoryModel(
          id: 2,
          name: "jewelery",
          image:
              "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
        ),
        CategoryModel(
          id: 3,
          name: "electronics",
          image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
        ),
        // Add more categories as needed
      ];
    }

    final response = await _apiConsumer.get(EndPoints.categories);
    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<OfferModel>> getOffers() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 10));
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
      await Future.delayed(const Duration(seconds: 10));
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
