import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/weekly_usage/weekly_usage.dart';
import '../repositories/repository.dart';

class GetWeeklyUsageData {
  final Repository repository;

  GetWeeklyUsageData(this.repository);

  Future<Either<Failure, List<WeeklyUsage>>> execute(devID) async {
    return repository.getWeeklyUsageData(devID);
  }
}
