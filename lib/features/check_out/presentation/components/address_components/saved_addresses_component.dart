import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import 'address_card_component.dart';

class SavedAddressesComponent extends StatelessWidget {
  const SavedAddressesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
          separatorBuilder: (context, index) => SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
          itemCount: fakeDataList.length,
          itemBuilder: (context, index) {
            return AddressCardComponent(
              shippingNameController: fakeDataList[index]
                  ['shippingNameController']!,
              fullNameController: fakeDataList[index]['fullNameController']!,
              phoneController: fakeDataList[index]['phoneController']!,
              streetNameController: fakeDataList[index]
                  ['streetNameController']!,
              buildingNumberController: fakeDataList[index]
                  ['buildingNumberController']!,
              houseNumberController: fakeDataList[index]
                  ['houseNumberController']!,
              cityORAreaController: fakeDataList[index]
                  ['cityORAreaController']!,
              districtController: fakeDataList[index]['districtController']!,
              governorateController: fakeDataList[index]
                  ['governorateController']!,
              neatestLandmarkController: fakeDataList[index]
                  ['neatestLandmarkController']!,
            );
          }),
    );
  }
}

List<Map<String, String>> fakeDataList = [
  {
    'shippingNameController': 'John Doe',
    'fullNameController': 'Jonathan Doe',
    'phoneController': '555-1234',
    'streetNameController': 'Elm Street',
    'buildingNumberController': '42',
    'houseNumberController': '101',
    'cityORAreaController': 'Springfield',
    'districtController': 'Westside',
    'governorateController': 'Midwest',
    'neatestLandmarkController': 'Central Park',
  },
];
