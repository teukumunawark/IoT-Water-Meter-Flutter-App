import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';

class CustomOutlineTextField extends StatelessWidget {
  const CustomOutlineTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.label,
  });

  final String hintText;
  final String label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  get kSecondery => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 48,
        child: TextField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          style: kSubtitle,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: kSubtitle,
            label: Text(
              label,
              style: kSubtitle.copyWith(height: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.secondary,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.contentColorGreen,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            floatingLabelStyle: kSubtitle.copyWith(
              height: 1.05,
              color: AppColors.contentColorGreen,
            ),
          ),
        ),
      ),
    );
  }
}
