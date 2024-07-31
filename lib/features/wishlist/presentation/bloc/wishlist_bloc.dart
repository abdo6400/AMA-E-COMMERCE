import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../domain/entities/wishlist_product.dart';
import '../../domain/usecases/add_product_to_wishlist_usecase.dart';
import '../../domain/usecases/get_wishlist_products_usecase.dart';
import '../../domain/usecases/remove_product_from_wishlist_usecase.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlistProductsUseCase _getWishlistProductsUseCase;
  final AddProductToWishlistUseCase _addProductToWishlistUseCase;
  final RemoveProductFromWishlistUseCase _removeProductFromWishlistUseCase;

  WishlistBloc(this._getWishlistProductsUseCase, this._addProductToWishlistUseCase, this._removeProductFromWishlistUseCase)  : 
        super(WishlistInitial()) {
    on<AddProductToWishlistEvent>(_onAddProductToWishlistEvent);
    on<RemoveProductFromWishlistEvent>(_onRemoveProductFromWishlistEvent);
    on<GetWishlistProductsEvent>(_onGetWishlistProductsEvent);
  }

  Future<void> _onAddProductToWishlistEvent(
      AddProductToWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    final result = await _addProductToWishlistUseCase(event.productId);
    result.fold(
      (failure) => emit(WishlistError(message: failure.errorMessage)),
      (_) async {
        final productsResult = await _getWishlistProductsUseCase(NoParams());
        productsResult.fold(
          (failure) => emit(WishlistError(message: failure.errorMessage)),
          (products) => emit(WishlistLoaded(products: products)),
        );
      },
    );
  }

  Future<void> _onRemoveProductFromWishlistEvent(
      RemoveProductFromWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    final result = await _removeProductFromWishlistUseCase(event.productId);
    result.fold(
      (failure) => emit(WishlistError(message: failure.errorMessage)),
      (_) async {
        final productsResult = await _getWishlistProductsUseCase(NoParams());
        productsResult.fold(
          (failure) => emit(WishlistError(message: failure.errorMessage)),
          (products) => emit(WishlistLoaded(products: products)),
        );
      },
    );
  }

  Future<void> _onGetWishlistProductsEvent(
      GetWishlistProductsEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    final result = await _getWishlistProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(WishlistError(message: failure.errorMessage)),
      (products) => emit(WishlistLoaded(products: products)),
    );
  }
}
