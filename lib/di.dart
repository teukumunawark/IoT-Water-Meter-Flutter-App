import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iot_water_meter/features/domain/usecases/get_monthly_usage_data.dart';
import 'package:iot_water_meter/features/presentation/bloc/month/monthly_usage_bloc.dart';

import 'features/data/datasources/remote_data_source.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/domain/usecases/get_daily_usage_data.dart';
import 'features/domain/usecases/get_sensor_data.dart';
import 'features/domain/usecases/get_weekly_usage_data.dart';
import 'features/presentation/bloc/category_select_cubit.dart';
import 'features/presentation/bloc/daily/daily_usage_bloc.dart';
import 'features/presentation/bloc/sensor_bloc.dart';
import 'features/presentation/bloc/weekly/weekly_usage_bloc.dart';

GetIt locator = GetIt.I;

Future<void> init() async {
  // BLOC
  locator.registerFactory(() => SensorBloc(locator()));
  locator.registerFactory(() => CategorySelectedCubit());
  locator.registerFactory(() => DailyUsageBloc(locator()));
  locator.registerFactory(() => WeeklyUsageBloc(locator()));
  locator.registerFactory(() => MonthlyUsageBloc(locator()));

  // USE CASE
  locator.registerLazySingleton(() => GetSensorData(locator()));
  locator.registerLazySingleton(() => GetDailyUsageData(locator()));
  locator.registerLazySingleton(() => GetWeeklyUsageData(locator()));
  locator.registerLazySingleton(() => GetMonthlyUsageData(locator()));

  // REPOSITORY INJECTION
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: locator()),
  );

  // DATA SOURCE INJECTION
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: locator()),
  );

  // EXTERNAL
  locator.registerLazySingleton(() => Dio());
}
