import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
class BuildConfirmButton extends StatelessWidget {
  const BuildConfirmButton({
    super.key,
    required this.h, required this.text, this.onPressed,
  });

  final double h;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.08,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
        ),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSemiBoldStyle(
                color: ColorManager.white, fontSize: FontSize.s22),
          )),
    );
  }
}