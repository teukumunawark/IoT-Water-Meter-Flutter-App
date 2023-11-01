import 'package:equatable/equatable.dart';

import '../../../domain/entities/weekly_usage/usage_in_day.dart';

class DailyUseModel extends Equatable {
  final double? hari1;
  final double? hari2;
  final double? hari3;
  final double? hari4;
  final double? hari5;
  final double? hari6;
  final double? hari7;

  const DailyUseModel({
    this.hari1,
    this.hari2,
    this.hari3,
    this.hari4,
    this.hari5,
    this.hari6,
    this.hari7,
  });

  factory DailyUseModel.fromJson(Map<String, dynamic> json) {
    return DailyUseModel(
      hari1: (json['Hari 1'] as num?)?.toDouble(),
      hari2: (json['Hari 2'] as num?)?.toDouble(),
      hari3: (json['Hari 3'] as num?)?.toDouble(),
      hari4: (json['Hari 4'] as num?)?.toDouble(),
      hari5: (json['Hari 5'] as num?)?.toDouble(),
      hari6: (json['Hari 6'] as num?)?.toDouble(),
      hari7: (json['Hari 7'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Hari 1': hari1,
        'Hari 2': hari2,
        'Hari 3': hari3,
        'Hari 4': hari4,
        'Hari 5': hari5,
        'Hari 6': hari6,
        'Hari 7': hari7,
      };

  UsageInDay toEntity() => UsageInDay(
        hari1: hari1,
        hari2: hari2,
        hari3: hari3,
        hari4: hari4,
        hari5: hari5,
        hari6: hari6,
        hari7: hari7,
      );

  @override
  List<Object?> get props {
    return [
      hari1,
      hari2,
      hari3,
      hari4,
      hari5,
      hari6,
      hari7,
    ];
  }
}
