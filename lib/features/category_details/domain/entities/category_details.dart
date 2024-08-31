import 'sub_category.dart';

class CategoryDetails {
  final int id;
  final String image;
  final String name;
  final List<SubCategory> subCategories;

  CategoryDetails({
    required this.id,
    required this.image,
    required this.name,
    required this.subCategories,
  });
}





