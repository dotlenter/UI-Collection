import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../widget/colors/common_color.dart';
import '../../domain/entities/schedule_item_entity.dart';

class ScheduleSummaryWidget extends StatelessWidget {
  final ScheduleItemEntity schedule;
  const ScheduleSummaryWidget({Key? key, required this.schedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              DateFormat(DateFormat.ABBR_WEEKDAY)
                  .format(schedule.dateTime)
                  .toString()
                  .toUpperCase(),
              style: TextStyle(color: CommonColors.neutral[500], fontSize: 12),
            ),
          ),
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
                border:
                    Border.all(color: CommonColors.neutral[30]!, width: 1.0),
                color: _getTileColor(schedule.dateTime, schedule.status)),
            child: Center(
                child: _getDayWidget(schedule.dateTime, schedule.status)),
          )
        ],
      ),
    );
  }

  Color _getTextColor(DateTime dateTime, String status) {
    if (_ifToday(dateTime)) {
      return CommonColors.neutral[0]!;
    }
    return CommonColors.neutral[500]!;
  }

  Color _getTileColor(DateTime dateTime, String status) {
    if (status != "Normal Shift" &&
        status != "Rest Day" &&
        _ifToday(dateTime)) {
      return CommonColors.orange[300]!;
    }
    if (_ifToday(dateTime)) {
      return CommonColors.blue[300]!;
    }
    if ([6, 7].contains(dateTime.weekday)) return CommonColors.neutral[10]!;
    return CommonColors.neutral[0]!;
  }

  Widget _getDayWidget(DateTime dateTime, String status) {
    if (status != "Normal Shift" && status != "Rest Day") {
      return Column(
        children: [
          Text(
            dateTime.day.toString(),
            style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: _getTextColor(schedule.dateTime, schedule.status)),
          ),
          Icon(
            Icons.calendar_today,
            size: 12,
            color: _getTextColor(dateTime, status),
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
            color: _getTextColor(schedule.dateTime, schedule.status)),
      ),
      SizedBox(
        height: 12,
      )
    ]);
  }

  bool _ifToday(DateTime dateTime) => (dateTime.year == DateTime.now().year &&
      dateTime.month == DateTime.now().month &&
      dateTime.day == DateTime.now().day);
}
