import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/product_details_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProductRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    final response = await apiConsumer.get('${EndPoints.productDetails}/$id');
    return ProductDetailsModel.fromJson(response);
  }
}
