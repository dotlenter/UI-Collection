import 'package:flutter/material.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

import '../../../core/navigation/navigation_history.dart';
import '../../core/navigation/navigation_interceptor.dart';
import 'page_route.dart';
import 'page_route_arguments.dart';

class RouteGenerator extends StatefulWidget {
  final String initialRoute;
  final List<IPageRoute<IPageRouteArguments>> routes;
  final bool isMasterPage;
  final NavigationInterceptor navigationInterceptor;

  const RouteGenerator({
    Key? key,
    required this.initialRoute,
    required this.routes,
    this.isMasterPage = true,
    required this.navigationInterceptor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RouteGenerator();
}

class _RouteGenerator extends State<RouteGenerator> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        initialRoute: widget.initialRoute,
        observers: <NavigatorObserver>[
          if (widget.isMasterPage) RouteObserverProvider.of(context),
        ],
        onGenerateRoute: (settings) {
          var builder =
              (context) => getWidget(context, widget.routes.first, settings);
          var isFullScreenDialog = false;
          for (var route in widget.routes) {
            if (route.getRoute() != settings.name) {
              continue;
            }
            builder = (context) => getWidget(context, route, settings);

            isFullScreenDialog = route.isFullScreenDialog();
          }

          return MaterialPageRoute<dynamic>(
            fullscreenDialog: isFullScreenDialog,
            builder: builder,
            settings: settings,
          );
        },
      ),
      onWillPop: () async {
        widget.navigationInterceptor.willPop();
        return false;
      },
    );
  }

  Widget getWidget(
    BuildContext context,
    IPageRoute<IPageRouteArguments> route,
    RouteSettings settings,
  ) {
    var widget = route.getWidget();

    widget ??= route.getWidgetWithArguments(
      arguments: settings.arguments as IPageRouteArguments,
    );

    this.widget.navigationInterceptor.addNavigationHistory(
          NavigationHistory(
            context: context,
            name: route.getRoute(),
            onBackPressed: route.onBackPressed,
          ),
        );

    return widget!;
  }
}
