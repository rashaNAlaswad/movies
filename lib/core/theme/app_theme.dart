import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.tealPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.tealPrimary,
        surface: AppColors.white,
        onSurface: AppColors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.tealPrimary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.tealPrimary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.tealPrimary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkText,
        elevation: 2,
      ),
      useMaterial3: true,
    );
  }
}

ThemeData appTheme() {
  return AppTheme.lightTheme;
}
