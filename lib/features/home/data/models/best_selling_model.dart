import '../../domain/entities/best_selling.dart';

class BestSellingProductModel extends BestSellingProduct {
  BestSellingProductModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.price,
    required super.image,
    required super.isAvailable,
    required super.discount,
  });

  factory BestSellingProductModel.fromJson(Map<String, dynamic> json) {
    return BestSellingProductModel(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      image: json['image'],
      isAvailable: json['isAvailable'],
      discount: json['discount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'price': price,
      'image': image,
      'isAvailable': isAvailable,
      'discount': discount,
    };
  }
}
