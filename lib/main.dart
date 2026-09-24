import 'dart:io';

import 'package:filemanager/data/dependency_injection/dependency_injection.dart';
import 'package:filemanager/data/local_data_storage/shared_preference/preference.dart';
import 'package:filemanager/utils/service/storage_permission/storage_permission_service.dart';
import 'package:filemanager/utils/theme/app_theme/app_theme.dart';
import 'package:filemanager/views/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Global Variables
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Directory rootStorage = Directory('/storage/');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(ProviderScope(child: MyApp()));
}

Future<void> initialize() async {
  /// Configure getIt Dependency
  configureDependencies();

  /// Shared - Preference init
  Preference.init();

  /// Storage - Permission
  StoragePermissionService.requestStoragePermission();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, build) {
        return MaterialApp(
          locale: Locale('en', 'in'),
          navigatorKey: navigatorKey,
          title: 'Files',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultAppTheme(),
          home: HomeScreen(),
        );
      },
    );
  }
}
