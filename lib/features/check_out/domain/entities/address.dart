class Address {
  final int id;
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

  Address({
    required this.id,
    required this.shippingName,
    required this.fullName,
    required this.shippingPhone,
    required this.streetName,
    required this.buildingNumber,
    required this.houseNumber,
    required this.cityOrArea,
    required this.district,
    required this.governorate,
    required this.nearestLandmark,
  });
}
