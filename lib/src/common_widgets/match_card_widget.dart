import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

import 'glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                '${AssetImageIconManager.imagePath}/img_people_love2.png',
              ),
            ),
            borderRadius: BorderRadius.circular(AppSize.s70),
            border: Border.all(
              width: 10.0,
              color: ColorManager.secondary,
              strokeAlign: StrokeAlign.inside,
            ),
          ),
        ),
        const GlassCardWidget()
      ],
    );
  }
}
