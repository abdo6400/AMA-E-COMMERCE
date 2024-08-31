
import '../../domain/entities/brand.dart';
import 'product_model.dart';

class BrandModel extends Brand {
  BrandModel({
    required super.id,
    required super.image,
    required super.name,
    required List<ProductModel> super.products,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'products': products.map((e) => (e as ProductModel).toJson()).toList(),
    };
  }
}