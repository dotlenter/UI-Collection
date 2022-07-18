import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import '../drawer/initials_avatar_widget.dart';

class HomeUserDetailsWidget extends StatelessWidget {
  const HomeUserDetailsWidget(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.shiftStart,
      required this.shiftEnd})
      : super(key: key);

  final String firstName;
  final String lastName;
  final String shiftStart;
  final String shiftEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InitialsAvatarWidget(
          firstName: firstName,
          lastName: lastName,
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Hey, $firstName $lastName!',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CommonColors.neutral[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.2603,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$shiftStart - $shiftEnd",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: CommonColors.neutral[300],
                      fontSize: 14,
                      height: 1.746,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
