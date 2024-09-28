import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/cart_product_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartProductModel>> getCartProducts();
  Future<CartProductModel> addProductToCart(int productId, int quantity);
  Future<CartProductModel> removeProductFromCart(int id);
  Future<CartProductModel> updateCartQuantity(int id, int quantity);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<CartProductModel>> getCartProducts() async {
    final response = await apiConsumer.get(EndPoints.cartProducts);
    return (response as List).map((e) => CartProductModel.fromJson(e)).toList();
  }

  @override
  Future<CartProductModel> addProductToCart(int productId, int quantity) async {
    final response = await apiConsumer.post(
      EndPoints.cartProducts,
      body: {'productId': productId, 'quantity': quantity},
    );
    return CartProductModel.fromJson(response);
  }

  @override
  Future<CartProductModel> removeProductFromCart(int id) async {
    final response = await apiConsumer.delete(
      "${EndPoints.cartProducts}/$id",
    );
    return CartProductModel.fromJson(response);
  }

  @override
  Future<CartProductModel> updateCartQuantity(int id, int quantity) async {
    final response = await apiConsumer.put(
      '${EndPoints.cartProducts}/$id',
      body: {
        'quantity': quantity,
      },
    );
    return CartProductModel.fromJson(response);
  }
}
