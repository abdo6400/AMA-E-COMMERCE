import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/address_components/add_address_component.dart';
import '../components/address_components/saved_addresses_component.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 15,
          vertical: AppValues.paddingHeight * 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppValues.sizeHeight * 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.orderPlaced.tr(context),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                DefaultButton(
                    elevation: 0,
                    background: Colors.transparent,
                    borderColor: Theme.of(context).hintColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 2,
                    ),
                    textColor: Theme.of(context).textTheme.bodyLarge!.color!,
                    width: AppValues.screenWidth / 2,
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                          context: context,
                          builder: (context) => const AddAddressComponent());
                    },
                    fontSize: 12,
                    text: AppStrings.addNewAddress),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 20),
            const SavedAddressesComponent(),
          ]),
    );
  }
}
