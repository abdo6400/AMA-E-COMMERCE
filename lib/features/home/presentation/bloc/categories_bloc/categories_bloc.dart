import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesBloc(this._getCategoriesUseCase) : super(CategoriesInitial()) {
    on<FetchCategoriesEvent>(onFetchCategoriesEvent);
  }

  void onFetchCategoriesEvent(FetchCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    final result = await _getCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(CategoriesError(message: failure.errorMessage)),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );
  }
}
