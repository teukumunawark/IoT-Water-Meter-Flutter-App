import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_water_meter/features/presentation/bloc/month/monthly_usage_bloc.dart';
import '../../domain/entities/sensor.dart';

import '../../../common/app_colors.dart';
import '../bloc/category_select_cubit.dart';
import '../bloc/daily/daily_usage_bloc.dart';
import '../bloc/sensor_bloc.dart';
import '../bloc/weekly/weekly_usage_bloc.dart';
import '../widgets/chart/days_chart.dart';
import '../widgets/chart/mounth_chart.dart';
import '../widgets/chart/weeks_chart.dart';
import '../widgets/circular_percent_card.dart';
import '../widgets/custon_button_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<SensorBloc>().add(OnGetSensorEvent());
      context.read<DailyUsageBloc>().add(OnDailyUsageEvent());
      context.read<WeeklyUsageBloc>().add(OnWeeklyUsageEvent());
      context.read<MonthlyUsageBloc>().add(OnMonthlyUsageEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildChart(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const DailyChart();
        case 1:
          return const WeeklyChart();
        case 2:
          return const MountChart();
        default:
          return const DailyChart();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  CategoryButton(
                    "Hari",
                    index: 0,
                  ),
                  SizedBox(width: 12),
                  CategoryButton(
                    "Minggu",
                    index: 1,
                  ),
                  SizedBox(width: 12),
                  CategoryButton(
                    "Bulan",
                    index: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            BlocBuilder<CategorySelectedCubit, int>(
              builder: (context, state) {
                return buildChart(state);
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BlocBuilder<SensorBloc, SensorState>(
                builder: (context, state) {
                  if (state is SensorHasData) {
                    final data = state.data;
                    return SensorIndicatorWidget(data: data);
                  }
                  return const SensorIndicatorWidget(data: null);
                },
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class SensorIndicatorWidget extends StatelessWidget {
  const SensorIndicatorWidget({
    super.key,
    this.data,
  });

  final SensorEntity? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircularPercentCardWidget(
              title: "Tekanan Air",
              subtitle: "Dalam satuan BAR",
              percent: data?.waterPressure != null ? 0.7 : 0,
              percentText:
                  data?.waterPressure != null ? data!.waterPressure : 0,
            ),
            const SizedBox(width: 10),
            CircularPercentCardWidget(
              title: "Aliran Air",
              subtitle: "Dalam satuan LPH",
              percent: data?.waterFlow != null ? data!.waterFlow / 100 : 0,
              percentText: data?.waterFlow != null ? data!.waterFlow : 0,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CircularPercentCardWidget(
              title: "Prediksi Air",
              subtitle: "Dalam satuan liter",
              percent: 0.0,
              percentText: 0.0,
            ),
            const SizedBox(width: 10),
            CircularPercentCardWidget(
              color: AppColors.contentColorGreen,
              title: "Battery",
              subtitle: "Dalam satuan persen",
              percent: data?.battery != null ? data!.battery / 100 : 0,
              percentText: data?.battery != null ? data!.battery.toDouble() : 0,
            ),
          ],
        ),
      ],
    );
  }
}
