part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.load(
      {required DateTime monthYear,
      required List<ScheduleItemEntity> schedules}) = _Load;
}
