import '../../../../core/entities/product.dart';


class Brand {
  final int id;
  final String image;
  final String nameEn;
    final String nameAr;
  final List<Product> products;

  Brand({
    required this.id,
    required this.image,
    required this.nameEn,
    required this.nameAr,
    required this.products,
  });
}