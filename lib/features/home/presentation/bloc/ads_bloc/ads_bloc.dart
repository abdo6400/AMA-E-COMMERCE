import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../domain/entities/ad.dart';
import '../../../domain/usecases/get_ads_usecase.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final GetAdsUseCase _getAdsUseCase;

  AdsBloc(this._getAdsUseCase) : super(AdsInitial()) {
    on<FetchAdsEvent>(onFetchAdsEvent);
  }

  void onFetchAdsEvent(FetchAdsEvent event, Emitter<AdsState> emit) async {
    emit(AdsLoading());
    final result = await _getAdsUseCase(NoParams());
    result.fold(
      (failure) => emit(AdsError(message: failure.errorMessage)),
      (ads) => emit(AdsLoaded(ads: ads)),
    );
  }
}
