part of 'address_bloc.dart';

class AddressState extends Equatable {
  final List<Address> addresses;
  final bool hasData;
  final bool isAdded;
  final bool isDeleted;
  final bool isUpdated;
  final bool isLoading;
  final bool hasError;
  final String message;
  const AddressState(
      {this.addresses = const [],
      this.isLoading = false,
      this.hasData = false,
      this.isAdded = false,
      this.isDeleted = false,
      this.isUpdated = false,
      this.hasError = false,
      this.message = ""});

  @override
  List<Object> get props => [
        addresses,
        isLoading,
        hasData,
        isAdded,
        isDeleted,
        isUpdated,
        message,
        hasError
      ];

  AddressState copyWith({
    List<Address>? addresses,
    bool? isLoading,
    bool? hasData,
    bool? isAdded,
    bool? isDeleted,
    bool? isUpdated,
    String? message,
    bool? hasError,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      isLoading: isLoading ?? false,
      hasData: hasData ?? false,
      isAdded: isAdded ?? false,
      isDeleted: isDeleted ?? false,
      isUpdated: isUpdated ?? false,
      message: message ?? "",
      hasError: hasError ?? false,
    );
  }

  AddressState addAddress(Address newAddress) {
    List<Address> updatedaddresses = List.from(addresses);
    int addressIndex =
        updatedaddresses.indexWhere((p) => p.id == newAddress.id);
    if (addressIndex != -1) {
      updatedaddresses[addressIndex] = newAddress;
    } else {
      updatedaddresses.add(newAddress);
    }
    return copyWith(
      addresses: updatedaddresses,
      isAdded: true,
      hasData: true,
    );
  }

  AddressState removeAddress(Address updatedAddress) {
    return copyWith(
      addresses: addresses.where((p) => p.id != updatedAddress.id).toList(),
      isDeleted: true,
      hasData: true,
    );
  }

  AddressState updateAddress(Address updatedAddress, int quantity) {
    return copyWith(
      addresses: quantity < 1
          ? addresses.where((p) => p.id != updatedAddress.id).toList()
          : addresses
              .map((p) => p.id == updatedAddress.id ? updatedAddress : p)
              .toList(),
      isUpdated: true,
      hasData: true,
    );
  }
}
