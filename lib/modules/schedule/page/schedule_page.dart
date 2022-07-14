import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_collection/modules/schedule/widget/schedule_widgets/schedule_item_widget.dart';
import 'package:ui_collection/modules/schedule/widget/schedule_widgets/schedule_summary_widget.dart';
import 'package:ui_collection/widget/colors/common_color.dart';

import '../domain/bloc/schedule_bloc.dart';
import '../domain/entities/schedule_item_entity.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Weekly Schedule",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: CommonColors.neutral[800],
              ),
            ),
            backgroundColor: CommonColors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: CommonColors.green),
            bottom: PreferredSize(
              child: Container(
                color: CommonColors.neutral[30],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1),
            )),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            return state.when(initial: () {
              BlocProvider.of<ScheduleBloc>(context).add(ScheduleEvent.load());
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, loaded: (String monthYear, List<ScheduleItemEntity> schedules) {
              return Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 4, bottom: 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              monthYear,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: CommonColors.neutral[300],
                                  fontSize: 16,
                                  height: 1.5),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: CommonColors.green,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: CommonColors.green,
                                )),
                          )
                        ],
                      )),
                  const Divider(
                    thickness: 1.0,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: schedules
                              .map((schedule) =>
                                  ScheduleSummaryWidget(schedule: schedule))
                              .toList(),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.all(16),
                      child: Text("SCHEDULE FOR THE WEEK")),
                  Expanded(flex: 9, child: WeekList(schedules))
                ],
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
          },
        ),
      ),
    );
  }

  Widget WeekList(List<ScheduleItemEntity> schedules) {
    return ListView.separated(
      itemBuilder: (context, index) => ScheduleItem(
        schedule: schedules[index],
      ),
      separatorBuilder: (context, index) => const Divider(
        indent: 70,
        endIndent: 18,
        thickness: 1,
      ),
      itemCount: schedules.length,
      shrinkWrap: true,
    );
  }
}
