import 'package:equatable/equatable.dart';

import 'weekly_usage_model.dart';

class WeeklyResponse extends Equatable {
  final List<WeeklyUsageModel> weeklyUse;

  const WeeklyResponse({required this.weeklyUse});

  factory WeeklyResponse.fromJson(List<dynamic> json) {
    final List<WeeklyUsageModel> weeklyUse = json
        .map((dynamic item) => WeeklyUsageModel.fromJson(
              item as Map<String, dynamic>,
            ))
        .toList();

    return WeeklyResponse(weeklyUse: weeklyUse);
  }

  @override
  List<Object?> get props => [weeklyUse];
}
