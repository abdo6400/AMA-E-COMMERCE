import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/product_details.dart';
import '../../domain/usecases/get_product_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase) : super(ProductDetailsInitial()) {
    on<FetchProductDetailsEvent>(_onFetchProductDetailsEvent);
  }

  Future<void> _onFetchProductDetailsEvent(FetchProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    emit(ProductDetailsLoading());
    final result = await getProductDetailsUseCase(event.productId);
    result.fold(
      (failure) => emit(ProductDetailsError(message: failure.errorMessage)),
      (productDetails) => emit(ProductDetailsLoaded(productDetails: productDetails)),
    );
  }
}
