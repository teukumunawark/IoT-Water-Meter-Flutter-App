import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/constants.dart';
import '../../../domain/entities/weekly_usage/usage_in_day.dart';
import '../../bloc/weekly/weekly_usage_bloc.dart';
import '../date_picker.dart';

class WeeklyChart extends StatefulWidget {
  const WeeklyChart({super.key});

  final Color barBackgroundColor = AppColors.secondary;
  final Color barColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => WeeklyChartState();
}

class WeeklyChartState extends State<WeeklyChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: BlocBuilder<WeeklyUsageBloc, WeeklyUsageState>(
        builder: (context, state) {
          if (state is WeeklyUsageHasData) {
            final week = state.weekly.map((e) => e.minggu).last;
            final dataDays = state.weekly.map((e) => e.penggunaanPerHari).last;
            final total = state.weekly.map((e) => e.totalMingguan).last;

            return buildWeeklyChart(
              dataDays: dataDays,
              week: week,
              total: total,
            );
          }
          return buildWeeklyChart();
        },
      ),
    );
  }

  Padding buildWeeklyChart({
    String? week,
    UsageInDay? dataDays,
    double? total,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Minggu ini',
                      style: kHeading6.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      "$total Liter",
                      style: kHeading6.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      week ?? '',
                      style: kSubtitle.copyWith(
                        fontSize: 10,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  height: 40,
                  width: 150,
                  child: DatePickerExample(restorationId: 'main'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BarChart(
                mainBarData(dataDay: dataDays),
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
    double width = 35,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? AppColors.contentColorPurple : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.white, width: 3)
              : const BorderSide(color: AppColors.secondary, width: 3),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups({UsageInDay? dataDay}) {
    final List<double?> hourlyValues = [
      dataDay?.hari1?.toDouble(),
      dataDay?.hari2?.toDouble(),
      dataDay?.hari3?.toDouble(),
      dataDay?.hari4?.toDouble(),
      dataDay?.hari5?.toDouble(),
      dataDay?.hari6?.toDouble(),
      dataDay?.hari7?.toDouble(),
    ];

    return List.generate(7, (i) {
      final value =
          hourlyValues[i] != null ? hourlyValues[i]!.toStringAsFixed(0) : '0.0';

      return makeGroupData(
        i,
        double.parse(value),
        isTouched: i == touchedIndex,
      );
    });
  }

  BarChartData mainBarData({UsageInDay? dataDay}) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String day;
            final dayInt = group.x.toInt();
            switch (dayInt) {
              case 0:
                day = 'Monday';
                break;
              case 1:
                day = 'Tuesday';
                break;
              case 2:
                day = 'Wednesday';
                break;
              case 3:
                day = 'Thursday';
                break;
              case 4:
                day = 'Friday';
                break;
              case 5:
                day = 'Saturday';
                break;
              case 6:
                day = 'Sunday';
                break;
              default:
                throw Error();
            }

            return BarTooltipItem(
              '$day\n',
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
      barGroups: showingGroups(dataDay: dataDay),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = kHeading6.copyWith(
      color: AppColors.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('M', style: style);
        break;
      case 1:
        text = Text('T', style: style);
        break;
      case 2:
        text = Text('W', style: style);
        break;
      case 3:
        text = Text('T', style: style);
        break;
      case 4:
        text = Text('F', style: style);
        break;
      case 5:
        text = Text('S', style: style);
        break;
      case 6:
        text = Text('S', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }
}
