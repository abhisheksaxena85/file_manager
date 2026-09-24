import 'dart:developer';
import 'dart:io';

class DirectorySize {
  /// Calculating the size of directory using it's path only
  static Future<String> directorySize(String path) async {
    final directory = Directory(path);

    if (!await directory.exists()) {
      return "0 B";
    }

    int totalSize = 0;

    await for (final entity in directory.list(
      recursive: true,
      followLinks: true,
    )) {
      if (entity is File) {
        totalSize += await entity.length();
      }
    }
    log(totalSize.toString());
    return _formatDirectorySize(totalSize);
  }

  /// Convert the total calculated BYTES into readable format till PetaByte
  /// (B, KB, MB, GB, TB, PB)
  static String _formatDirectorySize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }

    if (bytes < 1024 * 1024) {
      return '${(bytes / 1000).toStringAsFixed(2)} KB';
    }

    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1000 * 1000)).toStringAsFixed(2)} MB';
    }

    if (bytes < 1024 * 1024 * 1024 * 1024) {
      return '${(bytes / (1000 * 1000 * 1000)).toStringAsFixed(2)} GB';
    }

    if (bytes < 1024 * 1024 * 1024 * 1024 * 1024) {
      return '${(bytes / (1000 * 1000 * 1000 * 1000)).toStringAsFixed(2)} TB';
    }

    return '${(bytes / (1000 * 1000 * 1000 * 1000 * 1000)).toStringAsFixed(2)} PB';
  }

  /// Get the size of whole Drive of Device
  /// By manually calculating each folder and file in root drive's root level and add all of that.
  static Future<String> calculateDriveFreeSize(String path) async {
    try {
      final rootDir = Directory(path);
      if (!await rootDir.exists()) {
        return "0 B";
      }

      int bytes = 0;
      int totalFiles = 0;
      final dirsToVisit = <Directory>[rootDir];

      while (dirsToVisit.isNotEmpty) {
        final currentDir = dirsToVisit.removeLast();

        // Skip restricted directories before attempting to list their contents
        if (isRestrictedAndroidFolder(currentDir.path)) {
          continue;
        }

        try {
          await for (final entity in currentDir.list(followLinks: false)) {
            if (entity is File) {
              totalFiles++;
              try {
                bytes += await entity.length();
              } catch (_) {
                // Ignore files that cannot be read
              }
            } else if (entity is Directory) {
              if (!isRestrictedAndroidFolder(entity.path)) {
                dirsToVisit.add(entity);
              }
            }
          }
        } catch (e) {
          // If a particular subdirectory cannot be accessed, skip it and continue
          continue;
        }
      }

      log("Total files $totalFiles");
      log("Total Bytes $bytes");
      return _formatDirectorySize(bytes);
    } catch (e) {
      log("Error while calculating drive size $e");
      return "";
    }
  }

  static bool isRestrictedAndroidFolder(String path) {
    final normalizedPath = path.replaceAll('\\', '/').toLowerCase();

    return normalizedPath.endsWith('/Android/data') ||
        normalizedPath.contains('/Android/data/') ||
        normalizedPath.endsWith('/Android/obb') ||
        normalizedPath.contains('/Android/obb/');
  }
}
