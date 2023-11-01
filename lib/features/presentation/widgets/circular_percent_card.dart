import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';

class CircularPercentCardWidget extends StatelessWidget {
  const CircularPercentCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percent,
    required this.percentText,
    this.color = AppColors.contentColorGreen,
  });

  final double percent;
  final double percentText;
  final String title;
  final String subtitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 160,
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        decoration: BoxDecoration(
          color: AppColors.contentColorWhite,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.menuBackground,
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              backgroundColor: AppColors.secondary,
              radius: 48,
              percent: percent,
              lineWidth: 15,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${(percentText).toStringAsFixed(0)}%",
                style: kSubtitle,
              ),
              progressColor: color,
            ),
            const Spacer(),
            Text(
              title,
              style: kHeading6.copyWith(fontSize: 16),
            ),
            Text(
              subtitle,
              style: kBodyText.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
