import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/blocs/address_bloc/address_bloc.dart';
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
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    SizedBox(width: AppValues.sizeWidth * 10),
                    Text(
                      AppStrings.orderPlaced.tr(context),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                DefaultButton(
                    elevation: 0,
                    background: Colors.transparent,
                    borderColor: Theme.of(context).hintColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 2,
                    ),
                    textColor: Theme.of(context).textTheme.bodyLarge!.color!,
                    width: AppValues.screenWidth / 2.5,
                    onPressed: () {
                      showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (ctx) => AddAddressComponent(
                              addressBloc: context.read<AddressBloc>()));
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
