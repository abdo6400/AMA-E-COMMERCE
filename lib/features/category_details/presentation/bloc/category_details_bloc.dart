import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/category_details.dart';
import '../../domain/usecases/get_category_details_use_case.dart';

part 'category_details_event.dart';
part 'category_details_state.dart';

class CategoryDetailsBloc
    extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  final GetCategoryDetailsUseCase getCategoryDetailsUseCase;

  CategoryDetailsBloc({required this.getCategoryDetailsUseCase})
      : super(CategoryDetailsInitial()) {
    on<GetCategoryDetailsEvent>((event, emit) async {
      emit(CategoryDetailsLoading());
      final failureOrCategoryDetails =
          await getCategoryDetailsUseCase(event.id);
      failureOrCategoryDetails.fold(
        (failure) => emit(CategoryDetailsError(failure.errorMessage)),
        (categoryDetails) => emit(CategoryDetailsLoaded(categoryDetails)),
      );
    });
  }
}
