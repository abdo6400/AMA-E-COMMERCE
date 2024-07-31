import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class ColorsComponent extends StatelessWidget {
  final List<String> colors;
  const ColorsComponent({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.colors.tr(context),
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        Wrap(
          spacing: AppValues.paddingWidth * 10,
          children: List<Widget>.generate(
            colors.length,
            (index) => Chip(
                color: WidgetStateColor.resolveWith((_) => index == 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).scaffoldBackgroundColor),
                label: Text(
                  colors[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
        ),
      ],
    );
  }
}
