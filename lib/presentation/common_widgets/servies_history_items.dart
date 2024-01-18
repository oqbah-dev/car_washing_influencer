import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildServicesHistoryItem extends StatelessWidget {
  const BuildServicesHistoryItem({
    super.key,
    required this.serviceName,
    required this.price,
    required this.status,
  });

  final String serviceName;
  final String price;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      child: SizedBox(
        child: Card(
          elevation: 5.0,
          shadowColor: ColorManager.primary,
          color: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            height: AppSize.s70.h,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
                title: Text(
                  serviceName,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s20.sp),
                ),
                subtitle: Text(
                  "$price ${AppStrings.riyal.tr()}",
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s18.sp),
                ),
                trailing: Text(
                  status,
                  style: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18.sp),
                )),
          ),
        ),
      ),
    );
  }
}

class BuildServicesHistoryItemLoading extends StatelessWidget {
  const BuildServicesHistoryItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      child: SizedBox(
        child: Card(
          elevation: 5.0,
          shadowColor: ColorManager.primary,
          color: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            height: AppSize.s70.h,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
                title: Shimmer.fromColors(
                  baseColor: ColorManager.primary,
                  highlightColor: ColorManager.black,
                  child: Text(
                    AppStrings.serviceName.tr(),
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s20.sp),
                  ),
                ),
                subtitle: Shimmer.fromColors(
                  baseColor: ColorManager.primary,
                  highlightColor: ColorManager.black,
                  child: Text(
                    AppStrings.price.tr(),
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s18.sp),
                  ),
                ),
                trailing: Shimmer.fromColors(
                  baseColor: ColorManager.primary,
                  highlightColor: ColorManager.black,
                  child: Text(
                    AppStrings.status.tr(),
                    style: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18.sp),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
