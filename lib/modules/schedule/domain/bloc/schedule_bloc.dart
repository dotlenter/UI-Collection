import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/mocked_entities/schedule_mocked_entities/schedule_mocked_entities.dart';
import '../entities/schedule_item_entity.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(_Initial()) {
    on<ScheduleEvent>(
      (event, emit) => event.when(
        load: (DateTime? currDate) {
          return _handleLoad(emit, currDate);
        },
      ),
    );
  }

  Future<FutureOr<void>> _handleLoad(
      Emitter<ScheduleState> emit, DateTime? currDate) async {
    emit(const _Loading());
    await Future.delayed(const Duration(milliseconds: 1000));

    DateTime thisDate = currDate ?? DateTime.now();

    List<ScheduleItemEntity> schedules =
        ScheduleMockedEntities.getItems(thisDate);

    emit(
      _Loaded(
          monthYear: monthYear(schedules),
          currDate: thisDate,
          schedules: schedules),
    );
  }
}

String monthYear(List<ScheduleItemEntity> schedules) {
  if (schedules.first.dateTime.month != schedules.last.dateTime.month) {
    return "${DateFormat(DateFormat.MONTH).format(schedules.first.dateTime)} - ${DateFormat(DateFormat.MONTH).format(schedules.last.dateTime)} ${schedules.first.dateTime.year}";
  }
  return "${DateFormat(DateFormat.MONTH).format(schedules.first.dateTime)} ${schedules.first.dateTime.year}";
}
