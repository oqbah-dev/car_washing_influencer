import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class BuildCarWashItems extends StatelessWidget {
  const BuildCarWashItems({
    super.key, required this.tag, this.onTap,
  });
 final String tag;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w * .4,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.textFormDarkGrey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: tag,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: h * .135,
                width: w * .4,
                decoration: BoxDecoration(
                    color: ColorManager.textFormDarkGrey,
                    image: const DecorationImage(
                        image: AssetImage(
                          ImageAssets.home3,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Text(
            "Best Auto Spa",
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.s14),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                IconsAssets.smallMarkerIc,
                color: ColorManager.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "0.31 mi away",
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                IconsAssets.starsIc,
                height: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "12",
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
