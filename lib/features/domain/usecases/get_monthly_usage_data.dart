import 'package:dartz/dartz.dart';
import 'package:iot_water_meter/features/domain/entities/monthly_usage/monthly_usage.dart';

import '../../../core/error/failures.dart';
import '../repositories/repository.dart';

class GetMonthlyUsageData {
  final Repository repository;

  GetMonthlyUsageData(this.repository);

  Future<Either<Failure, List<MonthlyUsage>>> execute(devID) async {
    return repository.getMonthlyUsage(devID);
  }
}
