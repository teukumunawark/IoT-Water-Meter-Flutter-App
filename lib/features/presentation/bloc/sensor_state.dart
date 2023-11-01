part of 'sensor_bloc.dart';

sealed class SensorState extends Equatable {
  const SensorState();

  @override
  List<Object> get props => [];
}

final class SensorInitial extends SensorState {}

final class SensorLoading extends SensorState {}

final class SensorHasData extends SensorState {
  final SensorEntity data;

  const SensorHasData(this.data);

  @override
  List<Object> get props => [data];
}

final class SensorHasError extends SensorState {
  final String error;

  const SensorHasError(this.error);

  @override
  List<Object> get props => [error];
}
