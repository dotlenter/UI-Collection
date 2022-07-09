import 'package:flutter/material.dart';

import '../../colors/common_color.dart';

class ShimmerBoxContainer extends StatelessWidget {
  const ShimmerBoxContainer({
    Key? key,
    this.size = 80,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: CommonColors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
