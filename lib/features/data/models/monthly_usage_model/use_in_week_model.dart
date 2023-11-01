import 'package:equatable/equatable.dart';

import '../../../domain/entities/monthly_usage/usage_in_week.dart';

class UsageInWeekModel extends Equatable {
  final double? minggu1;
  final double? minggu2;
  final double? minggu3;
  final double? minggu4;

  const UsageInWeekModel({
    this.minggu1,
    this.minggu2,
    this.minggu3,
    this.minggu4,
  });

  factory UsageInWeekModel.fromJson(Map<String, dynamic> json) {
    return UsageInWeekModel(
      minggu1: (json['Minggu 1'] as num?)?.toDouble(),
      minggu2: (json['Minggu 2'] as num?)?.toDouble(),
      minggu3: (json['Minggu 3'] as num?)?.toDouble(),
      minggu4: (json['Minggu 4'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Minggu 1': minggu1,
        'Minggu 2': minggu2,
        'Minggu 3': minggu3,
        'Minggu 4': minggu4,
      };

  UsageInWeek toEntity() => UsageInWeek(
        minggu1: minggu1,
        minggu2: minggu2,
        minggu3: minggu3,
        minggu4: minggu4,
      );

  @override
  List<Object?> get props => [minggu1, minggu2, minggu3, minggu4];
}
