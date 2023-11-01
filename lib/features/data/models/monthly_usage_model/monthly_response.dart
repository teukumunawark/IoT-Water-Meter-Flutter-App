import 'package:equatable/equatable.dart';

import 'monthly_usage_model.dart';

class MonthlyResponse extends Equatable {
  final List<MonthlyUsageModel> monthlyUsage;

  const MonthlyResponse({required this.monthlyUsage});

  factory MonthlyResponse.fromJson(List<dynamic> json) {
    final List<MonthlyUsageModel> monthlyUsage = json
        .map((dynamic item) =>
            MonthlyUsageModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return MonthlyResponse(monthlyUsage: monthlyUsage);
  }

  @override
  List<Object?> get props => [monthlyUsage];
}
