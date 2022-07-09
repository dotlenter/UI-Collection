import 'package:flutter/widgets.dart';

abstract class IPageRoute<IPageRouteArguments> {
  String getRoute();

  Widget? getWidget() {
    return null;
  }

  Widget? getWidgetWithArguments({IPageRouteArguments? arguments}) {
    return null;
  }

  Future<Object?>? navigateAsync(
    BuildContext context, {
    IPageRouteArguments? arguments,
  }) {
    return null;
  }

  Future<Object?>? navigateAsyncWithData(
    BuildContext context, {
    IPageRouteArguments? arguments,
  }) {
    return null;
  }

  void navigate(BuildContext context, {IPageRouteArguments? arguments}) {
    return;
  }

  bool isFullScreenDialog() {
    return false;
  }

  Future<String>? onBackPressed(BuildContext context) {
    Navigator.pop(context);
    return null;
  }
}
