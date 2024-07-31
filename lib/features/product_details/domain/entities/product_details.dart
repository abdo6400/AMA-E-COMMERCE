import 'package:equatable/equatable.dart';

import 'related_product.dart';

class ProductDetails extends Equatable {
  final int id;
  final String title;
  final String sku;
  final String description;
  final double price;
  final int stock;
  final String category;
  final String brand;
  final List<String> sizes;
  final List<String> colors;
  final List<String> images;
  final String material;
  final String dimensions;
  final double weight;
  final String warranty;
  final String features;
  final String gender;
  final String ageRange;
  final DateTime? expiryDate;
  final String ingredients;
  final String careInstructions;
  final double rating;
  final List<RelatedProduct> relatedProducts;
  const ProductDetails({
    required this.id,
    required this.sku,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.rating,
    required this.relatedProducts,
    this.brand = '',
    this.sizes = const [],
    this.colors = const [],
    this.images = const [],
    this.material = '',
    this.dimensions = '',
    this.weight = 0.0,
    this.warranty = '',
    this.features = '',
    this.gender = '',
    this.ageRange = '',
    this.expiryDate,
    this.ingredients = '',
    this.careInstructions = '',
  });

  @override
  List<Object?> get props => [
        id,
        sku,
        description,
        price,
        stock,
        category,
        brand,
        sizes,
        colors,
        images,
        material,
        dimensions,
        weight,
        warranty,
        features,
        gender,
        ageRange,
        expiryDate,
        ingredients,
        careInstructions,
        rating,
        relatedProducts
      ];
}
