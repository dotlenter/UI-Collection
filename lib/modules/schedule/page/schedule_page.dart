import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_collection/modules/schedule/widget/schedule_item/schedule_item.dart';

import '../domain/bloc/schedule_bloc.dart';
import '../domain/entities/schedule_item_entity.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  // final schedules = [
  //   ScheduleItemEntity(
  //       status: "Normal Shift",
  //       shiftStart: "9:00AM",
  //       shiftEnd: "6:00PM",
  //       dayOfWeek: 01,
  //       dateTime: DateTime(2022, 7, 8)),
  //   ScheduleItemEntity(
  //       status: "Normal Shift",
  //       shiftStart: "9:00AM",
  //       shiftEnd: "6:00PM",
  //       dayOfWeek: 02,
  //       dateTime: DateTime(2022, 8, 8)),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: Scaffold(
        appBar: AppBar(),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Text(monthYear)),
                  const Divider(
                    thickness: 1.0,
                  ),
                  Expanded(child: WeekList(schedules))
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
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Column(
  //       children: [
  //         Container(
  //             alignment: Alignment.centerLeft,
  //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //             child: Text("month year")),
  //         const Divider(
  //           thickness: 1.0,
  //         ),
  //         Expanded(child: WeekList(schedules))
  //       ],
  //     ),
  //   );
  // }

  Widget WeekList(List<ScheduleItemEntity> schedules) {
    return ListView.separated(
      itemBuilder: (context, index) => ScheduleItem(
        schedule: schedules[index],
      ),
      separatorBuilder: (context, index) => const Divider(
        indent: 72,
        endIndent: 16,
        thickness: 1,
      ),
      itemCount: schedules.length,
      shrinkWrap: true,
    );
  }
}
