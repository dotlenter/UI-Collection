import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
      ),
    );
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
