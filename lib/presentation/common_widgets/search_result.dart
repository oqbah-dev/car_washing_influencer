import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildSearchListTile extends StatelessWidget {
  const BuildSearchListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: ColorManager.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: ColorManager.textFormDarkGrey,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            const SizedBox(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const  SizedBox(height: 15.0,),
                Text(
                  "Best Auto Spa",
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s16),
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
          ],),
      ),
    );
  }
}