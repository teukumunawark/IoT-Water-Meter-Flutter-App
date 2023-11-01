import 'package:equatable/equatable.dart';

import 'hourly_usage.dart';

class DailyUsage extends Equatable {
  final String? hari;
  final UsageInHour? penggunaanPerJam;
  final double? totalHarian;

  const DailyUsage({
    this.hari,
    this.penggunaanPerJam,
    this.totalHarian,
  });

  @override
  List<Object?> get props => [
        hari,
        penggunaanPerJam,
        totalHarian,
      ];
}
