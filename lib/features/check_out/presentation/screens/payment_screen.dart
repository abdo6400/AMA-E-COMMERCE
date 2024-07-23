import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_images.dart';
import 'package:ama/features/check_out/presentation/components/payment_components/payment_card_component.dart';
import 'package:ama/features/check_out/presentation/components/payment_components/saved_cards_component.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 15,
          vertical: AppValues.paddingHeight * 5),
      child: SingleChildScrollView(
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
                    AppStrings.paymentMethod.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // DefaultButton(
                  //     elevation: 0,
                  //     background: Colors.transparent,
                  //     borderColor: Theme.of(context).hintColor,
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: AppValues.paddingWidth * 2,
                  //     ),
                  //     textColor: Theme.of(context).textTheme.bodyLarge!.color!,
                  //     width: AppValues.screenWidth / 3,
                  //     onPressed: () {
                  //       // showModalBottomSheet(
                  //       //   useSafeArea: true,
                  //       //   isScrollControlled: true,
                  //       //     context: context,
                  //       //     builder: (context) => const AddAddressComponent());
                  //     },
                  //     fontSize: 12,
                  //     text: AppStrings.addNewCard),
                ],
              ),
              SizedBox(height: AppValues.sizeHeight * 20),
              Text(
                AppStrings.paymentMethodSub.tr(context),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: AppValues.sizeHeight * 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.orPaywithCard.tr(context),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Checkbox(value: true, onChanged: (_) {}),
                    ],
                  ),
                  SizedBox(height: AppValues.sizeHeight * 10),
                  const PaymentCardComponent()
                ],
              ),
              SizedBox(height: AppValues.sizeHeight * 20),
              const Divider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.orPaywithCash.tr(context),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Checkbox(value: false, onChanged: (_) {}),
                    ],
                  ),
                  SizedBox(height: AppValues.sizeHeight * 10),
                  Image(
                    image: const AssetImage(AppImages.onBoardingBackground1),
                    height: AppValues.sizeHeight * 150,
                  )
                ],
              )
            ]),
      ),
    );
  }
}
