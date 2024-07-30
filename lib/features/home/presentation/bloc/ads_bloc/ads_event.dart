part of 'ads_bloc.dart';

sealed class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class FetchAdsEvent extends AdsEvent {}
