import 'package:equatable/equatable.dart';
import '../../../../core/entities/product.dart';
import 'information.dart';


class ProductDetails extends Equatable {
  final int id;
  final String titleEn;
  final String descriptionEn;
  final String titleAr;
  final String descriptionAr;
  final String sku;
  final double price;
  final double discountPercentage;
  final int stock;
  final int minumimOrderQuantity;
  final double rating;
  final Brand brand;
  final List<String> images;
  final String productUnit;

  final List<Product> relatedProducts;
  final List<Information> extraInformation;

  const ProductDetails({
    required this.id,
    required this.sku,
    required this.titleEn,
    required this.descriptionEn,
    required this.titleAr,
    required this.descriptionAr,
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
        titleEn,
        descriptionEn,
        titleAr,
        descriptionAr,
        discountPercentage,
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
  String nameAr;
  String nameEn;
  String image;
  Brand({required this.id, required this.nameEn,required this.nameAr ,required this.image});
}