import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import '../../../app/service_locator.dart';
import '../../../config/database/cache/cache_consumer.dart';
import '../../../config/routes/app_routes.dart';
import '../../utils/app_enums.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';

class AuthenticationCheckerComponent extends StatelessWidget {
  final Widget child;
  const AuthenticationCheckerComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl<CacheConsumer>().getData(key: MySharedKeys.apiToken.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data != null) {
            return child;
          } else {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: AppValues.font * 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: AppValues.sizeHeight * 10),
                  Text(
                    AppStrings.pleaseSignToUseAllFeatures.tr(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: AppValues.sizeHeight * 20),
                  DefaultButton(
                      text: AppStrings.login,
                      onPressed: () =>
                          context.navigateTo(screenRoute: Routes.loginRoute)),
                  SizedBox(height: AppValues.sizeHeight * 10),
                  DefaultButton(
                      text: AppStrings.signUp,
                      background: Colors.transparent,
                      elevation: 0,
                      textColor: Theme.of(context).textTheme.titleSmall!.color!,
                      borderColor:
                          Theme.of(context).textTheme.titleSmall!.color!,
                      onPressed: () => context.navigateTo(
                          screenRoute: Routes.registerRoute)),
                ],
              ),
            );
          }
        });
  }
}
