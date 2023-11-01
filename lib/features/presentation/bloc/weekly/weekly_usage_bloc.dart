import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/sharef_pref_helper.dart';
import '../../../domain/entities/weekly_usage/weekly_usage.dart';
import '../../../domain/usecases/get_weekly_usage_data.dart';

part 'weekly_usage_event.dart';
part 'weekly_usage_state.dart';

class WeeklyUsageBloc extends Bloc<WeeklyUsageEvent, WeeklyUsageState> {
  final GetWeeklyUsageData _getWeeklyUsageData;

  WeeklyUsageBloc(this._getWeeklyUsageData) : super(WeeklyUsageInitial()) {
    on<WeeklyUsageEvent>((event, emit) async {
      emit(WeeklyUsageLoading());

      final devID = await getDevID();

      final result = await _getWeeklyUsageData.execute(devID.toString());

      result.fold(
        (failure) => emit(WeeklyUsageError(failure.message)),
        (data) => emit(WeeklyUsageHasData(data)),
      );
    });
  }
}
