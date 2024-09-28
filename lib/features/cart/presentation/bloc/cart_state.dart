part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartProduct> products;
  final bool hasData;
  final bool isAdded;
  final bool isDeleted;
  final bool isUpdated;
  final bool isLoading;
  final bool hasError;
  final String message;
  const CartState(
      {this.products = const [],
      this.isLoading = false,
      this.hasData = false,
      this.isAdded = false,
      this.isDeleted = false,
      this.isUpdated = false,
      this.hasError = false,
      this.message = ""});

  double get totalQuantity {
    return products.fold(0, (sum, e) => sum + (e.quantity * e.product.price));
  }

  @override
  List<Object> get props => [
        products,
        isLoading,
        hasData,
        isAdded,
        isDeleted,
        isUpdated,
        message,
        hasError
      ];

  CartState copyWith({
    List<CartProduct>? products,
    bool? isLoading,
    bool? hasData,
    bool? isAdded,
    bool? isDeleted,
    bool? isUpdated,
  }) {
    return CartState(
      products: products ?? this.products,
      isLoading: isLoading ?? false,
      hasData: hasData ?? false,
      isAdded: isAdded ?? false,
      isDeleted: isDeleted ?? false,
      isUpdated: isUpdated ?? false,
    );
  }

  CartState addProduct(CartProduct newProduct) {
    List<CartProduct> updatedProducts = List.from(products);
    int productIndex = updatedProducts.indexWhere((p) => p.id == newProduct.id);
    if (productIndex != -1) {
      updatedProducts[productIndex] = newProduct;
    } else {
      updatedProducts.add(newProduct);
    }
    return copyWith(
      products: updatedProducts,
      isAdded: true,
      hasData: true,
    );
  }

  CartState removeProduct(CartProduct updatedProduct) {
    return copyWith(
      products: products.where((p) => p.id != updatedProduct.id).toList(),
      isDeleted: true,
      hasData: true,
    );
  }

  CartState updateProduct(CartProduct updatedProduct, int quantity) {
    return copyWith(
      products: quantity < 1
          ? products.where((p) => p.id != updatedProduct.id).toList()
          : products
              .map((p) => p.id == updatedProduct.id ? updatedProduct : p)
              .toList(),
      isUpdated: true,
      hasData: true,
    );
  }
}
