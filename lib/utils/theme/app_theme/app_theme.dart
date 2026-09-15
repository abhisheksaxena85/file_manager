import 'package:filemanager/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Full Application's default theme
  static ThemeData defaultAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bgColor,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) {
          return Icon(Icons.arrow_back_ios);
        },
        closeButtonIconBuilder: (context) {
          return Icon(Icons.close);
        },
      ),
      useMaterial3: true,
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        alignment: Alignment.center,
        titleTextStyle: GoogleFonts.googleSans(
          color: AppColors.bgColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 0.h,
      ),
    );
  }
}
