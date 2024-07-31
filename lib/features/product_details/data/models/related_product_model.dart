import '../../domain/entities/related_product.dart';

class RelatedProductModel extends RelatedProduct {
  RelatedProductModel(
      {required super.id,
      required super.name,
      required super.rating,
      required super.price,
      required super.image,
      required super.discount});

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) {
    return RelatedProductModel(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'price': price,
      'image': image,
      'discount': discount,
    };
  }
}
