import 'dart:developer';

import 'package:filemanager/data/directory_size/directory_size.dart';
import 'package:filemanager/main.dart';
import 'package:filemanager/utils/constant/app_images.dart';
import 'package:filemanager/viewmodel/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends AsyncNotifier<HomeState> {
  var driveList = <Drive>[];

  @override
  Future<HomeState> build() async {
    calculateDrive();
    return HomeState();
  }

  Future<void> calculateDrive() async {
    state = AsyncLoading();
    try {
      var size = await DirectorySize.calculateDriveFreeSize(
        "${rootStorage.path}/emulated/0/",
      );
      log(size);
      driveList.add(
        Drive(
          icon: AppImages.mobileIcon,
          title: "Internal Storage",
          size: size,
        ),
      );
      state = AsyncData(HomeState(drivesList: driveList));
    } catch (e) {
      log("Error preparing drive list $e");
      state = AsyncError(e, StackTrace.current);
    }
  }
}
