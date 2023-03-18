import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/banner_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_field.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

import '../../../common_widgets/custom_text_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BannerWidget(),
              CustomTextField(
                labelName: 'Complete Name',
                hintText: 'Write your name',
                controller: nameController,
              ),
              CustomTextField(
                labelName: 'Email Address',
                hintText: 'Write your mail address',
                controller: emailController,
              ),
              CustomTextField(
                labelName: 'Password',
                hintText: 'Write your security',
                controller: passwordController,
                isObsecure: true,
              ),
              const SizedBox(height: AppSize.s30),
              CustomButtonWidget(
                  title: 'Get Started',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpAgeJobScreen(
                          fullName: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ))),
              const SizedBox(height: AppSize.s20),
              CustomTextButtonWidget(
                title: 'Sign In to My Account',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
