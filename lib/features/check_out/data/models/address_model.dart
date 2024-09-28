import '../../domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.id,
    required super.shippingName,
    required super.fullName,
    required super.shippingPhone,
    required super.streetName,
    required super.buildingNumber,
    required super.houseNumber,
    required super.cityOrArea,
    required super.district,
    required super.governorate,
    required super.nearestLandmark,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        shippingName: json["shippingName"],
        fullName: json["fullName"],
        shippingPhone: json["shippingPhone"],
        streetName: json["streetName"],
        buildingNumber: json["buildingNumber"],
        houseNumber: json["houseNumber"],
        cityOrArea: json["cityOrArea"],
        district: json["district"],
        governorate: json["governorate"],
        nearestLandmark: json["nearestLandmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shippingName": shippingName,
        "fullName": fullName,
        "shippingPhone": shippingPhone,
        "streetName": streetName,
        "buildingNumber": buildingNumber,
        "houseNumber": houseNumber,
        "cityOrArea": cityOrArea,
        "district": district,
        "governorate": governorate,
        "nearestLandmark": nearestLandmark,
      };
}
