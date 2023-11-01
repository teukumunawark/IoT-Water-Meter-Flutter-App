import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/sharef_pref_helper.dart';
import '../../../domain/entities/daily_usage/daily_usage.dart';
import '../../../domain/usecases/get_daily_usage_data.dart';

part 'daily_usage_event.dart';
part 'daily_usage_state.dart';

class DailyUsageBloc extends Bloc<DailyUsageEvent, DailyUsageState> {
  final GetDailyUsageData _getDailyUsageData;

  DailyUsageBloc(this._getDailyUsageData) : super(DailyUsageInitial()) {
    on<DailyUsageEvent>((event, emit) async {
      emit(DailyUsageLoading());
      final devID = await getDevID();

      final result = await _getDailyUsageData.execute(devID.toString());

      result.fold(
        (failure) => emit(DailyUsageError(failure.message)),
        (data) => emit(DailyUsageHasData(data)),
      );
    });
  }
}
