import 'package:flutter/material.dart';

import '../../../../core/mocked_entities/schedule_mocked_entities/schedule_mocked_entities.dart';
import '../../../../widget/colors/common_color.dart';
import 'schedule_item_shimmer_widget.dart';
import 'shimmer_loading.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoading(
          isLoading: true,
          child: Container(
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 0),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 20,
                    width: 104,
                    decoration: BoxDecoration(
                      color: CommonColors.neutral,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: CommonColors.green,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: CommonColors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                    ShimmerLoading(
                      isLoading: true,
                      child: _getLoadingAbbrevWidget(),
                    ),
                  ],
                ),
                ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    height: 48,
                    width: 343,
                    decoration: BoxDecoration(
                      color: CommonColors.neutral,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Text(
            "SCHEDULE FOR THE WEEK",
            style: TextStyle(color: CommonColors.neutral[200]),
          ),
        ),
        Expanded(
          flex: 9,
          child: ListView.separated(
            itemBuilder: (_, index) => _buildShimmer(index),
            separatorBuilder: (_, index) => _divider(),
            itemCount: ScheduleMockedEntities.mockWeek.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }

  Divider _divider() => const Divider(
        indent: 70,
        endIndent: 18,
        thickness: 1,
      );

  Widget _buildShimmer(int index) => ShimmerLoading(
        isLoading: true,
        child: ScheduleItemShimmer(
          schedule: ScheduleMockedEntities.mockWeek[index],
        ),
      );

  Widget _getLoadingAbbrevWidget() => Container(
        height: 16,
        width: 27,
        decoration: BoxDecoration(
          color: CommonColors.neutral,
          borderRadius: BorderRadius.circular(16),
        ),
      );
}
