import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../app/service_locator.dart';
import '../../../config/database/cache/cache_consumer.dart';
import '../../bloc/global_cubit/locale_cubit.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_enums.dart';
import '../../../../config/routes/app_routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  final List<IntroItem> introItems = const [
    IntroItem(
      image: AppImages.onBoardingBackground1,
      title: AppStrings.onboarding1,
      subtitle: AppStrings.onboardingSub1,
    ),
    IntroItem(
      image: AppImages.onBoardingBackground2,
      title: AppStrings.onboarding2,
      subtitle: AppStrings.onboardingSub2,
    ),
    IntroItem(
      image: AppImages.onBoardingBackground3,
      title: AppStrings.onboarding3,
      subtitle: AppStrings.onboardingSub3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                    elevation: 0.1,
                    type: MaterialType.circle,
                    color: Theme.of(context).cardColor,
                    child: GestureDetector(
                      onTap: () => (AppLocalizations.of(context)!.isEnLocale
                          ? context.read<LocaleCubit>().toArabic()
                          : context.read<LocaleCubit>().toEnglish()),
                      child: CircleAvatar(
                        radius: AppValues.radius * 15,
                        child: Text(
                          (AppLocalizations.of(context)!.isEnLocale
                                  ? AppStrings.arabicCode
                                  : AppStrings.englishCode)
                              .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white),
                        ),
                      ),
                    )),
                Material(
                  elevation: 0.1,
                  type: MaterialType.circle,
                  color: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: AppValues.radius * 20,
                    backgroundImage: const AssetImage(AppImages.appLogo),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 10,
            child: IntroductionScreen(
              bodyPadding: EdgeInsets.symmetric(
                  vertical: AppValues.paddingHeight * 12,
                  horizontal: AppValues.paddingWidth * 12),
              pages: introItems
                  .map((e) => PageViewModel(
                        titleWidget: Text(
                          e.title!.tr(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        image: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppValues.paddingWidth * 10),
                          child: Image.asset(
                            e.image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        decoration: const PageDecoration(
                            imageFlex: 2, fullScreen: false),
                        bodyWidget: Text(
                          e.subtitle!.tr(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ))
                  .toList(),
              showSkipButton: false,
              next: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppValues.radius * 5),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppValues.paddingHeight * 5,
                      horizontal: AppValues.paddingWidth * 15),
                  child: Text(
                    AppStrings.next.tr(context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              done: Card(
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppValues.radius * 10),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppValues.paddingHeight * 5,
                      horizontal: AppValues.paddingWidth * 10),
                  child: Text(
                    AppStrings.getStarted.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).cardColor),
                  ),
                ),
              ),
              dotsDecorator: const DotsDecorator(),
              onDone: () {
                sl<CacheConsumer>().saveData(
                    key: MySharedKeys.onBoarding.name,
                    value: MySharedKeys.onBoarding.name);
                context.navigateAndFinish(screenRoute: Routes.loginRoute);
              },
              nextStyle: TextButton.styleFrom(),
            ),
          ),
        ],
      )),
    );
  }
}

class IntroItem {
  final String? title;
  final String? subtitle;
  final String? image;

  const IntroItem({this.title, this.subtitle, this.image});
}

/**
 *  context.navigateAndFinish(
                                screenRoute: Routes.loginRoute);
 */
