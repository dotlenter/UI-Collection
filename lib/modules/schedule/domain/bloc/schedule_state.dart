part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.incremented({
    required int count,
  }) = _Incremented;
  const factory ScheduleState.loaded({
    required DateTime monthYear,
    required List<ScheduleItemEntity> schedules,
  }) = _Loaded;
}
