import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_water_meter/features/presentation/bloc/month/monthly_usage_bloc.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/constants.dart';
import '../../../domain/entities/monthly_usage/usage_in_week.dart';
import '../date_picker.dart';

class MountChart extends StatefulWidget {
  const MountChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MountChartState();
}

class MountChartState extends State<MountChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: BlocBuilder<MonthlyUsageBloc, MonthlyUsageState>(
        builder: (context, state) {
          if (state is MonthlyUsageHasData) {
            final month = state.monthly.map((e) => e.bulan).last;
            final dataWeek = state.monthly.map((e) => e.usageInWeek).last;
            final total = state.monthly.map((e) => e.totalBulanan).last;

            return buildMonthlyChart(
              dataWeek: dataWeek,
              month: month,
              total: total,
            );
          }
          return buildMonthlyChart();
        },
      ),
    );
  }

  Padding buildMonthlyChart({
    String? month,
    UsageInWeek? dataWeek,
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
                      month ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BarChart(
                mainBarData(dataWeek: dataWeek),
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
    double width = 50,
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
              ? const BorderSide(color: Colors.white, width: 3)
              : const BorderSide(color: AppColors.secondary, width: 3),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: AppColors.secondary,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups({
    UsageInWeek? dataWeek,
  }) {
    final List<double?> hourlyValues = [
      dataWeek?.minggu1?.toDouble(),
      dataWeek?.minggu2?.toDouble(),
      dataWeek?.minggu3?.toDouble(),
      dataWeek?.minggu4?.toDouble(),
    ];

    return List.generate(4, (i) {
      final value =
          hourlyValues[i] != null ? hourlyValues[i]!.toStringAsFixed(0) : '0.0';

      return makeGroupData(
        i,
        double.parse(value),
        isTouched: i == touchedIndex,
      );
    });
  }

  BarChartData mainBarData({UsageInWeek? dataWeek}) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String week;
            final weekInt = group.x.toInt();
            switch (weekInt) {
              case 0:
                week = 'Minggu 1';
                break;
              case 1:
                week = 'Minggu 2';
                break;
              case 2:
                week = 'Minggu 3';
                break;
              case 3:
                week = 'Minggu 4';
                break;
              default:
                throw Error();
            }

            return BarTooltipItem(
              '$week\n',
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
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(dataWeek: dataWeek),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = kHeading6.copyWith(
      color: AppColors.menuBackground,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Minggu 1', style: style);
        break;
      case 1:
        text = Text('Minggu 2', style: style);
        break;
      case 2:
        text = Text('Minggu 3', style: style);
        break;
      case 3:
        text = Text('Minggu 4', style: style);
        break;
      default:
        throw Error();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12,
      child: text,
    );
  }
}
