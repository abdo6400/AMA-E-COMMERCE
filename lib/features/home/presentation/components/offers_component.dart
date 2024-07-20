import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class OffersComponent extends StatelessWidget {
  const OffersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth*10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.bestOffers.tr(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  AppStrings.viewAll.tr(context),
                  style: Theme.of(context).textTheme.titleMedium,
                  selectionColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 15,
        ),
        EcommerceElement.slider(),
      ],
    );
  }
}
