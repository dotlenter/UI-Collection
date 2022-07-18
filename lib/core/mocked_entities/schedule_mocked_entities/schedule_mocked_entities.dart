import 'package:flutter/material.dart';

import '../../../modules/schedule/domain/entities/schedule_item_entity.dart';

class ScheduleMockedEntities {
  static List<ScheduleItemEntity> mockWeek = [
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 3)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 4)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 5)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 6)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 7)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 8)),
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 9)),
  ];

  static List<ScheduleItemEntity> items = [
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 3)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 4)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 5)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 6)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 7)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 8)),
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 9)),
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
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
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
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 17)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 18)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 19)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 20)),
    ScheduleItemEntity(
        status: "Schedule Adjusted",
        shiftStart: "09:30 AM",
        shiftEnd: "06:30 PM",
        dateTime: DateTime(2022, 7, 21)),
    ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "09:00 AM",
        shiftEnd: "06:00 PM",
        dateTime: DateTime(2022, 7, 22)),
    ScheduleItemEntity(
        status: "Rest Day",
        shiftStart: "--:-- --",
        shiftEnd: "--:-- --",
        dateTime: DateTime(2022, 7, 23)),
  ];

  static ScheduleItemEntity getDefaultSchedule(DateTime date) {
    if ([6, 7].contains(date.weekday)) {
      return ScheduleItemEntity(
          status: "Rest Day",
          shiftStart: "--:-- --",
          shiftEnd: "--:-- --",
          dateTime: date);
    }
    return ScheduleItemEntity(
        status: "Normal Shift",
        shiftStart: "9:00 AM",
        shiftEnd: "6:00 PM",
        dateTime: date);
  }

  static List<ScheduleItemEntity> getItems(DateTime currDate) {
    int weekday = currDate.weekday;
    DateTime firstDay = currDate.subtract(Duration(days: weekday));

    List<ScheduleItemEntity> week = [];
    DateTime temp = DateUtils.dateOnly(firstDay);
    for (int i = 0; i < 7; i++) {
      week.add(items.singleWhere((element) => element.dateTime == temp,
          orElse: () => getDefaultSchedule(temp)));
      temp = temp.add(Duration(days: 1));
    }
    return week;
  }
}
