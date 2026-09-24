import 'package:filemanager/views/screens/home/widgets/file_categories_widget.dart';
import 'package:filemanager/views/screens/home/widgets/storage_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        primary: true,
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// SearchBar
              /// On Hold for now
              /// FileSearchBar()

              /// Categories
              FileCategoriesWidget(),

              /// Collection Tab

              /// Storage Section
              StorageSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
