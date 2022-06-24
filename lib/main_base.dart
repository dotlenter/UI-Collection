import 'package:flutter/material.dart';

import 'app_config.dart';
import 'core/dependency_locator.dart';

void runMain(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(
    apiBaseUrl: config.apiBaseUrl,
    environment: config.buildFlavor,
  );
  await configure();
  runApp(config);
}
