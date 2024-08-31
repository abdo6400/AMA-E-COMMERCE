import 'package:equatable/equatable.dart';

import 'information.dart';
import 'related_product.dart';

class ProductDetails extends Equatable {
  final int id;
  final String title;
  final String sku;
  final String description;
  final double price;
  final double discountPercentage;
  final int stock;
  final int minumimOrderQuantity;
  final double rating;
  final Brand brand;
  final List<String> images;
  final String productUnit;

  final List<RelatedProduct> relatedProducts;
  final List<Information> extraInformation;

  const ProductDetails({
    required this.id,
    required this.sku,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.brand,
    required this.rating,
    required this.relatedProducts,
    required this.minumimOrderQuantity,
    required this.extraInformation,
    required this.discountPercentage,
    required this.images,
    required this.productUnit


  });

  @override
  List<Object?> get props => [
        id,
        sku,
        description,
        price,
        stock,
        brand,
        images,
        minumimOrderQuantity,
        rating,
        relatedProducts,
        extraInformation
      ];
}


class Brand{
  int id;
  String name;
  String image;
  Brand({required this.id, required this.name, required this.image});
}