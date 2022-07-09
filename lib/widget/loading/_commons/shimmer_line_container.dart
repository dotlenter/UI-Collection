import 'package:flutter/material.dart';

import '../../colors/common_color.dart';

class ShimmerLineContainer extends StatelessWidget {
  const ShimmerLineContainer({
    Key? key,
    this.height = 16,
    this.width = 180,
    this.borderRadius = 4,
    this.boxShadow,
  }) : super(key: key);

  final double height, width, borderRadius;

  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CommonColors.neutral[0],
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      height: height,
      width: width,
    );
  }
}
