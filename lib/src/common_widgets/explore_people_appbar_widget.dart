import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/logo_widget.dart';
import 'package:sarang_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

class ExplorePeopleApparWidget extends StatelessWidget {
  const ExplorePeopleApparWidget({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            UserAccountRegister.userAccountLogout();
            Navigator.pushNamedAndRemoveUntil(
                context, SignUpScreen.routeName, (route) => false);
          },
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imagePath != null
                    ? FileImage(File(imagePath!))
                    : const AssetImage(
                            '${AssetImageIconManager.imagePath}/img_user.png')
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
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
