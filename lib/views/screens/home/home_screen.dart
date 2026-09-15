import 'package:filemanager/views/screens/home/widgets/file_categories_widget.dart';
import 'package:filemanager/views/screens/home/widgets/storage_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
