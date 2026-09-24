import 'dart:developer';
import 'dart:io';

import 'package:filemanager/data/directory_size/directory_size.dart';
import 'package:filemanager/main.dart';

class InternalStorageData {
  static var currentDirectory = Directory("${rootStorage.path}emulated/0/");
  static var parentDirectory = Directory(rootStorage.path);

  /// Get directory initially
  static Future<List<FileSystemEntity>> getInternalStorageData() async {
    var size = await DirectorySize.directorySize(currentDirectory.path);
    log(size.toString());
    return currentDirectory.listSync();
  }

  /// Change Directory
  // static Future<List<FileSystemEntity>> changeDirectory(int index) async {
  //   parentDirectory = currentDirectory;
  //   currentDirectory = Directory(currentDirectory[index].path).listSync();
  //   return currentDirectory;
  // }

  // /// Backtrack directory
  // static Future<List<FileSystemEntity>> backtrackDirectory() async {
  //   currentDirectory = parentDirectory;
  //   parentDirectory = parentDirectory.first.parent.listSync();
  //   return currentDirectory;
  // }
}
