
import '../../../../core/models/product_model.dart';
import '../../domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.product,
    required super.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}
