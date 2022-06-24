import 'app_config.dart';
import 'main.dart';
import 'main_base.dart';

void main() {
  const configuredApp = AppConfig(
    appName: 'UI Collection Staging',
    apiBaseUrl: 'collectionStagingUrl',
    buildFlavor: 'staging',
    child: App(),
  );
  runMain(configuredApp);
}
