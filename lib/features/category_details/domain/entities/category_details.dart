import 'sub_category.dart';

class CategoryDetails {
  final int id;
  final String image;
  final String nameEn;
  final String nameAr;

  final List<SubCategory> subCategories;

  CategoryDetails({
    required this.id,
    required this.image,
    required this.nameEn,
    required this.nameAr,
    required this.subCategories,
  });
}





