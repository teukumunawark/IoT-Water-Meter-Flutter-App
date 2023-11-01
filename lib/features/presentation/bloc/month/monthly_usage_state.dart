part of 'monthly_usage_bloc.dart';

sealed class MonthlyUsageState extends Equatable {
  const MonthlyUsageState();

  @override
  List<Object> get props => [];
}

final class MonthlyUsageInitial extends MonthlyUsageState {}

final class MonthlyUsageLoading extends MonthlyUsageState {}

final class MonthlyUsageError extends MonthlyUsageState {
  final String message;

  const MonthlyUsageError(this.message);

  @override
  List<Object> get props => [message];
}

class MonthlyUsageHasData extends MonthlyUsageState {
  final List<MonthlyUsage> monthly;

  const MonthlyUsageHasData(this.monthly);

  @override
  List<Object> get props => [monthly];
}
