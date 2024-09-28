import 'package:flutter/material.dart';
import '../../../../../config/locale/app_localizations.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class OtpTopSection extends StatelessWidget {
  final String email;
  const OtpTopSection({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.enterTheCode.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!),
        SizedBox(
          height: AppValues.sizeHeight * 12,
        ),
        Container(
          width: AppValues.sizeWidth * 80,
          height: AppValues.sizeHeight * 4,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 28,
        ),
        Text(
          AppStrings.emailCodeMessage.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).hintColor,),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 15,
        ),
        Text(
          email,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(),
        ),
      ],
    );
  }
}
