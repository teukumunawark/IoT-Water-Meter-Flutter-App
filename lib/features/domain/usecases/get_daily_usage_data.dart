import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/daily_usage/daily_usage.dart';
import '../repositories/repository.dart';

class GetDailyUsageData {
  final Repository repository;

  GetDailyUsageData(this.repository);

  Future<Either<Failure, List<DailyUsage>>> execute(String devID) async {
    return repository.getDailyUsageData(devID);
  }
}
