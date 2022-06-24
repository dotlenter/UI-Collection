import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../app_config.dart';

class DebugBanner extends StatefulWidget {
  const DebugBanner({Key? key}) : super(key: key);

  @override
  _DebugBannerState createState() => _DebugBannerState();
}

class _DebugBannerState extends State<DebugBanner> {
  String? appVersion;
  String? appBuildNumber;
  String? appPackageName;

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((packageInfo) {
      final version = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;
      final packageName = packageInfo.packageName;

      setState(() {
        appVersion = version;
        appBuildNumber = buildNumber;
        appPackageName = packageName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final environment = AppConfig.of(context)?.buildFlavor;
    final versionDisplay = 'v$appVersion+$appBuildNumber';

    return Text(
      'Environment: $environment\nVersion: $versionDisplay'
      '\nPackage: $appPackageName',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 11,
        decoration: TextDecoration.none,
      ),
    );
  }
}
