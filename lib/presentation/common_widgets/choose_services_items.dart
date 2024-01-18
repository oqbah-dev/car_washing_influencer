import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildChooseServicesItems extends StatelessWidget {
  const BuildChooseServicesItems({
    super.key,
    required this.h,
    required this.w,
    required this.feature,
    required this.price,
    this.onTap,
    required this.isSelected,
  });

  final double h;
  final double w;
  final String feature;
  final String price;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorManager.transparent,
      highlightColor: ColorManager.transparent,
      child: SizedBox(
        height: AppSize.s50.h,
        width: w * .9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  feature,
                  style: getSemiBoldStyle(
                      color: Colors.black, fontSize: FontSize.s16.sp),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  price,
                  style: getSemiBoldStyle(
                      color: Colors.black, fontSize: FontSize.s12.sp),
                ),
              ),
             Expanded(
               flex: 1,
               child: isSelected? SvgPicture.asset(IconsAssets.checksIc):Container(
                 height: w * .05,
                 width: w * .05,
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(
                         color: ColorManager.black
                     )
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
