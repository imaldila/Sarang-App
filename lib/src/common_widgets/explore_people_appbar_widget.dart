import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/logo_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

class ExplorePeopleApparWidget extends StatelessWidget {
  const ExplorePeopleApparWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 55.0,
          height: 55.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image:
                  AssetImage('${AssetImageIconManager.imagePath}/img_user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const LogoWidget(),
        InkWell(
          onTap: () =>
              Navigator.pushNamed(context, PeopleLovedScreen.routeName),
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                    '${AssetImageIconManager.iconPath}/ic_notification.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
