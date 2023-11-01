import 'package:equatable/equatable.dart';

class SensorEntity extends Equatable {
  final int battery;
  final double waterPressure;
  final double waterFlow;

  const SensorEntity({
    required this.battery,
    required this.waterPressure,
    required this.waterFlow,
  });

  @override
  List<Object?> get props => [
        battery,
        waterPressure,
        waterFlow,
      ];
}
