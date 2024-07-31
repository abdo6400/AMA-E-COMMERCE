import '../../domain/entities/product_details.dart';
import 'related_product_model.dart';

class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel(
      {required super.id,
      required super.sku,
      required super.title,
      required super.description,
      required super.price,
      required super.stock,
      required super.category,
      required super.relatedProducts,
      super.brand,
      super.sizes,
      super.colors,
      super.images,
      super.material,
      super.dimensions,
      super.weight,
      super.warranty,
      super.features,
      super.gender,
      super.ageRange,
      super.expiryDate,
      super.ingredients,
      super.careInstructions,
      required super.rating});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
        id: json['id'],
        sku: json['sku'],
        title: json['title'],
        description: json['description'],
        relatedProducts: List<RelatedProductModel>.from(
            json['relatedProducts'].map((e) => RelatedProductModel.fromJson(e))),
        price: json['price'],
        stock: json['stock'],
        category: json['category'],
        brand: json['brand'] ?? '',
        sizes: List<String>.from(json['sizes'] ?? []),
        colors: List<String>.from(json['colors'] ?? []),
        images: List<String>.from(json['images'] ?? []),
        material: json['material'] ?? '',
        dimensions: json['dimensions'] ?? '',
        weight: json['weight'] ?? 0.0,
        warranty: json['warranty'] ?? '',
        features: json['features'] ?? '',
        gender: json['gender'] ?? '',
        ageRange: json['ageRange'] ?? '',
        expiryDate: json['expiryDate'] != null
            ? DateTime.parse(json['expiryDate'])
            : null,
        ingredients: json['ingredients'] ?? '',
        careInstructions: json['careInstructions'] ?? '',
        rating: json['rating'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'description': description,
      'price': price,
      'stock': stock,
      'category': category,
      'brand': brand,
      'sizes': sizes,
      'colors': colors,
      'images': images,
      'material': material,
      'dimensions': dimensions,
      'weight': weight,
      'warranty': warranty,
      'features': features,
      'gender': gender,
      'ageRange': ageRange,
      'expiryDate': expiryDate?.toIso8601String(),
      'ingredients': ingredients,
      'careInstructions': careInstructions,
    };
  }
}
