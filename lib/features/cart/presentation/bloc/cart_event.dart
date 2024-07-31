part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartProductsEvent extends CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final String productId;

  const AddProductToCartEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class RemoveProductFromCartEvent extends CartEvent {
  final String productId;

  const RemoveProductFromCartEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class UpdateCartQuantityEvent extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateCartQuantityEvent(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}
