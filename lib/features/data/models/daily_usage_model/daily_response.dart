import 'package:equatable/equatable.dart';

import 'daily_usage_model.dart';

class DailyResponse extends Equatable {
  final List<DailyUsageModel> dailyUsages;

  const DailyResponse({required this.dailyUsages});

  factory DailyResponse.fromJson(List<dynamic> json) {
    final List<DailyUsageModel> dailyUsages = json
        .map((dynamic item) => DailyUsageModel.fromJson(
              item as Map<String, dynamic>,
            ))
        .toList();

    return DailyResponse(dailyUsages: dailyUsages);
  }

  @override
  List<Object?> get props => [dailyUsages];
}
