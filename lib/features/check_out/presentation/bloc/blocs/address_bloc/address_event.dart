part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetAddressEvent extends AddressEvent {
  const GetAddressEvent();
}

class AddAddressEvent extends AddressEvent {
  final AddressParams addressParams;
  const AddAddressEvent(this.addressParams);
}

class DeleteAddressEvent extends AddressEvent {
  final int addressId;
  const DeleteAddressEvent(this.addressId);
}

class UpdateAddressEvent extends AddressEvent {
  const UpdateAddressEvent();
}
