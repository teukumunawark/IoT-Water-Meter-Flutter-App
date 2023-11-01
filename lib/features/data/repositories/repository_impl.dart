import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/daily_usage/daily_usage.dart';
import '../../domain/entities/monthly_usage/monthly_usage.dart';
import '../../domain/entities/sensor.dart';
import '../../domain/entities/weekly_usage/weekly_usage.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SensorEntity>> getSensorData(devID) async {
    try {
      final results = await remoteDataSource.getSensorData(devID);
      return Right(results.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DailyUsage>>> getDailyUsageData(devID) async {
    try {
      final results = await remoteDataSource.getDailyUsage(devID);
      return Right(results.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WeeklyUsage>>> getWeeklyUsageData(devID) async {
    try {
      final results = await remoteDataSource.getWeeklyUsage(devID);
      return Right(results.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MonthlyUsage>>> getMonthlyUsage(devID) async {
    try {
      final results = await remoteDataSource.getMonthlyUsage(devID);
      return Right(results.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
