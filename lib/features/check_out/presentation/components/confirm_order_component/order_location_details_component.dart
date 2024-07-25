import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class OrderLocationDetailsComponent extends StatelessWidget {
  const OrderLocationDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 10,
            vertical: AppValues.paddingHeight * 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.location.tr(context),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(width: AppValues.sizeWidth * 10),
                Icon(
                  Icons.location_pin,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            const Divider(),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleMedium,
                children: const [
                  TextSpan(text: 'Order Location Details: '),
                  TextSpan(text: 'Shipping Name: John Doe, '),
                  TextSpan(text: 'Full Name: Johnathan Doe, '),
                  TextSpan(text: 'Phone: +1 234 567 890, '),
                  TextSpan(text: 'Street: Elm Street, '),
                  TextSpan(text: 'Building Number: 123, '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
