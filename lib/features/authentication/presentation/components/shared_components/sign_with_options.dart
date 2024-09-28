import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/default_components/default_sign_in_buttons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class SignWithOptions extends StatelessWidget {
  const SignWithOptions({super.key});

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
        SignInButton(
          buttonType: ButtonType.google,
          onPressed: () {
           
          },
        ),
        SizedBox(
          height: AppValues.sizeHeight * 8,
        ),
        // SignInButton(
        //   buttonType: ButtonType.guest,
        //   onPressed: () =>  context.navigateAndFinish(screenRoute: Routes.mainRoute),
        // )
      ],
    );
  }
}
