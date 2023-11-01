import 'package:equatable/equatable.dart';

import '../../../domain/entities/daily_usage/daily_usage.dart';
import 'hourly_usage_model.dart';

class DailyUsageModel extends Equatable {
  final String? hari;
  final HourlyUsageModel? penggunaanPerJam;
  final double? totalHarian;

  const DailyUsageModel({this.hari, this.penggunaanPerJam, this.totalHarian});

  factory DailyUsageModel.fromJson(Map<String, dynamic> json) =>
      DailyUsageModel(
        hari: json['hari'] as String?,
        penggunaanPerJam: json['penggunaan_per_jam'] == null
            ? null
            : HourlyUsageModel.fromJson(
                json['penggunaan_per_jam'] as Map<String, dynamic>),
        totalHarian: (json['total_harian'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'hari': hari,
        'penggunaan_per_jam': penggunaanPerJam?.toJson(),
        'total_harian': totalHarian,
      };

  DailyUsage toEntity() => DailyUsage(
        hari: hari,
        penggunaanPerJam: penggunaanPerJam?.toEntity(),
        totalHarian: totalHarian,
      );

  @override
  List<Object?> get props => [hari, penggunaanPerJam, totalHarian];
}
