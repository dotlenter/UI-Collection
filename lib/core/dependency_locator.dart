import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../main.dart';
import 'dependency_locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> configure() async => await $initGetIt(locator);

void setupLocator() {
  _setupCore();
}

void _setupCore() {
  locator.registerFactory<App>(() => App());
}
