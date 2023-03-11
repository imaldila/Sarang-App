import 'package:flutter/material.dart';

import '../theme_manager/asset_image_icon_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import '../theme_manager/value_manager.dart';
import 'match_button_widget.dart';


class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                '${AssetImageIconManager.imagePath}/img_people_love1.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p26,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                dimension: 20.0,
                iconPath: 'ic_arrow_left.png',
                onTap: () => Navigator.pop(context),
              ),
              Text(
                'Lover Profile\nDetails',
                textAlign: TextAlign.center,
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semibold,
                ),
              ),
              MatchButtonWidget(
                dimension: 20.0,
                iconPath: 'ic_close_circle.png',
                onTap: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
