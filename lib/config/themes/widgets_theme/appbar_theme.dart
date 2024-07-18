import 'package:ama/config/themes/widgets_theme/text_theme.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AAppBarTheme {
  static AppBarTheme appBarLightTheme = AppBarTheme(
    // color: AppColors.white, // white
    iconTheme: IconThemeData(
      color: AppColors.white,
      size: AppValues.font*25
    ),
    backgroundColor: AppColors.primary.withOpacity(0.8),
    elevation: 0,
    titleTextStyle: AppTextTheme.lightTextTheme.labelLarge!.copyWith(
      color: AppColors.white,
    ),
  );

  static AppBarTheme appBarDarkTheme = const AppBarTheme(
    color: AppColors.black,
    iconTheme: IconThemeData(color: AppColors.white),
    elevation: 1,
  );
}
