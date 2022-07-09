import 'package:flutter/material.dart';
import 'package:ui_collection/modules/home/domain/entity/home_item_entity.dart';
import 'package:ui_collection/modules/schedule/page/schedule_page_route.dart';
import 'package:ui_collection/modules/tap/pages/tap_page_route.dart';

class HomeMockedEntities {
  static List<HomeItemEntity> get(BuildContext context) => [
        HomeItemEntity(
          title: 'Bouncy',
          description: 'Makes widgets appear bouncing when tapped.',
          dateAdded: DateTime(2019, 12, 12),
          createdBy: 'Enzo',
          imageUrl: 'imageUrl',
          route: SchedulePageRoute(),
        ),
        HomeItemEntity(
          title: 'Tap Dat',
          description: 'Bursting incrementer.',
          dateAdded: DateTime(2022, 07, 01),
          createdBy: 'Enzo',
          imageUrl: 'imageUrl',
          route: TapPageRoute(),
        ),
        HomeItemEntity(
          title: 'Schedule',
          description: 'Innov Q2 summary of schedule',
          dateAdded: DateTime(2022, 07, 18),
          createdBy: 'Carlos',
          imageUrl: 'imageUrl',
          route: SchedulePageRoute(),
        ),
      ];
}
