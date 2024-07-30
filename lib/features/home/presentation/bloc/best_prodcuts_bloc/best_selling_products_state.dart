part of 'best_selling_products_bloc.dart';

sealed class BestSellingProductsState extends Equatable {
  const BestSellingProductsState();

  @override
  List<Object> get props => [];
}

class BestSellingProductsInitial extends BestSellingProductsState {}

class BestSellingProductsLoading extends BestSellingProductsState {}

class BestSellingProductsLoaded extends BestSellingProductsState {
  final List<BestSellingProduct> products;

  const BestSellingProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class BestSellingProductsError extends BestSellingProductsState {
  final String message;

  const BestSellingProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
