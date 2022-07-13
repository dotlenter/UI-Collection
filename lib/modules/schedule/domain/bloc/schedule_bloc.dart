import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:ui_collection/core/mocked_entities/schedule_mocked_entities/schedule_mocked_entities.dart';

import '../entities/schedule_item_entity.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(_Initial()) {
    on<ScheduleEvent>(
      (event, emit) => event.when(
        load: () {
          return _handleLoad(emit);
        },
      ),
    );
  }

  Future<FutureOr<void>> _handleLoad(Emitter<ScheduleState> emit) async {
    emit(const _Loading());
    await Future.delayed(const Duration(milliseconds: 100));

    List<ScheduleItemEntity> schedules = ScheduleMockedEntities.getItems();

    String monthYear() {
      if (schedules.first.dateTime.month != schedules.last.dateTime.month) {
        return "${DateFormat(DateFormat.MONTH).format(schedules.first.dateTime)} - ${DateFormat(DateFormat.MONTH).format(schedules.last.dateTime)} ${schedules.first.dateTime.year}";
      }
      return "${DateFormat(DateFormat.MONTH).format(schedules.first.dateTime)} ${schedules.first.dateTime.year}";
    }

    emit(_Loaded(monthYear: monthYear(), schedules: schedules));
  }
}
