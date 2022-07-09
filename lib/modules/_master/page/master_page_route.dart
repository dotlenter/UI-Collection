import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/bloc_providers/combined_blocs.dart';
import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'master_page.dart';

class MasterPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/master';

  @override
  Widget getWidget() => MultiProvider(
        providers: CombinedBlocs.get(),
        child: MasterPage(),
      );

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      getRoute(),
      (_) => false,
    );
  }
}
