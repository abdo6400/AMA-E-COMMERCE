part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProductToWishlistEvent extends WishlistEvent {
  final int productId;

  AddProductToWishlistEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveProductFromWishlistEvent extends WishlistEvent {
  final int productId;

  RemoveProductFromWishlistEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class GetWishlistProductsEvent extends WishlistEvent {}
