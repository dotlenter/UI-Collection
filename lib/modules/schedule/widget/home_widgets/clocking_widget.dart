import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';

class ClockingWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ClockingWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      width: 164,
      child: OutlinedButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: _getIconColor(title),
            ),
            Text(
              title,
              style: TextStyle(color: CommonColors.neutral),
            ),
            SizedBox(),
          ],
        ),
        style: _getButtonStyle(title),
      ),
    );
  }

  ButtonStyle _getButtonStyle(String title) {
    if (title == "Clock In") {
      return OutlinedButton.styleFrom(
        primary: CommonColors.blue,
        backgroundColor: CommonColors.blue[50],
        side: BorderSide(
          color: CommonColors.blue[300]!,
        ),
      );
    }
    if (title == "Clock Out") {
      return OutlinedButton.styleFrom(
        primary: CommonColors.orange,
        backgroundColor: CommonColors.orange[50],
        side: BorderSide(
          color: CommonColors.orange[300]!,
        ),
      );
    }
    return ButtonStyle();
  }

  Color _getIconColor(String title) {
    if (title == "Clock In") {
      return CommonColors.blue;
    }
    if (title == "Clock Out") {
      return CommonColors.orange;
    }
    return CommonColors.neutral;
  }
}
