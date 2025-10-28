import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.tealPrimary,
    colorScheme: const ColorScheme.light(primary: AppColors.tealPrimary),
  );
}
