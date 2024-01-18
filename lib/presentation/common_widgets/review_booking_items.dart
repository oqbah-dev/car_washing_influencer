import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../app/languages_manager.dart';
import '../resources/color_manager.dart';
import '../resources/value_manager.dart';


class BuildReviewBookingCard extends StatefulWidget {
  const BuildReviewBookingCard({
    super.key, required this.child,
  });

  final List<Widget> child;

  @override
  State<BuildReviewBookingCard> createState() => _BuildReviewBookingCardState();
}

class _BuildReviewBookingCardState extends State<BuildReviewBookingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isRTL()?Alignment.centerRight:Alignment.centerLeft,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.child,
        ),
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}