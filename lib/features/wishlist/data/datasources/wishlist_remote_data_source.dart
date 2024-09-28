import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/wishlist_product_model.dart';

abstract class WishlistRemoteDataSource {
  Future<WithListProductModel> addProductToWishlist(int productId);
  Future<WithListProductModel> removeProductFromWishlist(int id);
  Future<List<WithListProductModel>> getWishlistProducts();
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiConsumer _apiConsumer;

  WishlistRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<WithListProductModel> addProductToWishlist(int productId) async {
    final response = await _apiConsumer.post(
      EndPoints.wishlist,
      body: {'productId': productId},
    );
    return WithListProductModel.fromJson(response);
  }

  @override
  Future<WithListProductModel> removeProductFromWishlist(int id) async {
    final response = await _apiConsumer.delete(
      "${EndPoints.wishlist}/$id",
    );
    return WithListProductModel.fromJson(response);
  }

  @override
  Future<List<WithListProductModel>> getWishlistProducts() async {
    final response = await _apiConsumer.get(EndPoints.wishlist);
    return (response as List)
        .map((json) => WithListProductModel.fromJson(json))
        .toList();
  }
}
