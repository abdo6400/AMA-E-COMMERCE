
import '../../../../core/models/product_model.dart';
import '../../domain/entities/brand.dart';


class BrandModel extends Brand {
  BrandModel({
    required super.id,
    required super.image,
    required super.nameEn,
    required super.nameAr,
    required List<ProductModel> super.products,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      image: json['image'],
      nameEn: json['nameEn'],
      nameAr: json['nameAr'],  
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'products': products.map((e) => (e as ProductModel).toJson()).toList(),
    };
  }
}