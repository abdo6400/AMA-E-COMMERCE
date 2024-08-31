part of 'category_details_bloc.dart';

abstract class CategoryDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsLoading extends CategoryDetailsState {}

class CategoryDetailsLoaded extends CategoryDetailsState {
  final CategoryDetails categoryDetails;

  CategoryDetailsLoaded(this.categoryDetails);

  @override
  List<Object?> get props => [categoryDetails];
}

class CategoryDetailsError extends CategoryDetailsState {
  final String message;

  CategoryDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
