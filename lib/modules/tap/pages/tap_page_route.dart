import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'tap_page.dart';

class TapPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/tap_page';

  @override
  Widget getWidget() => TapPage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute(), arguments: arguments);
  }
}
