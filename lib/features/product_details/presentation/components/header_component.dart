import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/app_components/ecommerce_components.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final double rating;
  const HeaderComponent(
      {super.key,
      required this.title,
      required this.price,
      required this.rating,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(),
            EcommerceComponents.increaseDecreaseQuantity()
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 15,
        ),
        Row(children: [
          EcommerceComponents.rating(
            value: rating,
            stepInt: false,
          ),
          SizedBox(
            width: AppValues.sizeWidth * 5,
          ),
          Card(
            elevation: 0.1,
            child: Padding(
              padding: EdgeInsets.all(AppValues.radius * 2),
              child: Text(
                "$rating  ${AppStrings.stars.tr(context)}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "$price EGP",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        Text(AppStrings.description.tr(context),
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: AppValues.sizeHeight * 5,
        ),
        Text(
          description,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
