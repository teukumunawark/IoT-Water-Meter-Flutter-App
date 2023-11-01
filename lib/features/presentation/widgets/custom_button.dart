import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.menuBackground,
        fixedSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: kHeading6.copyWith(
          fontSize: 14,
          color: AppColors.contentColorWhite,
        ),
      ),
    );
  }
}
