import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coupon_bloc_event.dart';
part 'coupon_bloc_state.dart';

class CouponBlocBloc extends Bloc<CouponBlocEvent, CouponBlocState> {
  CouponBlocBloc() : super(CouponBlocInitial()) {
    on<CouponBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
