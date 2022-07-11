import 'package:flutter/material.dart';

import '../../../../widget/colors/common_color.dart';
import 'initials_avatar_size.dart';

class InitialsAvatarWidget extends StatelessWidget {
  const InitialsAvatarWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    this.size = InitialsAvatarSize.small,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final InitialsAvatarSize size;

  final double _maxRadius = 37;

  final double _minRadius = 21;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: CommonColors.neutral[30],
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: CommonColors.neutral[30]!,
        ),
      ),
      child: CircleAvatar(
        radius: _getAvatarRadius(size),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          child: Text(
            '${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}',
          ),
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            fontSize: _getInitialsFontSize(size),
            color: CommonColors.neutral[800],
          ),
        ),
        foregroundColor: CommonColors.neutral,
        backgroundColor: CommonColors.neutral[20],
      ),
    );
  }

  double _getInitialsFontSize(InitialsAvatarSize size) {
    switch (size) {
      case InitialsAvatarSize.regular:
        return 16;
      case InitialsAvatarSize.small:
      default:
        return 14;
    }
  }

  double _getAvatarRadius(InitialsAvatarSize size) {
    switch (size) {
      case InitialsAvatarSize.regular:
        return _maxRadius;
      case InitialsAvatarSize.small:
      default:
        return _minRadius;
    }
  }
}
