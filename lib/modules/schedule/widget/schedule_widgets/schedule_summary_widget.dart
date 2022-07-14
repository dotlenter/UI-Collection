import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_collection/widget/colors/common_color.dart';

import '../../domain/entities/schedule_item_entity.dart';

class ScheduleSummaryWidget extends StatelessWidget {
  final ScheduleItemEntity schedule;
  const ScheduleSummaryWidget({Key? key, required this.schedule})
      : super(key: key);

  Color getTextColor(DateTime dateTime, String status) {
    if (dateTime.year == DateTime.now().year &&
        dateTime.month == DateTime.now().month &&
        dateTime.day == DateTime.now().day) {
      return CommonColors.neutral[0]!;
    }
    return CommonColors.neutral[500]!;
  }

  Color getTileColor(DateTime dateTime, String status) {
    if (dateTime.year == DateTime.now().year &&
        dateTime.month == DateTime.now().month &&
        dateTime.day == DateTime.now().day) {
      if (status != "Normal Shift" && status != "Rest Day") {
        return CommonColors.orange[300]!;
      }
      return CommonColors.blue[300]!;
    }
    return CommonColors.neutral[0]!;
  }

  Widget getDayWidget(DateTime dateTime, String status) {
    if (status != "Normal Shift" && status != "Rest Day") {
      return Column(
        children: [
          Text(
            dateTime.day.toString(),
            style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: getTextColor(schedule.dateTime, schedule.status)),
          ),
          Icon(
            Icons.calendar_today,
            size: 12,
            color: getTextColor(dateTime, status),
          )
        ],
      );
    }
    return Column(children: [
      Text(
        dateTime.day.toString(),
        style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: getTextColor(schedule.dateTime, schedule.status)),
      ),
      SizedBox(
        height: 12,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                DateFormat(DateFormat.ABBR_WEEKDAY)
                    .format(schedule.dateTime)
                    .toString()
                    .toUpperCase(),
                style:
                    TextStyle(color: CommonColors.neutral[500], fontSize: 12),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: CommonColors.neutral[30]!, width: 1.0),
                  color: getTileColor(schedule.dateTime, schedule.status)),
              child: Center(
                  child: getDayWidget(schedule.dateTime, schedule.status)),
            ),
          )
        ],
      ),
    );
  }
}