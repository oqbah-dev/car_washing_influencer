import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildButton extends StatelessWidget {
  const BuildButton(
      {super.key, required this.text, this.onPressed, this.color});

  final String text;
  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.primary,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          height: AppSize.s50.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
            child: Text(
              text,
              style: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s22.sp),
            ),
          ),
        ),
      ),
    );
  }
}
class LoadingButton extends StatelessWidget {
  const LoadingButton(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.primary,
      child: Container(
        alignment: Alignment.center,
        height: AppSize.s50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
          )
        ),
      ),
    );
  }
}
class CancelButton extends StatelessWidget {
  const CancelButton(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.error,
      child: Container(
        alignment: Alignment.center,
        height: AppSize.s50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child:   Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
            child: Text(
              AppStrings.cancel.tr(),
              style: getSemiBoldStyle(
                  color: ColorManager.error, fontSize: FontSize.s22.sp),
            ),
          )    ),
      ),
    );
  }
}
