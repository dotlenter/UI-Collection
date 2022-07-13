import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_collection/widget/colors/common_color.dart';

import '../../domain/entities/schedule_item_entity.dart';

class ScheduleItem extends StatelessWidget {
  final ScheduleItemEntity schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  getItemColor(DateTime dateTime, String status) {
    if (status != "Normal Shift" && status != "Rest Day") {
      return CommonColors.orange[300];
    }
    if (dateTime.year == DateTime.now().year &&
        dateTime.month == DateTime.now().month &&
        dateTime.day == DateTime.now().day) {
      return CommonColors.blue[300];
    }
    return CommonColors.neutral[500];
  }

  getStatusDisplay(String status) {
    if (status != "Normal Shift" && status != "Rest Day") {
      return Row(
        children: [
          Icon(
            Icons.calendar_today,
            size: 10,
          ),
          Text(
            status,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: CommonColors.neutral[300]),
          )
        ],
      );
    }
    return Text(schedule.status,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: CommonColors.neutral[300]));
  }

  @override
  Widget build(BuildContext context) {
    ScheduleItemEntity schedule = this.schedule;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 68,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            child: Column(
              children: [
                Text(
                  schedule.dateTime.day.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: getItemColor(schedule.dateTime, schedule.status)),
                ),
                Text(
                    DateFormat(DateFormat.ABBR_WEEKDAY)
                        .format(schedule.dateTime)
                        .toString()
                        .toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                        color:
                            getItemColor(schedule.dateTime, schedule.status)))
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${schedule.shiftStart} - ${schedule.shiftEnd}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: (CommonColors.neutral[700]))),
                getStatusDisplay(schedule.status),
              ],
            ),
          )
        ],
      ),
    );
  }
}
