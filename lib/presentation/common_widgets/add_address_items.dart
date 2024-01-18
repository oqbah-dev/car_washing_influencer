import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class BuildAddAddressType extends StatelessWidget {
  const BuildAddAddressType(
      {super.key,
      required this.w,
      this.onTap,
      required this.text,
      required this.isActive,
      required this.w1});
  final double w;
  final double w1;
  final void Function()? onTap;
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: w * .18,
            width: w * .25,
            decoration: BoxDecoration(
              color: ColorManager.lightGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              text,
              style: getMediumStyle(
                  color: ColorManager.white, fontSize: FontSize.s17),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        isActive
            ? SvgPicture.asset(IconsAssets.checksIc)
            : Container(
                height: w1,
                width: w1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.black)),
              )
      ],
    );
  }
}
