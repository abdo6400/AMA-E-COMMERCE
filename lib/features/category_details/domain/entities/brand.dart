import 'product.dart';

class Brand {
  final int id;
  final String image;
  final String name;
  final List<Product> products;

  Brand({
    required this.id,
    required this.image,
    required this.name,
    required this.products,
  });
}