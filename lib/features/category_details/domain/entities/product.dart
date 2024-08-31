class Product {
  final int id;
  final String title;
  final String description;
  final String sku;
  final String productUnit;
  final double price;
  final int stock;
  final int minimumOrderQuantity;
  final double discountPercentage;
  final double rating;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.sku,
    required this.productUnit,
    required this.price,
    required this.stock,
    required this.minimumOrderQuantity,
    required this.discountPercentage,
    required this.rating,
    required this.images,
  });
}
