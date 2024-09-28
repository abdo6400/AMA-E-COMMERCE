import 'package:equatable/equatable.dart';

import '../../../../core/entities/product.dart';

class CartProduct extends Equatable {
  final int id;
  final int quantity;
  final Product product;


  const CartProduct({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object> get props => [id, product, quantity];
}
