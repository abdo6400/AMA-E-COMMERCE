import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AddressCardComponent extends StatelessWidget {
  final String shippingNameController;
  final String fullNameController;
  final String phoneController;
  final String streetNameController;
  final String buildingNumberController;
  final String houseNumberController;
  final String cityORAreaController;
  final String districtController;
  final String governorateController;
  final String neatestLandmarkController;

  const AddressCardComponent({
    super.key,
    required this.shippingNameController,
    required this.fullNameController,
    required this.phoneController,
    required this.streetNameController,
    required this.buildingNumberController,
    required this.houseNumberController,
    required this.cityORAreaController,
    required this.districtController,
    required this.governorateController,
    required this.neatestLandmarkController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Theme.of(context).hintColor.withOpacity(0.1))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 15,
                vertical: AppValues.paddingHeight * 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.shippingAddress.tr(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: const Icon(Icons.edit,
                                  color: AppColors.greenDark)),
                          SizedBox(
                            width: AppValues.sizeWidth * 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.delete,
                                color: AppColors.error),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text:
                                '${AppStrings.shippingName.tr(context)}: $shippingNameController, '),
                        TextSpan(
                            text:
                                '${AppStrings.fullName.tr(context)}: $fullNameController, '),
                        TextSpan(
                            text:
                                '${AppStrings.shippingPhone.tr(context)}: $phoneController, '),
                        TextSpan(
                            text:
                                '${AppStrings.streetName.tr(context)}: $streetNameController, '),
                        TextSpan(
                            text:
                                '${AppStrings.buildingNumber.tr(context)}: $buildingNumberController, '),
                        TextSpan(
                            text:
                                '${AppStrings.houseNumber.tr(context)}: $houseNumberController, '),
                        TextSpan(
                            text:
                                '${AppStrings.cityORArea.tr(context)}: $cityORAreaController, '),
                        TextSpan(
                            text:
                                '${AppStrings.district.tr(context)}: $districtController, '),
                        TextSpan(
                            text:
                                '${AppStrings.governorate.tr(context)}: $governorateController, '),
                        TextSpan(
                            text:
                                '${AppStrings.nearestLandmark.tr(context)}: $neatestLandmarkController, '),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Checkbox(value: true, onChanged: (_) {}),
      ],
    );
  }
}
