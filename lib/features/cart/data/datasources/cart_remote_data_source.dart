import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/cart_product_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartProductModel>> getCartProducts();
  Future<void> addProductToCart(String productId);
  Future<void> removeProductFromCart(String productId);
  Future<void> updateCartQuantity(String productId, int quantity);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<CartProductModel>> getCartProducts() async {
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(Durations.extralong1);
      return List.generate(2, (index) {
        return CartProductModel(
          id: 'id_$index',
          name: 'Product $index',
          image: [
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
          ][index],
          price: (index + 1) * 10.0,
          quantity: index + 1,
        );
      });
    }
    final response = await apiConsumer.get(EndPoints.cartProducts);
    return (response as List).map((e) => CartProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> addProductToCart(String productId) async {
    return await apiConsumer.post(
      EndPoints.addProductToCart,
      body: {'productId': productId},
    );
  }

  @override
  Future<void> removeProductFromCart(String productId) async {
    return await apiConsumer.delete(
      EndPoints.removeProductFromCart,
      body: {'productId': productId},
    );
  }

  @override
  Future<void> updateCartQuantity(String productId, int quantity) async {
    return await apiConsumer.put(
      EndPoints.updateCartQuantity,
      body: {
        'productId': productId,
        'quantity': quantity,
      },
    );
  }
}
