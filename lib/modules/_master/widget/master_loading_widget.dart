import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widget/colors/common_color.dart';

class MasterLoadingWidget extends StatelessWidget {
  const MasterLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasSafeArea = MediaQuery.of(context).viewPadding.bottom != 0;
    final bottomPadding = hasSafeArea ? 0.0 : 34.0;

    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Shimmer.fromColors(
            baseColor: CommonColors.neutral[20]!,
            highlightColor: CommonColors.neutral[10]!,
            child: Column(
              children: [
                const SizedBox(height: 14),
                SizedBox(height: bottomPadding),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
