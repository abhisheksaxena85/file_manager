import 'package:filemanager/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileCategoriesWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(color: Colors.yellow.shade400),
      // child: StreamBuilder(
      //   stream: rootStorageDataStream,
      //   initialData: null,
      //   builder: (context, snapshot) {
      //     var item = snapshot.data;
      //     return Container(
      //       height: 120.h,
      //       color: Colors.red,
      //       child: Text((item?.path).toString()),
      //     );
      //   },
      // ),
    );
  }
}
