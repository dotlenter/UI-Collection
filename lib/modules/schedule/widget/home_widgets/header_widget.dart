import 'package:flutter/material.dart';
import 'package:ui_collection/modules/schedule/domain/entities/schedule_item_entity.dart';

import 'home_user_details_widget.dart';

class HeaderWidget extends StatelessWidget {
  final ScheduleItemEntity schedule;

  const HeaderWidget({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          HomeUserDetailsWidget(
            firstName: 'Mobile',
            lastName: 'Developer',
            shiftStart: schedule.shiftStart,
            shiftEnd: schedule.shiftEnd,
          ),
        ],
      ),
    );
  }
}
