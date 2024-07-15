import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_values.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: AppValues.font * 20,
        fontWeight: FontWeight.normal,
        color: AppColors.black),
    displayMedium: TextStyle(
        fontSize: AppValues.font * 18,
        fontWeight: FontWeight.normal,
        color: AppColors.black),
    displaySmall: TextStyle(
        fontSize: AppValues.font * 16,
        fontWeight: FontWeight.normal,
        color: AppColors.black),
    headlineLarge: TextStyle(
        fontSize: AppValues.font * 24,
        fontWeight: FontWeight.bold,
        color: AppColors.black),
    headlineMedium: TextStyle(
        fontSize: AppValues.font * 22,
        fontWeight: FontWeight.bold,
        color: AppColors.black),
    headlineSmall: TextStyle(
        fontSize: AppValues.font * 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black),
    titleLarge: TextStyle(
        fontSize: AppValues.font * 21,
        fontWeight: FontWeight.w500,
        color: AppColors.black),
    titleMedium: TextStyle(
        fontSize: AppValues.font * 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black),
    titleSmall:
        TextStyle(fontSize: AppValues.font * 16, color: AppColors.black),
    bodyLarge: TextStyle(fontSize: AppValues.font * 14, color: AppColors.black),
    bodyMedium:
        TextStyle(fontSize: AppValues.font * 14, color: AppColors.darkGrey),
    bodySmall: TextStyle(fontSize: AppValues.font * 12, color: Colors.grey),
    labelLarge: TextStyle(
        fontSize: AppValues.font * 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black),
    labelMedium: TextStyle(fontSize: AppValues.font * 12, color: Colors.grey),
    labelSmall: TextStyle(
        fontSize: AppValues.font * 10, color: Colors.grey), // Buttons, Tabs
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: AppValues.font * 20,
        fontWeight: FontWeight.normal,
        color: AppColors.white),
    displayMedium: TextStyle(
        fontSize: AppValues.font * 18,
        fontWeight: FontWeight.normal,
        color: AppColors.white),
    displaySmall: TextStyle(
        fontSize: AppValues.font * 16,
        fontWeight: FontWeight.normal,
        color: AppColors.white),
    headlineLarge: TextStyle(
        fontSize: AppValues.font * 24,
        fontWeight: FontWeight.bold,
        color: AppColors.white),
    headlineMedium: TextStyle(
        fontSize: AppValues.font * 22,
        fontWeight: FontWeight.bold,
        color: AppColors.white),
    headlineSmall: TextStyle(
        fontSize: AppValues.font * 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white),
    titleLarge: TextStyle(
        fontSize: AppValues.font * 21,
        fontWeight: FontWeight.w500,
        color: AppColors.white),
    titleMedium: TextStyle(
        fontSize: AppValues.font * 14,
        fontWeight: FontWeight.w500,
        color: AppColors.white),
    titleSmall:
        TextStyle(fontSize: AppValues.font * 16, color: AppColors.white),
    bodyLarge: TextStyle(fontSize: AppValues.font * 14, color: AppColors.white),
    bodyMedium:
        TextStyle(fontSize: AppValues.font * 14, color: AppColors.lightGrey),
    bodySmall: TextStyle(fontSize: AppValues.font * 12, color: Colors.grey),
    labelLarge: TextStyle(
        fontSize: AppValues.font * 14,
        fontWeight: FontWeight.w500,
        color: AppColors.white),
    labelMedium: TextStyle(fontSize: AppValues.font * 12, color: Colors.grey),
    labelSmall: TextStyle(fontSize: AppValues.font * 10, color: Colors.grey),
  );
}
