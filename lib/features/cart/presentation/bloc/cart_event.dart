part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartProductsEvent extends CartEvent {}

class ClearCartProductsEvent extends CartEvent {}
class AddProductToCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  const AddProductToCartEvent(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}

class RemoveProductFromCartEvent extends CartEvent {
  final int id;

  const RemoveProductFromCartEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateCartQuantityEvent extends CartEvent {
  final int id;
  final int quantity;

  const UpdateCartQuantityEvent(this.id, this.quantity);

  @override
  List<Object> get props => [id, quantity];
}
