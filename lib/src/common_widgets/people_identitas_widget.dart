import 'package:flutter/material.dart';

import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import '../theme_manager/value_manager.dart';


class PoepleIdentitasWidget extends StatelessWidget {
  const PoepleIdentitasWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shyna',
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semibold,
            ),
          ),
          Text(
            '22, Lawyer',
            style: getBlackTextStyle(fontSize: FontSizeManager.f16),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            'I love solving problem in terms of finance, business, and any case. With you, we will solve all world problems.',
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
