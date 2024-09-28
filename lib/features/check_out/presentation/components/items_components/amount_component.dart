import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class AmountComponent extends StatelessWidget {
  final double subTotalAmount;
  const AmountComponent({super.key, required this.subTotalAmount});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 15,
            vertical: AppValues.paddingHeight * 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppStrings.subTotalAmount.tr(context)} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "$subTotalAmount EGP",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppStrings.deliveryFees.tr(context)} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "500 EGP",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppStrings.discountAmount.tr(context)} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "0 EGP",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${AppStrings.totalAmount.tr(context)} :",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${subTotalAmount + 500} EGP",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 3),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: DefaultTextFormField(
                      prefix: Icons.discount_outlined,
                      hint: AppStrings.coupon,
                      controller: null,
                      type: TextInputType.text),
                ),
                SizedBox(
                  width: AppValues.sizeWidth * 20,
                ),
                Expanded(
                    flex: 1,
                    child: DefaultButton(
                        elevation: 0.2,
                        onPressed: () {},
                        text: AppStrings.apply)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
