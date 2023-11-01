part of 'sensor_bloc.dart';

sealed class SensorEvent extends Equatable {
  const SensorEvent();

  @override
  List<Object> get props => [];
}

class OnGetSensorEvent extends SensorEvent {}
