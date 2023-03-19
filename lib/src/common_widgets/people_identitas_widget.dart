import 'package:flutter/material.dart';

import '../features/likes_you/domain/user.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import '../theme_manager/value_manager.dart';

class PoepleIdentitasWidget extends StatelessWidget {
  const PoepleIdentitasWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semibold,
            ),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBlackTextStyle(fontSize: FontSizeManager.f16),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f16,
            ),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
