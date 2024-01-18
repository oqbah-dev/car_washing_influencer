import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildNotificationItems extends StatelessWidget {
  const BuildNotificationItems({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p12.w),

      child: Card(
        elevation: 5,
        color: ColorManager.primary,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: ListTile(
            title: Text(
              title,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12.sp),
            ),
            leading: Icon(
              Icons.notifications_active,
              color: ColorManager.primary,
              size: AppSize.s30,
            ),
            subtitle: Text(
              subtitle,
              style: getMediumStyle(
                  color: ColorManager.black, fontSize: FontSize.s14.sp),
            ),
            trailing: Text(
              trailing,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.s14.sp),
            ),
          ),
        ),
      ),
    );
  }
}
class BuildNotificationItemsLoading extends StatelessWidget {
  const BuildNotificationItemsLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      child: Card(
        elevation: 5,
        color: ColorManager.primary,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: ListTile(
            title: Shimmer.fromColors(
              baseColor: ColorManager.primary,
              highlightColor: ColorManager.black,
              child: Text(
                AppStrings.carWashing.tr(),
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s12.sp),
              ),
            ),
            leading: Shimmer.fromColors(
              baseColor: ColorManager.primary,
              highlightColor: ColorManager.black,
              child: Icon(
                Icons.notifications_active,
                color: ColorManager.primary,
                size: AppSize.s30,
              ),
            ),
            subtitle: Shimmer.fromColors(
              baseColor: ColorManager.primary,
              highlightColor: ColorManager.black,
              child: Text(
                AppStrings.approveMessage.tr(),
                maxLines: 1,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s14.sp),
              ),
            ),
            trailing: Shimmer.fromColors(
              baseColor: ColorManager.primary,
              highlightColor: ColorManager.black,
              child: Text(
                '34 ${AppStrings.minutesAgo.tr()}',
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
