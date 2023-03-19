import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';

import '../../../common_widgets/banner_widget.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../theme_manager/value_manager.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';
  const SignUpAgeJobScreen(
      {super.key,
      required this.fullName,
      required this.email,
      required this.password});

  final String fullName;
  final String email;
  final String password;

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  String? validationInput() {
    if (jobController.text.isEmpty || ageController.text.isEmpty) {
      return 'Can\'t be empty';
    }

    return null;
  }

  @override
  void dispose() {
    jobController.dispose();
    jobController.clear();
    ageController.dispose();
    ageController.clear();
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
                labelName: 'Occupation',
                hintText: 'Write your occupation',
                controller: jobController,
              ),
              CustomTextField(
                labelName: 'Age',
                hintText: 'Write your age',
                controller: ageController,
              ),
              const SizedBox(
                height: 117,
              ),
              CustomButtonWidget(
                title: 'Continue Sign Up',
                onTap: () {
                  final message = validationInput();

                  if (message != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                    return;
                  }
                  UserAccount userAccount = UserAccount(
                    fullName: widget.fullName,
                    email: widget.email,
                    password: widget.password,
                    occupation: jobController.text,
                    age: ageController.text,
                  );

                  Navigator.pushNamed(
                    context,
                    SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
