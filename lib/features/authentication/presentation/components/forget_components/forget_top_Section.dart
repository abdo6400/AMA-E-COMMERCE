import 'package:flutter/material.dart';
import 'package:ama/config/locale/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class ForgetTopSection extends StatelessWidget {
  final String eamil;
  const ForgetTopSection({super.key, required this.eamil});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                elevation: 1,
                type: MaterialType.circle,
                color: Theme.of(context).cardColor,
                child: CircleAvatar(
                  radius: AppValues.radius * 40,
                  backgroundImage: const AssetImage(AppImages.appLogo),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 28,
          ),
          Text(
            AppStrings.forgetPassword.tr(context),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge!,
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
                .copyWith(color: AppColors.hintColor),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 12,
          ),
          Text(
            eamil,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.blueLight),
          ),
        ]);
  }
}
