import 'dart:developer';

import 'package:filemanager/main.dart';
import 'package:filemanager/utils/constant/app_colors.dart';
import 'package:filemanager/utils/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionService {
  /// Satic function to request Manage Storage Permission
  static Future<bool> requestStoragePermission() async {
    Permission permission = Permission.manageExternalStorage;
    bool permissionStatus = await permission.status.isGranted;

    if (!permissionStatus) {
      showPermissionDialog(() {
        permission.request().then((value) {
          var isGranted = value.isGranted;
          if (navigatorKey.currentContext != null && isGranted) {
            Navigator.pop(navigatorKey.currentContext!);
          }
          return true;
        });
      });
    }
    return permissionStatus;
  }

  /// Showing the request permission dialog box
  static void showPermissionDialog(Function() btnCallback) {
    try {
      var context = navigatorKey.currentContext;
      if (context != null) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Color.fromRGBO(243, 243, 250, 1),
          clipBehavior: Clip.hardEdge,
          isDismissible: false,
          showDragHandle: true,
          enableDrag: false,
          elevation: 12.r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          builder: (context) {
            return Container(
              height: 350.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 243, 250, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      AppImages.introSheetFileIcon,
                      height: 170.h,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      "File Manager app can help you quickly find you photos, videos, documents and more if you allow access.",
                      style: GoogleFonts.googleSans(
                        color: AppColors.secondaryTextColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: btnCallback,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.brandColor,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check,
                            size: 17.sp,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Continue",
                            style: GoogleFonts.googleSans(
                              fontSize: 15.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      log("Error while showing storage permission bottom sheet! $e");
    }
  }
}
