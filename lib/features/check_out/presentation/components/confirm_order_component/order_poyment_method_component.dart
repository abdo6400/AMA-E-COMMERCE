import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class OrderPoymentMethodComponent extends StatelessWidget {
  const OrderPoymentMethodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Container(
        width: AppValues.screenWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 10,
            vertical: AppValues.paddingHeight * 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.paymentMethod.tr(context),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(width: AppValues.sizeWidth * 10),
                Icon(
                  Icons.credit_card,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            const Divider(),
            Text(
              AppStrings.orPaywithCard.tr(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
