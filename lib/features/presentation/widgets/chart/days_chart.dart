import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/constants.dart';
import '../../../domain/entities/daily_usage/hourly_usage.dart';
import '../../bloc/daily/daily_usage_bloc.dart';

import '../date_picker.dart';

class DailyChart extends StatefulWidget {
  const DailyChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DailyChartState();
}

class DailyChartState extends State<DailyChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: BlocBuilder<DailyUsageBloc, DailyUsageState>(
        builder: (context, state) {
          if (state is DailyUsageHasData) {
            final date = state.daily.map((e) => e.hari).last;
            final dataHour = state.daily.map((e) => e.penggunaanPerJam).last;
            final total = state.daily.map((e) => e.totalHarian).last;

            return buildDailyChart(
                date: date, dataHour: dataHour, total: total);
          }
          return buildDailyChart();
        },
      ),
    );
  }

  Padding buildDailyChart({
    String? date,
    UsageInHour? dataHour,
    double? total,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Hari ini',
                      style: kHeading6.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      "${total ?? 0} Liter",
                      style: kHeading6.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      date ?? '',
                      style: kSubtitle.copyWith(
                        fontSize: 10,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 130,
                      child: DatePickerExample(restorationId: 'main'),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BarChart(
                mainBarData(dataHour: dataHour),
                swapAnimationDuration: animDuration,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 12,
    List<int> showTooltips = const [],
  }) {
    barColor ??= AppColors.contentColorGreen;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? AppColors.contentColorPurple : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 2)
              : const BorderSide(color: AppColors.secondary, width: 2),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 6,
            color: AppColors.secondary,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups({UsageInHour? dataHour}) {
    final List<double?> hourlyValues = [
      dataHour?.oneAM?.toDouble(),
      dataHour?.twoAM?.toDouble(),
      dataHour?.threeAM?.toDouble(),
      dataHour?.fourAM?.toDouble(),
      dataHour?.fiveAM?.toDouble(),
      dataHour?.sixAM?.toDouble(),
      dataHour?.sevenAM?.toDouble(),
      dataHour?.eightAM?.toDouble(),
      dataHour?.nineAM?.toDouble(),
      dataHour?.tenAM?.toDouble(),
      dataHour?.elevenAM?.toDouble(),
      dataHour?.twelvePM?.toDouble(),
      dataHour?.onePM?.toDouble(),
      dataHour?.twoPM?.toDouble(),
      dataHour?.threePM?.toDouble(),
      dataHour?.fourPM?.toDouble(),
      dataHour?.fivePM?.toDouble(),
      dataHour?.sixPM?.toDouble(),
      dataHour?.sevenPM?.toDouble(),
      dataHour?.eightPM?.toDouble(),
      dataHour?.ninePM?.toDouble(),
      dataHour?.tenPM?.toDouble(),
      dataHour?.elevenPM?.toDouble(),
      dataHour?.midnight?.toDouble(),
    ];

    return List.generate(24, (i) {
      final value =
          hourlyValues[i] != null ? hourlyValues[i]!.toStringAsFixed(0) : '0.0';

      return makeGroupData(
        i,
        double.parse(value),
        isTouched: i == touchedIndex,
      );
    });
  }

  BarChartData mainBarData({UsageInHour? dataHour}) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String hour;
            final hourInt = group.x.toInt();
            if (hourInt >= 0 && hourInt <= 23) {
              hour = '${hourInt.toStringAsFixed(0).padLeft(2, '0')}:00';
            } else {
              throw Error();
            }

            return BarTooltipItem(
              '$hour\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: AppColors.contentColorGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 15,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(dataHour: dataHour),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = kHeading6.copyWith(
      color: AppColors.menuBackground,
      fontWeight: FontWeight.w400,
      fontSize: 5,
    );

    String hour = DateFormat('HH:00').format(DateTime(0, 0, 0, value.toInt()));

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(hour, style: style),
    );
  }
}

enum HourlyTime {
  oneAM,
  twoAM,
  threeAM,
  fourAM,
  fiveAM,
  sixAM,
  sevenAM,
  eightAM,
  nineAM,
  tenAM,
  elevenAM,
  twelvePM,
  onePM,
  twoPM,
  threePM,
  fourPM,
  fivePM,
  sixPM,
  sevenPM,
  eightPM,
  ninePM,
  tenPM,
  elevenPM,
  midnight
}
