import 'package:flutter/material.dart';
import 'package:ui_collection/modules/schedule/widget/drawer/app_drawer_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text(
                    'Open Drawer',
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
