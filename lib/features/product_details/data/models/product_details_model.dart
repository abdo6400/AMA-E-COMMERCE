import '../../../../core/models/product_model.dart';
import '../../domain/entities/product_details.dart';
import 'information_model.dart';


class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel({
    required super.id,
    required super.sku,
    required super.titleEn,
    required super.descriptionEn,
    required super.titleAr,
    required super.descriptionAr,
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
      titleEn: json['titleEn'],
      descriptionEn: json['descriptionEn'],
      titleAr: json['titleAr'],
      descriptionAr: json['descriptionAr'],
      discountPercentage: double.parse(json['discountPercentage'].toString()) ,
      relatedProducts: List<ProductModel>.from(
          json['relatedProducts'].map((e) => ProductModel.fromJson(e))),
      price: double.parse(json['price'].toString()),
      stock: json['stock'],
      brand: BrandModel.fromJson(json['brand']),
      rating: double.parse(json['rating'].toString()),
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
      'titleEn': titleEn,
      'descriptionEn': descriptionEn,
      'titleAr': titleAr,
      'descriptionAr': descriptionAr,
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
  BrandModel({required super.id, required super.nameAr,required super.nameEn ,required super.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      image: json['image'],
    );
  }
}
