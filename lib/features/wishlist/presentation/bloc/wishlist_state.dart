part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final List<WithListProduct> products;
  final bool isLoading;
  final bool hasData;
  final bool isAdded;
  final bool isDeleted;
  final bool hasError;
  final String message;

  const WishlistState(
      {this.products = const [],
      this.isLoading = false,
      this.isAdded = false,
      this.isDeleted = false,
      this.hasError = false,
      this.hasData = false,
      this.message=""});

  @override
  List<Object?> get props =>
      [products, isLoading, hasData, isAdded, isDeleted, message, hasError];
  WishlistState copyWith({
    List<WithListProduct>? products,
    bool? isLoading,
    bool? hasData,
    bool? isAdded,
    bool? isDeleted,
  }) {
    return WishlistState(
      products: products ?? this.products,
      isLoading: isLoading ?? false,
      hasData: hasData ?? false,
      isAdded: isAdded ?? false,
      isDeleted: isDeleted ?? false,
    );
  }

  WishlistState addProduct(WithListProduct newProduct) {
    return copyWith(
      products: List.from(products)..add(newProduct),
      isAdded: true,
      hasData: true,
    );
  }

  WishlistState removeProduct(WithListProduct productToRemove) {
    return copyWith(
      products: products.where((p) => p.id != productToRemove.id).toList(),
      isDeleted: true,
      hasData: true,
    );
  }
}
