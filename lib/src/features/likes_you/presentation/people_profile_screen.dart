import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/features/likes_you/data/data_hobby_dummy.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

import '../../../common_widgets/people_detail_image_widget.dart';
import '../../../common_widgets/people_identitas_widget.dart';
import '../domain/user.dart';

class PeopleProfileScreen extends StatelessWidget {
  static const routeName = 'people-profile';
  const PeopleProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: Column(
        children: [
          ProfileDetailImageWidget(
            user: user,
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          PoepleIdentitasWidget(user: user),
          Container(
            height: 80.0,
            margin: const EdgeInsets.only(left: AppMargin.m24),
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                width: 120.0,
                height: 80,
                margin: const EdgeInsets.only(right: AppMargin.m16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s18),
                  image: DecorationImage(
                      image: AssetImage(
                        dataHobbyDummy[index],
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              itemCount: dataHobbyDummy.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: AppSize.s40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: CustomButtonWidget(
              title: 'Chat Now',
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: AppSize.s40,
          ),
        ],
      ),
    );
  }
}
