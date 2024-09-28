part of 'coupon_bloc_bloc.dart';

sealed class CouponBlocState extends Equatable {
  const CouponBlocState();
  
  @override
  List<Object> get props => [];
}

final class CouponBlocInitial extends CouponBlocState {}
