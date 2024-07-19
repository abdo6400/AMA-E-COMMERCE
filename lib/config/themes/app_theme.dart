import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import 'widgets_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData getApplicationLightTheme() {
    return FlexThemeData.light(
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        scheme: FlexScheme.orangeM3,
        primary: AppColors.primary,
        fontFamily: 'Cairo',
        appBarStyle: FlexAppBarStyle.surface,
        textTheme: AppTextTheme.lightTextTheme);
  }

  static ThemeData getApplicationDarkTheme() {
    return FlexThemeData.dark(
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        scheme: FlexScheme.orangeM3,
        primary: AppColors.primary,
        fontFamily: 'Cairo',
        appBarStyle: FlexAppBarStyle.surface,
        textTheme: AppTextTheme.darkTextTheme);
  }
}
