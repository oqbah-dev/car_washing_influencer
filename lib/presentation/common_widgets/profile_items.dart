import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/languages_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildProfileCircle extends StatelessWidget {
  const BuildProfileCircle({
    super.key,
    required this.w,
    required this.color,
    this.onTap,
    required this.child,
  });

  final double w;
  final Color color;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: w,
        width: w,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({
    super.key,
    required this.h,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final double h;
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      child: Column(
        children: [
          SizedBox(
            height: widget.h * .05,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Card(
              color: ColorManager.primary,
              elevation: 5,
              child: Container(
                alignment: Alignment.center,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          widget.text,
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize:
                                  isRTL() ? FontSize.s16.sp : FontSize.s14.sp),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          widget.icon,
                          color: ColorManager.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
