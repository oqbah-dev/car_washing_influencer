import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.validator,
      this.maxLength,
      this.keyboardType,
      this.counter,
      this.obscureText = false});

  final Widget? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? counter;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.white,
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s18),
        decoration: InputDecoration(
          fillColor: ColorManager.white,
            contentPadding: const EdgeInsets.all(20),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: label,
            errorStyle: getMediumStyle(color: ColorManager.white),
            labelStyle: getSemiBoldStyle(
                color: ColorManager.grey, fontSize: FontSize.s16),
            counter: counter,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            filled: true,
            enabled: true),
      ),
    );
  }
}
