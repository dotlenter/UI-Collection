import 'package:flutter/material.dart';
import 'package:ui_collection/modules/schedule/domain/entities/schedule_item_entity.dart';

class ScheduleMockedEntities {
  static List<ScheduleItemEntity> getItems(BuildContext context) => [
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
  static DateTime getDateTime(BuildContext context) => DateTime(2022, 7);
}
