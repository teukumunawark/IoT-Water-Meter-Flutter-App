import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iot_water_meter/features/domain/entities/monthly_usage/monthly_usage.dart';
import 'package:iot_water_meter/features/domain/usecases/get_monthly_usage_data.dart';

import '../../../../common/sharef_pref_helper.dart';

part 'monthly_usage_event.dart';
part 'monthly_usage_state.dart';

class MonthlyUsageBloc extends Bloc<MonthlyUsageEvent, MonthlyUsageState> {
  final GetMonthlyUsageData _getMonthlyUsageData;

  MonthlyUsageBloc(this._getMonthlyUsageData) : super(MonthlyUsageInitial()) {
    on<MonthlyUsageEvent>((event, emit) async {
      emit(MonthlyUsageLoading());

      final devID = await getDevID();

      final result = await _getMonthlyUsageData.execute(devID.toString());

      result.fold(
        (failure) => emit(MonthlyUsageError(failure.message)),
        (data) {
          print(data);
          emit(MonthlyUsageHasData(data));
        },
      );
    });
  }
}
