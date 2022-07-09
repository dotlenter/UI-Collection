import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import 'initials_avatar_widget.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    this.position,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String? position;

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
                '$firstName $lastName',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CommonColors.neutral[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.2603,
                ),
              ),
              Text(
                position ?? '',
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
        ),
      ],
    );
  }
}
