import 'package:app_finanzas/design/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'RobotoMono',
    primaryColor: AppColors.brandPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: AppColors.brandLightColor,
      ),
      displayMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.brandLightColor,
      ),
      displaySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: AppColors.brandLightColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 21.0,
        color: AppColors.brandPrimaryColor,
      ),
      labelLarge: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: AppColors.brandPrimaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: AppColors.brandLightDarkColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: AppColors.brandDarkColor,
      ),
      bodyLarge: TextStyle(fontSize: 14.0),
      bodyMedium: TextStyle(fontSize: 13.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
  );
}
