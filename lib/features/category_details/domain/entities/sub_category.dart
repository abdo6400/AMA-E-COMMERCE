

import 'brand.dart';

class SubCategory {
  final int id;
  final String image;
  final String nameEn;
  final String nameAr;

  final List<Brand> brands;

  SubCategory({
    required this.id,
    required this.image,
    required this.nameEn,
    required this.nameAr,
    required this.brands,
  });
}