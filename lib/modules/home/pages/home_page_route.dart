import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'home_page.dart';

class HomePageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => 'home';

  @override
  Widget getWidget() => HomePage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute(), arguments: arguments);
  }
}
