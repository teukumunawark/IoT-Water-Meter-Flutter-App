import 'package:equatable/equatable.dart';

import 'usage_in_week.dart';

class MonthlyUsage extends Equatable {
  final String? bulan;
  final UsageInWeek? usageInWeek;
  final double? totalBulanan;

  const MonthlyUsage({
    this.bulan,
    this.usageInWeek,
    this.totalBulanan,
  });

  @override
  List<Object?> get props => [bulan, usageInWeek, totalBulanan];
}
