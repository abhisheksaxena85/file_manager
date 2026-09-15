import 'dart:developer';
import 'dart:io';

import 'package:filemanager/main.dart';
import 'package:external_path/external_path.dart';

class RootStorageData {
  static Future<void> getRootStorageData() async {
    rootStorageDataList = Directory('/storage/emulated/0').listSync();
    var list = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOCUMENTS,
    );
    var file = rootStorageDataList.first;
    log(file.path);
    // var first = file.parent.listSync();
    // var newD = await Directory(file.parent.path + "/NewFolder")
    //     .create(recursive: true);
    // log(newD.path.toString());
    // int a = 0;
    // for (int i = 0; i < rootStorageDataStream.length; i++) {
    //   a++;
    //   log(rootStorageDataStream[i].path.toString() + a.toString());
    // }
    // log(list.toString());
  }
}
