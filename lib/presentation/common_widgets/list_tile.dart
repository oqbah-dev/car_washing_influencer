import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key, required this.h, required this.w, required this.h1,
  });
final double h;
final double h1;
final double w;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h,
        decoration: BoxDecoration(
          color: ColorManager.white,

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h1,
              width: w,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage(
                      ImageAssets.home2,),fit: BoxFit.cover),
                  color: ColorManager.textFormDarkGrey,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const  SizedBox(height: 15.0,),
                Text(
                  "Best Auto Spa",
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                const SizedBox(height: 1,),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconsAssets.smallMarkerIc,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "0.31 mi away",
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s14),
                    ),
                  ],
                ),
                const SizedBox(height: 1,),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconsAssets.starsIc,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "12",
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s14),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(IconsAssets.redLoveIc)
          ],),
      ),
    );
  }
}