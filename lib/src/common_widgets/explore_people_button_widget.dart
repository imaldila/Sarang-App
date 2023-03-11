import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/match_button_widget.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'ic_close.png',
          onTap: () {},
        ),
        MatchButtonWidget(
          dimension: 80,
          iconPath: 'ic_love.png',
          onTap: () {},
        ),
        MatchButtonWidget(
          iconPath: 'ic_favorite.png',
          onTap: () {},
        ),
      ],
    );
  }
}
