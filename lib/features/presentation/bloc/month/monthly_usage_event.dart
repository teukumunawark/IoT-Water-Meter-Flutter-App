part of 'monthly_usage_bloc.dart';

sealed class MonthlyUsageEvent extends Equatable {
  const MonthlyUsageEvent();

  @override
  List<Object> get props => [];
}

final class OnMonthlyUsageEvent extends MonthlyUsageEvent {}
