import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 5,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 25),
          child: Divider(color: Theme.of(context).scaffoldBackgroundColor),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 5,
        ),
      ],
    );
  }
}
