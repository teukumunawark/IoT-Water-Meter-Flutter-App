import 'package:equatable/equatable.dart';

import 'usage_in_day.dart';

class WeeklyUsage extends Equatable {
  final String? minggu;
  final UsageInDay? penggunaanPerHari;
  final double? totalMingguan;

  const WeeklyUsage({
    this.minggu,
    this.penggunaanPerHari,
    this.totalMingguan,
  });

  @override
  List<Object?> get props => [minggu, penggunaanPerHari, totalMingguan];
}
