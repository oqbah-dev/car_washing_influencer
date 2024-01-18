import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildScheduleRowItem extends StatelessWidget {
  const BuildScheduleRowItem({super.key, this.onTap, required this.selectText, required this.fromOrTo, required this.resultText});
  final void Function()? onTap;
  final String selectText;
  final String fromOrTo;
  final String resultText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Card(
            color: ColorManager.primary,
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              height: AppSize.s50.h,
              width: AppSize.s140.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.white),
              child: Text(
                selectText,
                style: getSemiBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16.sp),
              ),
            ),
          ),
        ),
        Card(
            elevation: 5,
            child: Text(fromOrTo)),
        Card(
          elevation: 5,
          color: ColorManager.primary,
          child: Container(
            alignment: Alignment.center,
            height: AppSize.s50.h,
            width: AppSize.s140.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white),
            child: Text(resultText,
              style: getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s16.sp),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildScheduleCard extends StatelessWidget {
  const BuildScheduleCard({
    super.key,
    required this.w, required this.child,
  });

  final double w;
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.primary,
      shadowColor: ColorManager.primary,
      child: Container(
        alignment: Alignment.center,
        height: AppSize.s40.h,
        width: w,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: child
      ),
    );
  }
}