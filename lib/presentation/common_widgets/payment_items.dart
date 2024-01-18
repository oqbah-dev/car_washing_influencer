import 'package:flutter/material.dart';

import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final Color textColor;
  final Color borderColor;
  final String labelText;
  final String suffixText;
  final TextStyle labelStyle;
  final TextStyle suffixStyle;

  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.textColor,
    required this.borderColor,
    required this.labelText,
    required this.suffixText,
    required this.labelStyle,
    required this.suffixStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ,
      style: getRegularStyle(color: textColor,fontSize: FontSize.s17),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText ,
        labelStyle: labelStyle,
        suffixText: suffixText,
        suffixStyle: suffixStyle,
      ),
    );
  }
}
