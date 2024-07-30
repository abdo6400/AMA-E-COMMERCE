part of 'offers_bloc.dart';

sealed class OffersEvent extends Equatable {
  const OffersEvent();

  @override
  List<Object> get props => [];
}

class FetchOffersEvent extends OffersEvent {}
