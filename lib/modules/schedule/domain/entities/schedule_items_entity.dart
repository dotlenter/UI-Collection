import 'package:freezed_annotation/freezed_annotation.dart';

import 'schedule_item_entity.dart';

part 'schedule_items_entity.freezed.dart';

@freezed
class ScheduleItemsEntity with _$ScheduleItemsEntity {
  factory ScheduleItemsEntity({
    required List<ScheduleItemEntity> itemList,
  }) = _ScheduleItemsEntity;
}
