part of 'daily_usage_bloc.dart';

sealed class DailyUsageState extends Equatable {
  const DailyUsageState();

  @override
  List<Object> get props => [];
}

final class DailyUsageInitial extends DailyUsageState {}

final class DailyUsageLoading extends DailyUsageState {}

final class DailyUsageError extends DailyUsageState {
  final String message;

  const DailyUsageError(this.message);

  @override
  List<Object> get props => [message];
}

class DailyUsageHasData extends DailyUsageState {
  final List<DailyUsage> daily;

  const DailyUsageHasData(this.daily);

  @override
  List<Object> get props => [daily];
}
