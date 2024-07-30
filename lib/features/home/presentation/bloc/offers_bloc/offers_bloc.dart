import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/bloc/usecases/usecase.dart';
import '../../../domain/entities/offer.dart';
import '../../../domain/usecases/get_offers_usecase.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final GetOffersUseCase _getOffersUseCase;

  OffersBloc(this._getOffersUseCase) : super(OffersInitial()) {
    on<FetchOffersEvent>(onFetchOffersEvent);
  }

  void onFetchOffersEvent(FetchOffersEvent event, Emitter<OffersState> emit) async {
    emit(OffersLoading());
    final result = await _getOffersUseCase(NoParams());
    result.fold(
      (failure) => emit(OffersError(message: failure.errorMessage)),
      (offers) => emit(OffersLoaded(offers: offers)),
    );
  }
}
