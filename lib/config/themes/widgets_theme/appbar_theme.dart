import 'package:ama/config/themes/widgets_theme/text_theme.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AAppBarTheme {
  static AppBarTheme appBarLightTheme = AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.black, size: AppValues.font * 25),
    backgroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: AppTextTheme.lightTextTheme.labelLarge!.copyWith(
      color: AppColors.black,
    ),
  );

  static AppBarTheme appBarDarkTheme = AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.white, size: AppValues.font * 25),
    backgroundColor: AppColors.black,
    elevation: 0,
    titleTextStyle: AppTextTheme.lightTextTheme.labelLarge!.copyWith(
      color: AppColors.white,
    ),
  );
}
