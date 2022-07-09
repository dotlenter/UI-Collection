import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import 'app_drawer_header_widget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 76,
      child: Drawer(
        child: Container(
          color: CommonColors.neutral[0],
          child: SafeArea(
            child: Column(
              children: const <Widget>[
                AppDrawerHeaderWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
