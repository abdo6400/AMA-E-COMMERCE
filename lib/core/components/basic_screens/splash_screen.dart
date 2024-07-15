import 'dart:async';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';

import '../../../../app/service_locator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_images.dart';
import '../../../config/database/cache/cache_consumer.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goNext() async {
    (await sl<CacheConsumer>().getData(key: MySharedKeys.apiToken.name) != null)
        ? context.navigateAndFinish(screenRoute: Routes.mainRoute)
        : (await sl<CacheConsumer>()
                    .getData(key: MySharedKeys.onBoarding.name) !=
                null)
            ? context.navigateAndFinish(screenRoute: Routes.loginRoute)
            : context.navigateAndFinish(screenRoute: Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Material(
                elevation: 1,
                type: MaterialType.circle,
                color: Theme.of(context).cardColor,
                child: CircleAvatar(
                  radius: AppValues.radius * 50,
                  backgroundImage: const AssetImage(AppImages.appLogo),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: AppValues.sizeHeight * 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.appName.tr(context).toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                    Icon(Icons.shopify,
                        color: Theme.of(context).colorScheme.secondary,
                        size: AppValues.font * 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
