import 'package:flutter/material.dart';

import '../../domain/entities/schedule_item_entity.dart';

class ScheduleItem extends StatelessWidget {
  final ScheduleItemEntity schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScheduleItemEntity schedule = this.schedule;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            child: Column(
              children: [
                Text(schedule.dayOfWeek.toString()),
                const Text("Sun")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              children: [
                Text("${schedule.shiftStart}-${schedule.shiftEnd}"),
                Text(schedule.status),
              ],
            ),
          )
        ],
      ),
    );
  }
}
