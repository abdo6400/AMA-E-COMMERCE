part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WithListProduct> products;

  WishlistLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError({required this.message});

  @override
  List<Object?> get props => [message];
}
