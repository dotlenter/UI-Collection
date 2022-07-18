import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_item_entity_test.freezed.dart';

@freezed
class ScheduleItemEntity with _$ScheduleItemEntity {
  factory ScheduleItemEntity({
    required String
        status, //NOTE FOR REPO: si status ay yung string version ng ScheduleType
    required String shiftStart,
    required String shiftEnd,
    required DateTime dateTime,
  }) = _ScheduleItemEntity;
}
