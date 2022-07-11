import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_item_entity.freezed.dart';

@freezed
class ScheduleItemEntity with _$ScheduleItemEntity {
  factory ScheduleItemEntity({
    required int dayOfWeek,
    required String status,
    required String shiftStart,
    required String shiftEnd,
    required DateTime dateTime,
  }) = _ScheduleItemEntity;
}
