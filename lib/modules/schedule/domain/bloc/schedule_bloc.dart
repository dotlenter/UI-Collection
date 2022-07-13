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
    final monthChoice = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "November",
      "December"
    ];

    emit(const _Loading());
    await Future.delayed(const Duration(milliseconds: 100));

    List<ScheduleItemEntity> schedules = [
      ScheduleItemEntity(
          dayOfWeek: 1,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 6, 3)),
      ScheduleItemEntity(
          dayOfWeek: 2,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 6, 4)),
      ScheduleItemEntity(
          dayOfWeek: 3,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 6, 5)),
      ScheduleItemEntity(
          dayOfWeek: 4,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 6, 6)),
      ScheduleItemEntity(
          dayOfWeek: 5,
          status: "Normal Shift",
          shiftStart: "09:00 AM",
          shiftEnd: "06:00 PM",
          dateTime: DateTime(2022, 6, 7)),
    ];

    DateTime dateTime = DateTime(2022, 6);

    String monthYear = "${monthChoice[dateTime.month]} ${dateTime.year}";

    emit(_Loaded(monthYear: monthYear, schedules: schedules));
  }
}
