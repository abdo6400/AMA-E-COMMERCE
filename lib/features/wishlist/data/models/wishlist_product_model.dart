import '../../../../core/models/product_model.dart';
import '../../domain/entities/wishlist_product.dart';

class WithListProductModel extends WithListProduct {
  WithListProductModel({
    required super.id,
    required super.product,
  });

  factory WithListProductModel.fromJson(Map<String, dynamic> json) =>
      WithListProductModel(
        id: json["id"],
        product: ProductModel.fromJson(json["product"]),
      );
}
