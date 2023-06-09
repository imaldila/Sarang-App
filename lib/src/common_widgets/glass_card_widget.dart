import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';

import '../theme_manager/asset_image_icon_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import '../theme_manager/value_manager.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p15,
        horizontal: AppPadding.p24,
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m30, vertical: AppMargin.m26),
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              '${AssetImageIconManager.imagePath}/img_glass_card.png'),
        ),
        borderRadius: BorderRadius.circular(33.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semibold,
                ),
              ),
              Text(
                '${user.age}, ${user.occupation}',
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f14,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    '${AssetImageIconManager.iconPath}/ic_profile.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
