import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';


class BuildBookingActiveItems extends StatelessWidget {
  const BuildBookingActiveItems({
    super.key, this.onTap,
  });
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: AppSize.s70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height:  h * .08,
              width: w *.17,
              decoration: BoxDecoration(
                  color: ColorManager.textFormDarkGrey,
                  borderRadius: BorderRadius.circular(15)),
              child: const Text("80 x 80"),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.carWashing.tr(),
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s16.sp),
                ),
                Text(
                  AppStrings.washingServices.tr(),
                  style: getRegularStyle(
                      color: ColorManager.black, fontSize: FontSize.s14.sp),
                ),
                Text(
                  "9 Feb 2019 - 09:00 PM",
                  style: getRegularStyle(
                      color: ColorManager.textFormLightGrey,
                      fontSize: FontSize.s14),
                ),
              ],
            ),
            const Spacer(),
            Align(alignment: Alignment.topRight,
              child: Text(
                "${AppStrings.riyal.tr()} 15.75",
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}