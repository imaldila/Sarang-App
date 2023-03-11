import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/value_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelName,
      required this.hintText,
      this.isObsecure = false,
      required this.controller});

  final String labelName;
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(height: AppSize.s8),
        TextField(
          controller: controller,
          obscureText: isObsecure,
          style: getWhiteTextStyle(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p30,
              vertical: AppPadding.p15,
            ),
            filled: true,
            fillColor: ColorManager.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s50),
            ),
            hintText: hintText,
            hintStyle: getBlack30TextStyle(),
          ),
        ),
        const SizedBox(height: AppSize.s14),
      ],
    );
  }
}
