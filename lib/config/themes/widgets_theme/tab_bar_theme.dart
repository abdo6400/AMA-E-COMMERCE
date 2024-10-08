
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_values.dart';

class AppTapBarTheme {
  static TabBarTheme tabBarLightTheme = TabBarTheme(
    labelColor: AppColors.black,
    unselectedLabelColor: AppColors.grey,
    labelPadding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 5),
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.primary,
          width: 2.0,
        ),
      ),
    ),
  );

  static TabBarTheme tabBarDarkTheme = TabBarTheme(
    labelColor: AppColors.white,
    unselectedLabelColor: AppColors.grey,
    labelPadding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 5),
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.primary,
          width: 2.0,
        ),
      ),
    ),
  );
}
