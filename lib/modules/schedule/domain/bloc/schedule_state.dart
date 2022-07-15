part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loading() = _Loading;
  const factory ScheduleState.loaded({
    required String monthYear,
    required DateTime currDate,
    required List<ScheduleItemEntity> schedules,
  }) = _Loaded;
}
