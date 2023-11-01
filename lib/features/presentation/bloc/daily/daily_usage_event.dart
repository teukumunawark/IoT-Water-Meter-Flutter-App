part of 'daily_usage_bloc.dart';

sealed class DailyUsageEvent extends Equatable {
  const DailyUsageEvent();

  @override
  List<Object> get props => [];
}

final class OnDailyUsageEvent extends DailyUsageEvent {}
