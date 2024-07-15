import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import 'widgets_theme/elevated_button_theme.dart';
import 'widgets_theme/tab_bar_theme.dart';
import 'widgets_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData getApplicationLightTheme() {
    return ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        fontFamily: 'Cairo',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.nearlyWhite,
          error: AppColors.error,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          onSurface: AppColors.black,
          onError: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.nearlyWhite,
        hintColor: AppColors.hintColor,
        textTheme: AppTextTheme.lightTextTheme,
        tabBarTheme: AppTapBarTheme.tabBarLightTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonLightTheme);
  }

  static ThemeData getApplicationDarkTheme() {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.nearlyBlack,
          error: AppColors.error,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.white,
          onError: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.nearlyBlack,
        hintColor: AppColors.hintColor,
        textTheme: AppTextTheme.darkTextTheme,
        tabBarTheme: AppTapBarTheme.tabBarDarkTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonDarkTheme);
  }
}
