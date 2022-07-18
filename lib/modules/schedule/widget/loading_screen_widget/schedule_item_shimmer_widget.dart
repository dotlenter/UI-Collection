import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import '../../domain/entities/schedule_item_entity.dart';

class ScheduleItemShimmer extends StatelessWidget {
  final ScheduleItemEntity schedule;

  const ScheduleItemShimmer({Key? key, required this.schedule})
      : super(key: key);

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
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: CommonColors.neutral,
                borderRadius: BorderRadius.circular(16),
              ),
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
                Container(
                  width: 149,
                  height: 16,
                  decoration: BoxDecoration(
                    color: CommonColors.neutral,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Container(
                  width: 64,
                  height: 16,
                  decoration: BoxDecoration(
                    color: CommonColors.neutral,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
