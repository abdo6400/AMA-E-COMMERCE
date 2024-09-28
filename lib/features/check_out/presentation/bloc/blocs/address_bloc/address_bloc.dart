import 'package:ama/features/check_out/domain/usecases/add_address_usecase.dart';
import 'package:ama/features/check_out/domain/usecases/get_addresses_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/bloc/usecases/usecase.dart';
import '../../../../domain/entities/address.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAddressesUseCase _addressesUseCase;
  final AddAddressUsecase _addAddressUsecase;
  AddressBloc(this._addressesUseCase, this._addAddressUsecase)
      : super(const AddressState()) {
    on<GetAddressEvent>(_onGetAddressEvent);
    on<AddAddressEvent>(_onAddAddressEvent);
    // on<UpdateAddressEvent>(_onUpdateAddressEvent);
    // on<DeleteAddressEvent>(_onDeleteAddressEvent);
  }

  Future<void> _onAddAddressEvent(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(isLoading: true, isAdded: true));
    final result = await _addAddressUsecase(event.addressParams);
    result.fold(
      (failure) => emit(state.copyWith(
          message: failure.errorMessage,
          hasError: true,
          isAdded: true,
          hasData: true)),
      (address) => emit(
        state.addAddress(address),
      ),
    );
  }

  // Future<void> _onDeleteAddressEvent(
  //     RemoveProductFromCartEvent event, Emitter<AddressState> emit) async {
  //   final result = await _removeProductFromCartUseCase(event.id);
  //   result.fold(
  //     (failure) =>
  //         emit(AddressState(message: failure.errorMessage, hasError: true)),
  //     (product) => emit(state.removeProduct(product)),
  //   );
  // }

  // Future<void> _onUpdateAddressEvent(
  //     UpdateCartQuantityEvent event, Emitter<AddressState> emit) async {
  //   final result = await _updateCartQuantityUseCase(UpdateCartQuantityParams(
  //     id: event.id,
  //     quantity: event.quantity,
  //   ));
  //   result.fold(
  //     (failure) =>
  //         emit(AddressState(message: failure.errorMessage, hasError: true)),
  //     (product) => emit(state.updateProduct(product, event.quantity)),
  //   );
  // }

  Future<void> _onGetAddressEvent(
      GetAddressEvent event, Emitter<AddressState> emit) async {
    emit(const AddressState(isLoading: true));
    final result = await _addressesUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(AddressState(message: failure.errorMessage, hasError: true)),
      (addresses) => emit(
          AddressState(addresses: addresses, hasData: true, isLoading: false)),
    );
  }
}
