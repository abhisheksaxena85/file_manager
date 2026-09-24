import 'package:filemanager/data/internal_storage/internal_storage_data.dart';
import 'package:filemanager/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StorageScreen extends StatefulWidget {
  final String storageName;
  const new({super.key, required this.storageName});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  ScrollController scrollController = ScrollController();
  var foldersList = InternalStorageData.currentDirectory.listSync();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,

        title: Text(
          widget.storageName,
          style: GoogleFonts.googleSans(
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.iconTextColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: AppColors.white,
        child: ListView.builder(
          shrinkWrap: true,
          primary: true,
          itemCount: foldersList.length,
          itemBuilder: (context, index) {
            var item = foldersList[index].path.split('/').last;
            if (item.startsWith('.')) {
              return SizedBox();
            }

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.bgColor,
              ),
              child: Text(
                item,
                style: GoogleFonts.googleSans(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
