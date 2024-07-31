import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class SizesComponent extends StatelessWidget {
  final List<String> sizes;
  const SizesComponent({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.sizes.tr(context),
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        Wrap(
          spacing: AppValues.paddingWidth * 10,
          children: List<Widget>.generate(
            sizes.length,
            (index) => Chip(
                color: WidgetStateColor.resolveWith((_) => index == 0
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).scaffoldBackgroundColor),
                label: Text(
                  sizes[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
        )
      ],
    );
  }
}
