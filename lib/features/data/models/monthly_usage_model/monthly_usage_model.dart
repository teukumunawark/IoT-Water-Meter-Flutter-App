import 'package:equatable/equatable.dart';

import '../../../domain/entities/monthly_usage/monthly_usage.dart';
import 'use_in_week_model.dart';

class MonthlyUsageModel extends Equatable {
  final String? bulan;
  final UsageInWeekModel? usageInWeek;
  final double? totalBulanan;

  const MonthlyUsageModel({
    this.bulan,
    this.usageInWeek,
    this.totalBulanan,
  });

  factory MonthlyUsageModel.fromJson(Map<String, dynamic> json) {
    return MonthlyUsageModel(
      bulan: json['bulan'] as String?,
      usageInWeek: json['penggunaan_per_minggu'] == null
          ? null
          : UsageInWeekModel.fromJson(
              json['penggunaan_per_minggu'] as Map<String, dynamic>),
      totalBulanan: (json['total_bulanan'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'bulan': bulan,
        'penggunaan_per_minggu': usageInWeek?.toJson(),
        'total_bulanan': totalBulanan,
      };

  MonthlyUsage toEntity() => MonthlyUsage(
        bulan: bulan,
        usageInWeek: usageInWeek?.toEntity(),
        totalBulanan: totalBulanan,
      );

  @override
  List<Object?> get props => [bulan, usageInWeek, totalBulanan];
}
