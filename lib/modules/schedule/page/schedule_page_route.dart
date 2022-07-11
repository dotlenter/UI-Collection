import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'schedule_page.dart';

class SchedulePageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/schedule';

  @override
  Widget getWidget() => SchedulePage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute(), arguments: arguments);
  }
}
