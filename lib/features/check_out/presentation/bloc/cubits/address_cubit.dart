import 'package:bloc/bloc.dart';

class AddressCubit extends Cubit<String> {
  AddressCubit(super.addressId);

  void changeAddress(String addressId) {
    emit(addressId);
  }
}
