part of 'weekly_usage_bloc.dart';

sealed class WeeklyUsageEvent extends Equatable {
  const WeeklyUsageEvent();

  @override
  List<Object> get props => [];
}

final class OnWeeklyUsageEvent extends WeeklyUsageEvent {}
