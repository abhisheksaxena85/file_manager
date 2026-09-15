import 'dart:io';

import 'package:filemanager/data/root_storage/root_storage_data.dart';
import 'package:filemanager/utils/service/storage_permission/storage_permission_service.dart';
import 'package:filemanager/utils/theme/app_theme/app_theme.dart';
import 'package:filemanager/views/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Global Variables
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late List<FileSystemEntity> rootStorageDataList;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    StoragePermissionService.requestStoragePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, build) {
        return MaterialApp(
          locale: Locale('en', 'in'),
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultAppTheme(),
          home: HomeScreen(),
        );
      },
    );
  }
}
