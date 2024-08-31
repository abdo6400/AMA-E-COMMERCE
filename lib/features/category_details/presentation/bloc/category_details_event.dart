part of 'category_details_bloc.dart';

abstract class CategoryDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategoryDetailsEvent extends CategoryDetailsEvent {
  final int id;

  GetCategoryDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
