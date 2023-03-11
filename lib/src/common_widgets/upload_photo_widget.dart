import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';

class UploadPhotoWidget extends StatelessWidget {
  const UploadPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.secondary,
              width: 8,
              strokeAlign: StrokeAlign.outside,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              image: AssetImage(
                  '${AssetImageIconManager.iconPath}/ic_profile_default.png'),
            ),
          ),
        ),
        const Positioned(
          bottom: -25,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image(
              image: AssetImage(
                  '${AssetImageIconManager.iconPath}/ic_add_color.png'),
            ),
          ),
        )
      ],
    );
  }
}
