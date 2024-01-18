import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class FindCarCard extends StatelessWidget {
  const FindCarCard({
    super.key, required this.name, required this.imagePath, required this.price, required this.height, required this.width, this.onTap, required this.isActive,
  });
  final String name;
  final String imagePath;
  final String price;
  final double height;
  final double width;
  final Widget isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: ColorManager.textFormLightGrey,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(imagePath),
                    isActive,
                  ],
                ),
                const SizedBox(height: 10,),
                Text(
                  name,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s17),
                ),
                Text(
                  "${AppStrings.from.tr()} $price ${AppStrings.riyal.tr()} ",
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.s14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}