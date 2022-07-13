import 'package:flutter/material.dart';

import 'home_user_details_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: const [
          HomeUserDetailsWidget(
            firstName: 'Mobile',
            lastName: 'Developer',
            shiftStart: "9:00 AM",
            shiftEnd: "6:00 PM",
          ),
        ],
      ),
    );
  }
}
