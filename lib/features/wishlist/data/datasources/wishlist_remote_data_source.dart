import 'package:flutter/foundation.dart';
import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/wishlist_product_model.dart';

abstract class WishlistRemoteDataSource {
  Future<void> addProductToWishlist(int productId);
  Future<void> removeProductFromWishlist(int productId);
  Future<List<WithListProductModel>> getWishlistProducts();
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiConsumer _apiConsumer;

  WishlistRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<void> addProductToWishlist(int productId) async {
    // Send a request to add a product to the wishlist
    await _apiConsumer.post(
      EndPoints.addToWishlist,
      queryParameters: {'productId': productId},
    );
  }

  @override
  Future<void> removeProductFromWishlist(int productId) async {
    // Send a request to remove a product from the wishlist
    await _apiConsumer.post(
      EndPoints.removeFromWishlist,
      queryParameters: {'productId': productId},
    );
  }

  @override
  Future<List<WithListProductModel>> getWishlistProducts() async {
  if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 10));
      return [
        WithListProductModel(
          id: 1,
          name: "Fjallraven - Foldsack No. 1 Backpack",
          rating: 3.9,
          price: 109.95,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          isAvailable: true,
          discount: 0.0,
        ),
        WithListProductModel(
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

    final response = await _apiConsumer.get(EndPoints.wishlist);
    return (response as List)
        .map((json) => WithListProductModel.fromJson(json))
        .toList();
  }
}
