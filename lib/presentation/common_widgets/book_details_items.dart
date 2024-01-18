import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildBookDetailsItems extends StatelessWidget {
  const BuildBookDetailsItems({
    super.key,
    required this.h, required this.text1, required this.text2, required this.text3, required this.widget,
  });

  final double h;
  final String text1;
  final String text2;
  final String text3;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s16.sp),
              ),
              Text(
                text2,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s18.sp),
              ),
              Text(
                text3,
                style: getMediumStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14.sp),
              ),
            ],
          ),
          widget
        ],
      ),
    );
  }
}