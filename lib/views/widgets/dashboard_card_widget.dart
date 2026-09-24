import 'dart:ui';

import 'package:filemanager/utils/constant/app_colors.dart';
import 'package:filemanager/utils/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget dashBoardCardWidget(
  String svgIcon,
  String title, {
  required bool isFileSize,
  String? size,
}) {
  return Container(
    height: 75.h,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 23.h,
          width: 60.w,
          child: SvgPicture.asset(
            AppImages.mobileIcon,
            colorFilter: ColorFilter.mode(
              AppColors.iconColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color: AppColors.iconTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              size ?? '',
              style: GoogleFonts.roboto(
                fontSize: 12.sp,
                color: AppColors.iconColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
