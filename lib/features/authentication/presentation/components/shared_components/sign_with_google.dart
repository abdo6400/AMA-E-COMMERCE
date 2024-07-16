import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Divider(
                color: AppColors.lightGrey,
                thickness: 1.0,
              ),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 12,
            ),
            Text(
              AppStrings.or.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.lightGrey),
            ),
            SizedBox(
              width: AppValues.sizeWidth * 12,
            ),
            const Expanded(
              flex: 1,
              child: Divider(
                color: AppColors.lightGrey,
                thickness: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppValues.sizeHeight * 8,
        ),
        GestureDetector(
          child: Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              AppValues.radius * 28,
            )),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 15,
                    vertical: AppValues.paddingHeight * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Image.asset(
                        AppImages.googleLogo,
                        height: AppValues.sizeHeight * 30,
                        width: AppValues.sizeWidth * 30,
                      ),
                    ),
                    SizedBox(
                      width: AppValues.sizeWidth * 10,
                    ),
                    Text(
                      AppStrings.continueWithGoogle.tr(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: AppValues.font * 12),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
