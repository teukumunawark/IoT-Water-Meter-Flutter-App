import 'package:equatable/equatable.dart';

import '../../domain/entities/sensor.dart';

class SensorModel extends Equatable {
  final int battery;
  final double waterPressure;
  final double waterFlow;

  const SensorModel({
    required this.battery,
    required this.waterPressure,
    required this.waterFlow,
  });

  factory SensorModel.fromJson(Map<String, dynamic> json) {
    return SensorModel(
      battery: json['battery'],
      waterPressure: json['waterPressure'],
      waterFlow: json['waterFlow'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'battery': battery,
      'waterPressure': waterPressure,
      'waterFlow': waterFlow,
    };
  }

  SensorEntity toEntity() {
    return SensorEntity(
      battery: battery,
      waterPressure: waterPressure,
      waterFlow: waterFlow,
    );
  }

  @override
  List<Object?> get props => [
        battery,
        waterPressure,
        waterFlow,
      ];
}
