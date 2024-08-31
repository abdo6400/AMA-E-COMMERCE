import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.sku,
    required super.productUnit,
    required super.price,
    required super.stock,
    required super.minimumOrderQuantity,
    required super.discountPercentage,
    required super.rating,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      sku: json['sku'],
      productUnit: json['product_Unit'],
      price: json['price'],
      stock: json['stock'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      discountPercentage: json['discountPercentage'],
      rating: double.parse(json['rating'].toString()),
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'sku': sku,
      'product_Unit': productUnit,
      'price': price,
      'stock': stock,
      'minimumOrderQuantity': minimumOrderQuantity,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'images': images,
    };
  }
}
