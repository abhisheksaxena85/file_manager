import 'dart:io';

import 'package:filemanager/main.dart';

class InternalStorageData {
  static var currentDirectory = rootStorageDataList;
  static var parentDirectory = rootStorageDataList;

  /// Get directory initially
  static Future<List<FileSystemEntity>> getInternalStorageData() async {
    parentDirectory = currentDirectory.first.parent.listSync();
    return currentDirectory;
  }

  /// Change Directory
  static Future<List<FileSystemEntity>> changeDirectory(int index) async {
    parentDirectory = currentDirectory;
    currentDirectory = Directory(currentDirectory[index].path).listSync();
    return currentDirectory;
  }

  /// Backtrack directory
  static Future<List<FileSystemEntity>> backtrackDirectory() async {
    currentDirectory = parentDirectory;
    parentDirectory = parentDirectory.first.parent.listSync();
    return currentDirectory;
  }
}
