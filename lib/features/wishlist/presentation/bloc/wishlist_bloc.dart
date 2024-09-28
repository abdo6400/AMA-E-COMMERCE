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

  WishlistBloc(this._getWishlistProductsUseCase,
      this._addProductToWishlistUseCase, this._removeProductFromWishlistUseCase)
      : super(const WishlistState()) {
    on<AddProductToWishlistEvent>(_onAddProductToWishlistEvent);
    on<RemoveProductFromWishlistEvent>(_onRemoveProductFromWishlistEvent);
    on<GetWishlistProductsEvent>(_onGetWishlistProductsEvent);
  }
  List<int> favoriteItems = [];
  Future<void> _onAddProductToWishlistEvent(
      AddProductToWishlistEvent event, Emitter<WishlistState> emit) async {
    favoriteItems.add(event.productId);
    final result = await _addProductToWishlistUseCase(event.productId);
    result.fold((failure) => emit(WishlistState(message: failure.errorMessage)),
        (newProduct) async {
      emit(state.addProduct(newProduct));
    });
  }

  void getFavoriteIds(List<WithListProduct> products) {
    List<int> items = [];
    for (var element in products) {
      if (!items.contains(element.product.id)) {
        items.add(element.product.id);
      }
    }
    favoriteItems = items;
  }

  Future<void> _onRemoveProductFromWishlistEvent(
      RemoveProductFromWishlistEvent event, Emitter<WishlistState> emit) async {
    favoriteItems.remove(event.productId);
    final result = await _removeProductFromWishlistUseCase(event.productId);
    result.fold((failure) => emit(WishlistState(message: failure.errorMessage)),
        (deletedProduct) async {
      emit((state.removeProduct(deletedProduct)));
    });
  }

  Future<void> _onGetWishlistProductsEvent(
      GetWishlistProductsEvent event, Emitter<WishlistState> emit) async {
    emit(const WishlistState(isLoading: true));
    final result = await _getWishlistProductsUseCase(NoParams());
    result.fold(
        (failure) =>
            emit(WishlistState(message: failure.errorMessage, hasError: true)),
        (products) async {
      getFavoriteIds(products);
      emit(
        WishlistState(products: products, hasData: true),
      );
    });
  }
}
