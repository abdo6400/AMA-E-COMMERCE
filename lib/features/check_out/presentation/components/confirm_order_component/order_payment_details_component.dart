


import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class OrderPaymentDetailsComponent extends StatelessWidget {
  const OrderPaymentDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(  elevation: 0.1,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth*10,vertical: AppValues.paddingHeight*5),
        child: Column(
          children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.payment.tr(context),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(width: AppValues.sizeWidth * 10),
                   Icon(
                    Icons.money,color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ), const Divider(),
            Row(
                  children: [
                    Text(
                      AppStrings.subTotalAmount.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      '12.99',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.deliveryFees.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      '12.99',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.discountAmount.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      '12.99',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      AppStrings.totalAmount.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      '12.99',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}