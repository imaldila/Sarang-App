import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widgets/explore_people_appbar_widget.dart';
import 'package:sarang_app/src/common_widgets/explore_people_button_widget.dart';
import 'package:sarang_app/src/common_widgets/match_card_widget.dart';
import 'package:sarang_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/likes_you/presentation/bloc/bloc/explore_people_bloc.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

class ExplorePeopleScreen extends StatefulWidget {
  static const routeName = '/explore-people';
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? account;

  final cardController = AppinioSwiperController();

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    account = result;
    setState(() {});
  }

  @override
  void initState() {
    getDataUserAccount();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    super.initState();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24,
        ),
        child: Column(
          children: [
            ExplorePeopleApparWidget(
              imagePath: account?.imageProfile,
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ExplorePoepleLoaded) {
                  final users = state.result;
                  List<Widget> cards = [];
                  for (var user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AppinioSwiper(
                            controller: cardController,
                            cardsBuilder: (context, index) => cards[index],
                            cardsCount: cards.length,
                            onEnd: () => context
                                .read<ExplorePeopleBloc>()
                                .add(OnExplorePeopleEventCalled()),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s50,
                        ),
                        ExplorePeopleButtonWidget(
                          controller: cardController,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
