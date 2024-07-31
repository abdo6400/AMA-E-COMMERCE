import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final String id;
  final String name;
  final String image;
  final double price;
  final int quantity;

  const CartProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object> get props => [id, name, image, price, quantity];
}
