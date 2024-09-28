import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../../../core/entities/product.dart';
import '../../../domain/usecases/get_recommendation_products_usecase.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  final GetRecommendationProductsUseCase getRecommendationProductsUseCase;

  RecommendationBloc({required this.getRecommendationProductsUseCase})
      : super(RecommendationInitial()) {
    on<GetRecommendationProductsEvent>(_onGetRecommendationProductsEvent);
  }

  Future<void> _onGetRecommendationProductsEvent(
      GetRecommendationProductsEvent event,
      Emitter<RecommendationState> emit) async {
    emit(RecommendationLoading());
    final result = await getRecommendationProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(RecommendationError(message: failure.errorMessage)),
      (products) => emit(RecommendationLoaded(products: products)),
    );
  }
}
