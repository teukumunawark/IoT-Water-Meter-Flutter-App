import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/sharef_pref_helper.dart';
import '../../domain/entities/sensor.dart';
import '../../domain/usecases/get_sensor_data.dart';

part 'sensor_event.dart';
part 'sensor_state.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  final GetSensorData getSensorEntityData;

  SensorBloc(this.getSensorEntityData) : super(SensorInitial()) {
    on<OnGetSensorEvent>(
      (event, emit) async {
        emit(SensorLoading());

        final devID = await getDevID();

        final result = await getSensorEntityData.execute(devID.toString());

        result.fold(
          (failure) => emit(SensorHasError(failure.message)),
          (data) => emit(SensorHasData(data)),
        );
      },
    );
  }
}
