import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/sensor.dart';
import '../repositories/repository.dart';

class GetSensorData {
  final Repository repository;

  GetSensorData(this.repository);

  Future<Either<Failure, SensorEntity>> execute(devID) async {
    return repository.getSensorData(devID);
  }
}
