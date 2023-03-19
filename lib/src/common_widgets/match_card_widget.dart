import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

import 'glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                user.imagePath,
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
        GlassCardWidget(user: user)
      ],
    );
  }
}
