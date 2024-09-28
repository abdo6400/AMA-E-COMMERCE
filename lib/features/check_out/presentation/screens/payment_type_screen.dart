import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/payment_components/cash_card_component.dart';
import '../components/payment_components/payment_card_component.dart';

class PaymentTypeScreen extends StatelessWidget {
  const PaymentTypeScreen({super.key});

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
              children: [
                const Icon(Icons.payment),
                SizedBox(width: AppValues.sizeWidth * 10),
                Text(
                  AppStrings.paymentMethod.tr(context),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(height: AppValues.sizeHeight * 20),
            Text(
              AppStrings.paymentMethodSub.tr(context),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: AppValues.sizeHeight * 20),
            const CashCardComponent(),
            SizedBox(height: AppValues.sizeHeight * 20),
            const Divider(),
            const PaymentCardComponent(),
          ])),
    );
  }
}
