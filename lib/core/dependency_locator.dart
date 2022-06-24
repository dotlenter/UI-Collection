import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_config.dart';
import 'dependency_locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> configure() async => await $initGetIt(locator);

void setupLocator({required String apiBaseUrl, required String environment}) {
  _setupCore(apiBaseUrl, environment);
}

void _setupCore(String apiBaseUrl, String environment) {
  locator.registerFactory<AppConfig>(() => AppConfig(apiBaseUrl, environment));
}
