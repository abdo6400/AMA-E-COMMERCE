import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class AddAddressComponent extends StatelessWidget {
  const AddAddressComponent({super.key});
  static final TextEditingController shippingNameController =
      TextEditingController();
  static final TextEditingController fullNameController =
      TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController streetNameController =
      TextEditingController();
  static final TextEditingController buildingNumberController =
      TextEditingController();
  static final TextEditingController houseNumberController =
      TextEditingController();
  static final TextEditingController cityORAreaController =
      TextEditingController();
  static final TextEditingController districtController =
      TextEditingController();
  static final TextEditingController governorateController =
      TextEditingController();
  static final TextEditingController neatestLandmarkController =
      TextEditingController();
  static final Map<String, dynamic> controllers = {
    AppStrings.shippingName: {
      'controller': shippingNameController,
      "icon": Icons.title_outlined
    },
    AppStrings.fullName: {
      'controller': fullNameController,
      "icon": Icons.person_outline
    },
    AppStrings.shippingPhone: {
      'controller': phoneController,
      "icon": Icons.phone
    },
    AppStrings.streetName: {
      'controller': streetNameController,
      "icon": Icons.location_on_outlined
    },
    AppStrings.buildingNumber: {
      'controller': buildingNumberController,
      "icon": Icons.house
    },
    AppStrings.houseNumber: {
      'controller': houseNumberController,
      "icon": Icons.maps_home_work_rounded
    },
    AppStrings.cityORArea: {
      'controller': cityORAreaController,
      "icon": Icons.location_city
    },
    AppStrings.district: {
      'controller': districtController,
      "icon": Icons.place
    },
    AppStrings.governorate: {
      'controller': governorateController,
      "icon": Icons.local_attraction
    },
    AppStrings.nearestLandmark: {
      'controller': neatestLandmarkController,
      "icon": Icons.landscape
    },
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            AppStrings.addNewAddress.tr(context),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 20,
                vertical: AppValues.paddingHeight * 20),
            child: Row(
              children: [
                Flexible(
                  child: DefaultButton(
                    background: Colors.transparent,
                    borderColor: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).textTheme.titleMedium!.color!,
                    elevation: 0,
                    onPressed: () {},
                    text: AppStrings.add,
                  ),
                ),
                SizedBox(
                  width: AppValues.paddingWidth * 10,
                ),
                Flexible(
                  flex: 1,
                  child: DefaultButton(
                    onPressed: () => Navigator.pop(context),
                    text: AppStrings.cancel,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppValues.paddingHeight * 15,
              horizontal: AppValues.paddingWidth * 10),
          child: Column(
            children: [
              const Divider(),
              Expanded(
                child: ListView.separated(
                    padding:
                        EdgeInsets.only(bottom: AppValues.paddingHeight * 10),
                    separatorBuilder: (context, index) => SizedBox(
                          height: AppValues.sizeHeight * 8,
                        ),
                    itemCount: controllers.length,
                    itemBuilder: (context, index) {
                      return DefaultTextFormField(
                          suffix: controllers.values.elementAt(index)['icon'],
                          label: controllers.keys.elementAt(index),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppValues.paddingWidth * 20),
                          controller:
                              controllers.values.elementAt(index)['controller'],
                          type: TextInputType.emailAddress);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
