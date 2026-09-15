import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StorageSectionWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<StorageSectionWidget> createState() => _StorageSectionWidgetState();
}

class _StorageSectionWidgetState extends State<StorageSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 200.h, color: Colors.red);
  }
}
