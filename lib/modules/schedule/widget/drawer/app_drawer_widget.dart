import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import '../../../../widget/routes/empty_page_route_arguments.dart';
import '../../../../widget/routes/page_route.dart';
import '../../page/schedule_page_route.dart';
import 'app_drawer_header_widget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final IPageRoute<EmptyPageRouteArguments> route = SchedulePageRoute();
  @override
  String getRoute() => '/schedules';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 76,
      child: Drawer(
        child: Container(
          color: CommonColors.neutral[0],
          child: SafeArea(
            child: Column(
              children: const <Widget>[
                AppDrawerHeaderWidget(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
