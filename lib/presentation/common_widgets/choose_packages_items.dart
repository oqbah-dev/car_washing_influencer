import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../resources/Strings_manager.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildChoosePackagesItems extends StatelessWidget {
  const BuildChoosePackagesItems({
    super.key,
    required this.h,
    required this.w,
    required this.title,
    required this.price,
    required this.time,
    required this.feature1,
    required this.feature2,
    required this.isSelected,
    this.onTap,
  });

  final double h;
  final double w;
  final String title;
  final String price;
  final String time;
  final String feature1;
  final String feature2;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p4.h, horizontal: AppPadding.p12.w),
      child: InkWell(
        highlightColor: ColorManager.transparent,
        splashColor: ColorManager.transparent,
        onTap: onTap,
        child: Card(
          elevation: isSelected ? 5.0 : 0.0,
          child: Container(
            height: AppSize.s125.h,
            width: w * .9,
            decoration: BoxDecoration(
              color: isSelected ? ColorManager.primary : ColorManager.white,
              border: Border.all(
                  color: isSelected ? ColorManager.white : ColorManager.primary,
                  width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: isSelected
                          ? SvgPicture.asset(IconsAssets.checksIc)
                          : Container(
                              height: AppSize.s16.w,
                              width: AppSize.s16.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: isSelected
                                          ? ColorManager.white
                                          : ColorManager.primary)),
                            )),
                  Text(
                    title,
                    style: getSemiBoldStyle(
                        color: isSelected
                            ? ColorManager.white
                            : ColorManager.black,
                        fontSize: FontSize.s20.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        price,
                        style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                            fontSize: FontSize.s18.sp),
                      ),
                      SizedBox(
                        width: AppSize.s70.w,
                      ),
                      Text(
                        time,
                        style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.gold
                                : ColorManager.grey,
                            fontSize: FontSize.s18.sp),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        feature1,
                        style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                            fontSize: FontSize.s18.sp),
                      ),
                      Text(
                        feature2,
                        style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.white
                                : ColorManager.black,
                            fontSize: FontSize.s18.sp),
                      ),
                      Text(
                        AppStrings.more.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.lightPrimary,
                            fontSize: FontSize.s18.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
