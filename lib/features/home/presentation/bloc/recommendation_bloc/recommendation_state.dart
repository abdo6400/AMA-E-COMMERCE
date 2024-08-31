part of 'recommendation_bloc.dart';


sealed class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<BestSellingAndRecommendedProduct> products;

  const RecommendationLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class RecommendationError extends RecommendationState {
  final String message;

  const RecommendationError({required this.message});

  @override
  List<Object> get props => [message];
}
