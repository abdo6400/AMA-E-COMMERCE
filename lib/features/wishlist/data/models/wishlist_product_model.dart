

import '../../domain/entities/wishlist_product.dart';

class WithListProductModel extends WithListProduct {
  WithListProductModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.price,
    required super.image,
    required super.isAvailable,
    required super.discount,
  });

  // Factory method to create a model from JSON
  factory WithListProductModel.fromJson(Map<String, dynamic> json) {
    return WithListProductModel(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      isAvailable: json['isAvailable'],
      discount: json['discount'],
    );
  }

  // Convert model to JSON
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
