import 'package:ui_collection/modules/schedule/domain/entities/schedule_item_entity.dart';

class ScheduleMockedEntities {
  static List<ScheduleItemEntity> getItems() => [
        ScheduleItemEntity(
            status: "Rest Day",
            shiftStart: "--:-- --",
            shiftEnd: "--:-- --",
            dateTime: DateTime(2022, 7, 10)),
        ScheduleItemEntity(
            status: "Schedule Adjusted",
            shiftStart: "09:30 AM",
            shiftEnd: "06:30 PM",
            dateTime: DateTime(2022, 7, 11)),
        ScheduleItemEntity(
            status: "Normal Shift",
            shiftStart: "09:00 AM",
            shiftEnd: "06:00 PM",
            dateTime: DateTime(2022, 7, 12)),
        ScheduleItemEntity(
            status: "Normal Shift",
            shiftStart: "09:00 AM",
            shiftEnd: "06:00 PM",
            dateTime: DateTime(2022, 7, 13)),
        ScheduleItemEntity(
            status: "Normal Shift",
            shiftStart: "09:00 AM",
            shiftEnd: "06:00 PM",
            dateTime: DateTime(2022, 7, 14)),
        ScheduleItemEntity(
            status: "Normal Shift",
            shiftStart: "09:00 AM",
            shiftEnd: "06:00 PM",
            dateTime: DateTime(2022, 7, 15)),
        ScheduleItemEntity(
            status: "Rest Day",
            shiftStart: "--:-- --",
            shiftEnd: "--:-- --",
            dateTime: DateTime(2022, 7, 16)),
      ];
}
