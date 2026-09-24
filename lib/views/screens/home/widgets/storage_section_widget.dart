import 'package:filemanager/viewmodel/controllers.dart';
import 'package:filemanager/views/screens/storage/storage_screen.dart';
import 'package:filemanager/views/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StorageSectionWidget extends ConsumerWidget {
  const StorageSectionWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homeViewmodelController);
    return SizedBox(
      child: state.when(
        loading: () {
          return SizedBox(
            height: 50.h,
            width: 50.w,
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stack) => Container(),
        data: (data) => GridView.builder(
          itemCount: data.drivesList.length,
          shrinkWrap: true,
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisExtent: 60.h,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            var item = data.drivesList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StorageScreen(storageName: item.title),
                  ),
                );
              },
              child: dashBoardCardWidget(
                item.icon,
                item.title,
                isFileSize: true,
                size: state.isLoading ? "Calculating.." : item.size,
              ),
            );
          },
        ),
      ),
    );
  }
}
