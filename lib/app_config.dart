import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required this.appName,
    required this.apiBaseUrl,
    required this.buildFlavor,
    required Widget child,
  }) : super(key: key, child: child);

  final String appName;
  final String apiBaseUrl;
  final String buildFlavor;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
