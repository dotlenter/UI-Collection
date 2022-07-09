import 'package:flutter/material.dart';

import '../../colors/common_color.dart';

class ShimmerCircleContainer extends StatelessWidget {
  final double size;

  const ShimmerCircleContainer({
    Key? key,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CommonColors.blue,
        shape: BoxShape.circle,
      ),
      height: size,
      width: size,
    );
  }
}
