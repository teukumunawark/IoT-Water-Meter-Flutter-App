part of 'weekly_usage_bloc.dart';

sealed class WeeklyUsageState extends Equatable {
  const WeeklyUsageState();

  @override
  List<Object> get props => [];
}

final class WeeklyUsageInitial extends WeeklyUsageState {}

final class WeeklyUsageLoading extends WeeklyUsageState {}

final class WeeklyUsageError extends WeeklyUsageState {
  final String message;

  const WeeklyUsageError(this.message);

  @override
  List<Object> get props => [message];
}

class WeeklyUsageHasData extends WeeklyUsageState {
  final List<WeeklyUsage> weekly;

  const WeeklyUsageHasData(this.weekly);

  @override
  List<Object> get props => [weekly];
}
