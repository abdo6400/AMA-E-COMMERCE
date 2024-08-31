part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartProduct> products;

  const CartLoaded({required this.products});

  double get totalQuantity {
    return products.sumByDouble((e) => (e.quantity * e.price));
  }

  @override
  List<Object> get props => [products];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}

class CartQuantityUpdated extends CartState {
  final List<CartProduct> products;

  const CartQuantityUpdated({required this.products});

  @override
  List<Object> get props => [products];
}
