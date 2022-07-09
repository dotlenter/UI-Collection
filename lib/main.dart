import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'core/dependency_locator.dart';
import 'helper/theme/theme_helper.dart';
import 'modules/_master/page/master_page_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await configure();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeData theme = ThemeHelper().defaultTheme;

  final MasterPageRoute masterPageRoute = MasterPageRoute();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return FutureBuilder(
      future: _initializeDependencies(),
      builder: (context, snapshot) => _buildApp(context),
    );
  }

  MaterialApp _buildApp(BuildContext context) {
    final initialRoute = masterPageRoute.getRoute();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      theme: theme,
      routes: <String, WidgetBuilder>{
        masterPageRoute.getRoute(): (context) => masterPageRoute.getWidget(),
      },
      builder: (context, widget) {
        return Stack(
          children: [
            widget!,
          ],
        );
      },
    );
  }

  Future<void> _initializeDependencies() async {
    await GetIt.instance.allReady();
  }
}
