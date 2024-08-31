
import '../../domain/entities/sub_category.dart';
import 'brand_model.dart';

class SubCategoryModel extends SubCategory {
  SubCategoryModel({
    required super.id,
    required super.image,
    required super.name,
    required List<BrandModel> super.brands,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      brands: (json['brands'] as List)
          .map((e) => BrandModel.fromJson(e))
          .toList(),
    );
  }  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'brands': brands.map((e) => (e as BrandModel).toJson()).toList(),
    };
  }
}