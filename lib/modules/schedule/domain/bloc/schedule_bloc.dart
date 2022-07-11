import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../entities/schedule_item_entity.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(const _Initial()) {
    on<ScheduleEvent>(
      (event, emit) => event.when(
        increment: (value) => _handleIncrement(
          emit,
          value,
        ),
        load: (DateTime monthYear, List<ScheduleItemEntity> schedules) {
          return null;
        },
      ),
    );
  }

  FutureOr<void> _handleLoad(
    Emitter<ScheduleState> emit,
    DateTime monthYear,
    List<ScheduleItemEntity> schedules,
  ) {
    emit(const ScheduleState.initial());

    schedules = [
      ScheduleItemEntity(
          dayOfWeek: 1,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 7, 3)),
      ScheduleItemEntity(
          dayOfWeek: 2,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 7, 4)),
      ScheduleItemEntity(
          dayOfWeek: 3,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 7, 5)),
      ScheduleItemEntity(
          dayOfWeek: 4,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 7, 6)),
      ScheduleItemEntity(
          dayOfWeek: 5,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 7, 7)),
    ];

    emit(ScheduleState.loaded(monthYear: monthYear, schedules: schedules));
  }

  FutureOr<void> _handleIncrement(
    Emitter<ScheduleState> emit,
    int value,
  ) {
    emit(const ScheduleState.initial());

    value += 1;

    emit(ScheduleState.incremented(
      count: value,
    ));
  }
}
