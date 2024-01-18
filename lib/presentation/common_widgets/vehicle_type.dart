import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildVehicleType extends StatelessWidget {
  const BuildVehicleType(
      {super.key, required this.text, required this.isActive, this.onTap});

  final String text;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: isActive ?2.5:1,
                color: isActive ? ColorManager.primary : ColorManager.grey)),
        child: Text(
          text,
          style: getRegularStyle(
              color: isActive ? ColorManager.primary : ColorManager.grey,
              fontSize: FontSize.s17),
        ),
      ),
    );
  }
}
