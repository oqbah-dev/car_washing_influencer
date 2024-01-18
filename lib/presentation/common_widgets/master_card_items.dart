import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';


 InputDecoration inputDecoration = masterCardDecoration();

 InputDecoration masterCardDecoration() {
   return InputDecoration(
   contentPadding: const EdgeInsets.all(20),
   floatingLabelBehavior: FloatingLabelBehavior.never,
   labelStyle: getSemiBoldStyle(
       color: ColorManager.grey, fontSize: FontSize.s16),
   focusedBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide.none),
   border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide.none),
   disabledBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide.none),
   enabledBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide.none),
   errorBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide.none),
   filled: true,
   enabled: true);
 }