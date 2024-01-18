import 'package:flutter/material.dart';

import '../resources/color_manager.dart';


class BuildStartRatingWidget extends StatelessWidget {
  const BuildStartRatingWidget(
      {super.key,
      this.borderRadius,
      required this.text,
      required this.isActive, this.onTap});

  final BorderRadiusGeometry? borderRadius;
  final String text;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 70,
        decoration: BoxDecoration(
          color: isActive? ColorManager.primary:ColorManager.white,
            borderRadius: borderRadius,
            border: Border.all(color: ColorManager.black)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isActive ? ColorManager.white : Colors.black,
                ),
              ),
              Icon(
                Icons.star,
                color: isActive ? ColorManager.white : Colors.orange,
              )
            ],
          ),

        ),
      ),
    );
  }
}
