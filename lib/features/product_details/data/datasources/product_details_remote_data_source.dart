import 'package:ama/features/product_details/data/models/related_product_model.dart';
import 'package:flutter/foundation.dart'; // Import the foundation library for kDebugMode
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
    if (kDebugMode) {
      // Return dummy data in debug mode
      await Future.delayed(const Duration(seconds: 10));
      return ProductDetailsModel(
        id: id,
        sku: 'DUMMY-SKU',
        title: 'Dummy Product',
        description: 'This is a dummy product description',
        price: 99.99,
        stock: 10,
        category: 'Mens',
        brand: 'ZARA',
        sizes: const ['S', 'M', 'L'],
        colors: const ['#FF0000', '#0000FF', '#00FF00'],
        images: const [
          'https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://images.pexels.com/photos/1082529/pexels-photo-1082529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
        ],
        relatedProducts: List.generate(
            2,
            (index) => RelatedProductModel(
                id: index,
                name: 'Dummy Product',
                rating: 3.5,
                price: 1000,
                image:
                    "https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                discount: 0.0)),
        material: 'Dummy Material',
        dimensions: '10x10x10 cm',
        weight: 0.5,
        warranty: '1 year',
        features: 'Dummy features',
        rating: 4.5,
        gender: 'Unisex',
        ageRange: 'All ages',
        expiryDate: DateTime.now().add(const Duration(days: 365)),
        ingredients: 'Dummy ingredients',
        careInstructions: 'Dummy care instructions',
      );
    } else {
      // Fetch data from the API in production mode
      final response = await apiConsumer.get('${EndPoints.productDetails}/$id');
      return ProductDetailsModel.fromJson(response);
    }
  }
}
