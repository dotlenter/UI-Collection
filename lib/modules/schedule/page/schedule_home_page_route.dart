import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'schedule_home_page.dart';

class ScheduleHomePageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/schedule';

  @override
  Widget getWidget() => ScheduleHomePage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute(), arguments: arguments);
  }
}
