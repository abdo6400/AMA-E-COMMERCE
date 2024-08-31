

import 'brand.dart';

class SubCategory {
  final int id;
  final String image;
  final String name;
  final List<Brand> brands;

  SubCategory({
    required this.id,
    required this.image,
    required this.name,
    required this.brands,
  });
}