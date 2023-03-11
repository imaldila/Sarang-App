import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/logo_widget.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

class LogoAndTaglineWidget extends StatelessWidget {
  const LogoAndTaglineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoWidget(),
        const SizedBox(
          height: AppSize.s6,
        ),
        Text(
          'Find your perfect love',
          style: getWhiteTextStyle(),
        )
      ],
    );
  }
}
