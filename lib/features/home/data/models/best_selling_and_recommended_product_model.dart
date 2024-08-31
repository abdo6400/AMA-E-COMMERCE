import '../../domain/entities/best_selling_and_reommended_product.dart';

class BestSellingAndRecommendedProductModel
    extends BestSellingAndRecommendedProduct {
  BestSellingAndRecommendedProductModel({
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

  factory BestSellingAndRecommendedProductModel.fromJson(
      Map<String, dynamic> json) {
    return BestSellingAndRecommendedProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      sku: json["sku"],
      productUnit: json["product_Unit"],
      price: json["price"],
      stock: json["stock"],
      minimumOrderQuantity: json["minimumOrderQuantity"],
      discountPercentage: json["discountPercentage"],
      rating: json["rating"],
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "sku": sku,
      "product_Unit": productUnit,
      "price": price,
      "stock": stock,
      "minimumOrderQuantity": minimumOrderQuantity,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "images": List<dynamic>.from(images.map((x) => x)),
    };
  }
}
