import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supercharged/supercharged.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../domain/entities/cart_product.dart';
import '../../domain/usecases/add_product_to_cart_usecase.dart';
import '../../domain/usecases/get_cart_products_usecase.dart';
import '../../domain/usecases/remove_product_from_cart_usecase.dart';
import '../../domain/usecases/update_cart_quantity_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartProductsUseCase _getCartProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;

  CartBloc(this._getCartProductsUseCase, this._addProductToCartUseCase,
      this._removeProductFromCartUseCase, this._updateCartQuantityUseCase)
      : super(CartInitial()) {
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCartEvent);
    on<GetCartProductsEvent>(_onGetCartProductsEvent);
    on<UpdateCartQuantityEvent>(_onUpdateCartQuantityEvent);
  }

  Future<void> _onAddProductToCartEvent(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await _addProductToCartUseCase(event.productId);
    result.fold(
      (failure) => emit(CartError(message: failure.errorMessage)),
      (_) async {
        final productsResult = await _getCartProductsUseCase(NoParams());
        productsResult.fold(
          (failure) => emit(CartError(message: failure.errorMessage)),
          (products) => emit(CartLoaded(products: products)),
        );
      },
    );
  }

  Future<void> _onRemoveProductFromCartEvent(
      RemoveProductFromCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await _removeProductFromCartUseCase(event.productId);
    result.fold(
      (failure) => emit(CartError(message: failure.errorMessage)),
      (_) async {
        final productsResult = await _getCartProductsUseCase(NoParams());
        productsResult.fold(
          (failure) => emit(CartError(message: failure.errorMessage)),
          (products) => emit(CartLoaded(products: products)),
        );
      },
    );
  }

  Future<void> _onGetCartProductsEvent(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await _getCartProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(CartError(message: failure.errorMessage)),
      (products) => emit(CartLoaded(products: products)),
    );
  }

  Future<void> _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await _updateCartQuantityUseCase(UpdateCartQuantityParams(
      productId: event.productId,
      quantity: event.quantity,
    ));
    result.fold(
      (failure) => emit(CartError(message: failure.errorMessage)),
      (_) async {
        final productsResult = await _getCartProductsUseCase(NoParams());
        productsResult.fold(
          (failure) => emit(CartError(message: failure.errorMessage)),
          (products) => emit(CartLoaded(products: products)),
        );
      },
    );
  }
}
