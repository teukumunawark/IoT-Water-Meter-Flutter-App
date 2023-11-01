import 'package:equatable/equatable.dart';

import '../../../domain/entities/weekly_usage/weekly_usage.dart';
import 'daily_use_model.dart';

class WeeklyUsageModel extends Equatable {
  final String? minggu;
  final DailyUseModel? penggunaanPerHari;
  final double? totalMingguan;

  const WeeklyUsageModel({
    this.minggu,
    this.penggunaanPerHari,
    this.totalMingguan,
  });

  factory WeeklyUsageModel.fromJson(Map<String, dynamic> json) {
    return WeeklyUsageModel(
      minggu: json['minggu'] as String?,
      penggunaanPerHari: json['penggunaan_per_hari'] == null
          ? null
          : DailyUseModel.fromJson(
              json['penggunaan_per_hari'] as Map<String, dynamic>),
      totalMingguan: (json['total_mingguan'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'minggu': minggu,
        'penggunaan_per_hari': penggunaanPerHari?.toJson(),
        'total_mingguan': totalMingguan,
      };

  WeeklyUsage toEntity() => WeeklyUsage(
        minggu: minggu,
        penggunaanPerHari: penggunaanPerHari?.toEntity(),
        totalMingguan: totalMingguan,
      );

  @override
  List<Object?> get props => [minggu, penggunaanPerHari, totalMingguan];
}
