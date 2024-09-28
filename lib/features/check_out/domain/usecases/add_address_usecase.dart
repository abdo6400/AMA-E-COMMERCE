import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class AddAddressUsecase implements UseCase<Address, AddressParams> {
  final AddressRepository repository;

  AddAddressUsecase(this.repository);

  @override
  Future<Either<Failure, Address>> call(AddressParams params) async {
    return await repository.createAddress(params.toJson());
  }
}

class AddressParams {
  final String shippingName;
  final String fullName;
  final String shippingPhone;
  final String streetName;
  final String buildingNumber;
  final String houseNumber;
  final String cityOrArea;
  final String district;
  final String governorate;
  final String nearestLandmark;

  AddressParams(
      {required this.shippingName,
      required this.fullName,
      required this.shippingPhone,
      required this.streetName,
      required this.buildingNumber,
      required this.houseNumber,
      required this.cityOrArea,
      required this.district,
      required this.governorate,
      required this.nearestLandmark});

  Map<String, dynamic> toJson() => {
        "shippingName": shippingName,
        "fullName": fullName,
        "shippingPhone": shippingPhone,
        "streetName": streetName,
        "buildingNumber": buildingNumber,
        "houseNumber": houseNumber,
        "cityOrArea": cityOrArea,
        "district": district,
        "governorate": governorate,
        "nearestLandmark": nearestLandmark
      };
}
