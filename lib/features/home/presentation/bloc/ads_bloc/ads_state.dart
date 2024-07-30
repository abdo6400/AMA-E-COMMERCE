part of 'ads_bloc.dart';

sealed class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsLoaded extends AdsState {
  final List<Ad> ads;

  const AdsLoaded({required this.ads});

  @override
  List<Object> get props => [ads];
}

class AdsError extends AdsState {
  final String message;

  const AdsError({required this.message});

  @override
  List<Object> get props => [message];
}
