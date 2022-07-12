import 'package:flutter/material.dart';
import 'package:ui_collection/widget/routes/empty_page_route_arguments.dart';
import 'package:ui_collection/widget/routes/page_route.dart';

import '../../../../widget/colors/common_color.dart';
import '../../page/schedule_page_route.dart';
import 'user_details_widget.dart';

class AppDrawerHeaderWidget extends StatelessWidget {
  AppDrawerHeaderWidget({Key? key}) : super(key: key);

  final IPageRoute<EmptyPageRouteArguments> route = SchedulePageRoute();
  @override
  String getRoute() => '/schedules';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 24,
        top: 68,
        bottom: 24,
      ),
      child: Column(
        children: [
          UserDetailsWidget(
            firstName: 'Mobile',
            lastName: 'Developer',
            position: 'Intern',
          ),
          TextButton(
              onPressed: () {
                SchedulePageRoute().navigate(context);
              },
              child: Text(
                "View Schedule",
                style: TextStyle(color: CommonColors.green),
              ))
        ],
      ),
    );
  }
}
