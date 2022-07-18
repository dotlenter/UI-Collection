import 'package:freezed_annotation/freezed_annotation.dart';

import 'schedule_item_entity_test.dart';

part 'schedule_items_entity_test.freezed.dart';

@freezed
class ScheduleItemsEntity with _$ScheduleItemsEntity {
  factory ScheduleItemsEntity({
    required List<ScheduleItemEntity> itemList,
  }) = _ScheduleItemsEntity;
}
