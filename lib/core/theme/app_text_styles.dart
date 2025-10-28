import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font18whiteSemiBold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );

  static TextStyle font32whiteBold = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle font16greyRegular = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.grey,
  );

  static TextStyle font18blackBold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle font24blackBold = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle font16blackMedium = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.medium,
    color: AppColors.black,
  );

  static TextStyle font28blackBold = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );
}
