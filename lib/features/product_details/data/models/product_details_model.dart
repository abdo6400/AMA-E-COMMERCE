import '../../domain/entities/product_details.dart';
import 'information_model.dart';
import 'related_product_model.dart';

class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel({
    required super.id,
    required super.sku,
    required super.title,
    required super.description,
    required super.price,
    required super.stock,
    required super.brand,
    required super.relatedProducts,
    required super.minumimOrderQuantity,
    required super.rating,
    required super.extraInformation,
    required super.discountPercentage,
    required super.images,
    required super.productUnit,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      sku: json['sku'],
      title: json['title'],
      description: json['description'],
      discountPercentage: json['discountPercentage'] ?? 0.0,
      relatedProducts: List<RelatedProductModel>.from(
          json['relatedProducts'].map((e) => RelatedProductModel.fromJson(e))),
      price: json['price'],
      stock: json['stock'],
      brand: BrandModel.fromJson(json['brand']),
      rating: json['rating'] ?? 0.0,
      minumimOrderQuantity: json['minumimOrderQuantity'] ?? 1,
      extraInformation: List<InformationModel>.from(
          json['informations']?.map((e) => InformationModel.fromJson(e))),
      images: List<String>.from(json['images'] ?? []),
      productUnit: json['product_Unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'description': description,
      'price': price,
      'stock': stock,
      'brand': brand,
      'images': images,
      'minumimOrderQuantity': minumimOrderQuantity,
      'extraInformation': extraInformation,
    };
  }
}

class BrandModel extends Brand {
  BrandModel({required super.id, required super.name, required super.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
