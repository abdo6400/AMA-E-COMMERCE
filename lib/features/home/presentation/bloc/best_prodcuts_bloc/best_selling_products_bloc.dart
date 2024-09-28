import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../../core/entities/product.dart';
import '../../../domain/usecases/get_best_selling_products_usecase.dart';
part 'best_selling_products_event.dart';
part 'best_selling_products_state.dart';

class BestSellingProductsBloc
    extends Bloc<BestSellingProductsEvent, BestSellingProductsState> {
  final GetBestSellingProductsUseCase _getBestSellingProductsUseCase;

  BestSellingProductsBloc(this._getBestSellingProductsUseCase)
      : super(BestSellingProductsInitial()) {
    on<FetchBestSellingProductsEvent>(onFetchBestSellingProductsEvent);
  }

  void onFetchBestSellingProductsEvent(FetchBestSellingProductsEvent event,
      Emitter<BestSellingProductsState> emit) async {
    emit(BestSellingProductsLoading());
    final result = await _getBestSellingProductsUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(BestSellingProductsError(message: failure.errorMessage)),
      (products) => emit(BestSellingProductsLoaded(products: products)),
    );
  }
}
