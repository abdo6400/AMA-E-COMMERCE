import '../../domain/entities/category_details.dart';
import 'sub_category_model.dart';

class CategoryDetailsModel extends CategoryDetails {
  CategoryDetailsModel({
    required super.id,
    required super.image,
    required super.name,
    required List<SubCategoryModel> super.subCategories,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      subCategories: (json['subCategories'] as List)
          .map((e) => SubCategoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'subCategories':
          subCategories.map((e) => (e as SubCategoryModel).toJson()).toList(),
    };
  }
}
