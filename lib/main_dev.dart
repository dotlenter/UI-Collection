import 'app_config.dart';
import 'main.dart';
import 'main_base.dart';

void main() {
  const configuredApp = AppConfig(
    appName: 'UI Collection Dev',
    apiBaseUrl: 'collectionDevUrl',
    buildFlavor: 'dev',
    child: App(),
  );
  runMain(configuredApp);
}
