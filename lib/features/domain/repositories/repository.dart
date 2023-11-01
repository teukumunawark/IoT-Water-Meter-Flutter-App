import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/daily_usage/daily_usage.dart';
import '../entities/monthly_usage/monthly_usage.dart';
import '../entities/sensor.dart';
import '../entities/weekly_usage/weekly_usage.dart';

abstract class Repository {
  Future<Either<Failure, SensorEntity>> getSensorData(devID);
  Future<Either<Failure, List<DailyUsage>>> getDailyUsageData(devID);
  Future<Either<Failure, List<WeeklyUsage>>> getWeeklyUsageData(devID);
  Future<Either<Failure, List<MonthlyUsage>>> getMonthlyUsage(devID);
}
