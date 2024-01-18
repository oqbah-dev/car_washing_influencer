import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildSettingAccountItems extends StatelessWidget {
  const BuildSettingAccountItems({
    super.key,
    required this.w, this.onTap, required this.text, required this.iconPath,
  });

  final double w;
  final void Function()? onTap;
  final String text;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: w * 0.12,
            width: w * 0.12,
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(iconPath),
          ),
          SizedBox(width: w *.05,),
          Text(
            text,
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.s17),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_outlined,color: ColorManager.grey,)
        ],
      ),
    );
  }
}
class BuildMoreOptionItems extends StatelessWidget {
  const BuildMoreOptionItems({
    super.key, required this.text, required this.widget,
  });
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s20),),
        widget,
      ],);
  }
}