import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class CashCardComponent extends StatelessWidget {
  final bool isSelected;
  const CashCardComponent({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.orPaywithCash.tr(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Checkbox(value: isSelected, onChanged: (_) {}),
          ],
        ),
        SizedBox(height: AppValues.sizeHeight * 10),
        Image(
          image: const AssetImage(AppImages.onBoardingBackground1),
          height: AppValues.sizeHeight * 150,
        )
      ],
    );
  }
}
