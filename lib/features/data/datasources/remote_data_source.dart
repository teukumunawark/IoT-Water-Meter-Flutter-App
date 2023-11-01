import 'package:dio/dio.dart';
import 'package:iot_water_meter/features/data/models/monthly_usage_model/monthly_usage_model.dart';

import '../../../core/error/exceptions.dart';
import '../models/daily_usage_model/daily_response.dart';
import '../models/daily_usage_model/daily_usage_model.dart';
import '../models/monthly_usage_model/monthly_response.dart';
import '../models/sensor_model.dart';
import '../models/weekly_usage_model/weekly_response.dart';
import '../models/weekly_usage_model/weekly_usage_model.dart';

const apiURL = 'https://wmapi-6mrfpxpf3q-et.a.run.app/wm-data';

abstract class RemoteDataSource {
  Future<SensorModel> getSensorData(String devID);
  Future<List<DailyUsageModel>> getDailyUsage(String devID);
  Future<List<WeeklyUsageModel>> getWeeklyUsage(String devID);
  Future<List<MonthlyUsageModel>> getMonthlyUsage(String devID);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<SensorModel> getSensorData(devID) async {
    final Response response = await dio.get("$apiURL/$devID/latest");

    if (response.statusCode == 200) {
      return SensorModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DailyUsageModel>> getDailyUsage(devID) async {
    final Response response = await dio.get("$apiURL/$devID/usage/daily");

    if (response.statusCode == 200) {
      return DailyResponse.fromJson(response.data).dailyUsages;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WeeklyUsageModel>> getWeeklyUsage(devID) async {
    final Response response = await dio.get("$apiURL/$devID/usage/weekly");

    if (response.statusCode == 200) {
      return WeeklyResponse.fromJson(response.data).weeklyUse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MonthlyUsageModel>> getMonthlyUsage(devID) async {
    final Response response = await dio.get("$apiURL/$devID/usage/monthly");

    print(response.data);

    if (response.statusCode == 200) {
      return MonthlyResponse.fromJson(response.data).monthlyUsage;
    } else {
      throw ServerException();
    }
  }
}
