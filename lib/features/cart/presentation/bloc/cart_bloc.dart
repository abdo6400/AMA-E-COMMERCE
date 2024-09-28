import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      : super(const CartState()) {
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCartEvent);
    on<GetCartProductsEvent>(_onGetCartProductsEvent);
    on<UpdateCartQuantityEvent>(_onUpdateCartQuantityEvent);
    on<ClearCartProductsEvent>(_onClearCartProductsEvent);
  }

  Future<void> _onAddProductToCartEvent(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    final result = await _addProductToCartUseCase(AddProductToCartParams(
      productId: event.productId,
      quantity: event.quantity,
    ));
    result.fold(
      (failure) =>
          emit(CartState(message: failure.errorMessage, hasError: true)),
      (product) => emit(state.addProduct(product)),
    );
  }

  Future<void> _onRemoveProductFromCartEvent(
      RemoveProductFromCartEvent event, Emitter<CartState> emit) async {
    final result = await _removeProductFromCartUseCase(event.id);
    result.fold(
      (failure) =>
          emit(CartState(message: failure.errorMessage, hasError: true)),
      (product) => emit(state.removeProduct(product)),
    );
  }

  Future<void> _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<CartState> emit) async {
    final result = await _updateCartQuantityUseCase(UpdateCartQuantityParams(
      id: event.id,
      quantity: event.quantity,
    ));
    result.fold(
      (failure) =>
          emit(CartState(message: failure.errorMessage, hasError: true)),
      (product) => emit(state.updateProduct(product, event.quantity)),
    );
  }

  Future<void> _onGetCartProductsEvent(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    emit(const CartState(isLoading: true));
    final result = await _getCartProductsUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(CartState(message: failure.errorMessage, hasError: true)),
      (products) =>
          emit(CartState(products: products, hasData: true, isLoading: false)),
    );
  }

  Future<void> _onClearCartProductsEvent(
      ClearCartProductsEvent event, Emitter<CartState> emit) async {
    emit(const CartState());
  }
}
