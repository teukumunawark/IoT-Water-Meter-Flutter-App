import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '../bloc/category_select_cubit.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
    this.text, {
    required this.index,
    super.key,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<CategorySelectedCubit>().setCategory(index),
      style: TextButton.styleFrom(
        minimumSize: const Size(80, 35),
        backgroundColor: context.watch<CategorySelectedCubit>().state == index
            ? AppColors.secondary
            : Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: kBodyText.copyWith(
          color: context.watch<CategorySelectedCubit>().state == index
              ? AppColors.contentColorWhite
              : AppColors.menuBackground,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
