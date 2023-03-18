import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/logo_and_tagline_widget.dart';
import 'package:sarang_app/src/common_widgets/upload_photo_widget.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/utils/image_picker_utils.dart';

import '../../../common_widgets/custom_text_button_widget.dart';
import '../../../theme_manager/value_manager.dart';
import 'bloc/auth_bloc.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  static const routeName = '/sign-up-upload-photo';
  const SignUpUploadPhotoScreen({super.key});

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  void getImageProfile(GetCameraFrom source) async {
    final result = await ImagePickerUtils.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, ExplorePeopleScreen.routeName, (route) => false);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndTaglineWidget(),
                const SizedBox(height: AppSize.s50),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(AppSize.s24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    getImageProfile(GetCameraFrom.camera);
                                  },
                                  icon: const Icon(Icons.camera),
                                ),
                                const Text('Take Image From Camera'),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    getImageProfile(GetCameraFrom.gallery);
                                  },
                                  icon: const Icon(Icons.photo),
                                ),
                                const Text('Take Image From Photo'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: UploadPhotoWidget(image: image),
                ),
                const SizedBox(height: 53),
                Text(
                  userAccount.fullName,
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f22,
                    fontWeight: FontWeightManager.semibold,
                  ),
                ),
                const SizedBox(height: AppSize.s4),
                Text(
                  '${userAccount.age}, ${userAccount.occupation}',
                  style: getBlack60TextStyle(),
                ),
                const SizedBox(height: 240.0),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButtonWidget(
                      title: 'Update My Profile',
                      onTap: () {
                        userAccount.imageProfile = image?.path;
                        context.read<AuthBloc>().add(
                              RegisterAuthEvent(
                                userAccount: userAccount,
                                isRegister: true,
                              ),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                CustomTextButtonWidget(
                  title: 'Skip for Now',
                  onPressed: () => context.read<AuthBloc>().add(
                        RegisterAuthEvent(
                          userAccount: userAccount,
                          isRegister: true,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
