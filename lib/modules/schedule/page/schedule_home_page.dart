import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_collection/modules/schedule/domain/bloc/schedule_bloc.dart';
import 'package:ui_collection/modules/schedule/widget/drawer/app_drawer_widget.dart';
import 'package:ui_collection/modules/schedule/widget/home_widgets/menu_card_widget.dart';

import '../../../widget/colors/common_color.dart';
import '../domain/entities/home_card_entity.dart';
import '../domain/entities/schedule_item_entity.dart';
import '../widget/home_widgets/clocking_widget.dart';
import '../widget/home_widgets/header_widget.dart';

class ScheduleHomePage extends StatefulWidget {
  const ScheduleHomePage({Key? key}) : super(key: key);

  @override
  State<ScheduleHomePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<ScheduleHomePage> {
  ScheduleItemEntity getToday(List<ScheduleItemEntity> schedules) =>
      schedules.firstWhere(
          (element) => (element.dateTime.year == DateTime.now().year &&
              element.dateTime.month == DateTime.now().month &&
              element.dateTime.day == DateTime.now().day),
          orElse: () => ScheduleItemEntity(
              status: "Normal Shift",
              shiftStart: "9:00 AM",
              shiftEnd: "6:00 PM",
              dateTime: DateTime.now()));

  List<HomeCardEntity> menu = [
    HomeCardEntity(menuIcon: Icons.wallet_membership, title: "Payslip"),
    HomeCardEntity(menuIcon: Icons.book, title: "Directory"),
    HomeCardEntity(menuIcon: Icons.bolt_outlined, title: "Instacash"),
    HomeCardEntity(menuIcon: Icons.calendar_today, title: "Attendance"),
    HomeCardEntity(menuIcon: Icons.payment, title: "Payments"),
    HomeCardEntity(menuIcon: Icons.web, title: "Insight"),
    HomeCardEntity(menuIcon: Icons.image, title: "Label"),
    HomeCardEntity(menuIcon: Icons.person_pin, title: "201"),
    HomeCardEntity(menuIcon: Icons.fingerprint, title: "Biologs"),
    HomeCardEntity(menuIcon: Icons.groups, title: "Recruit"),
    HomeCardEntity(menuIcon: Icons.favorite, title: "HMO"),
    HomeCardEntity(menuIcon: Icons.more_horiz, title: "More"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Company name",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: CommonColors.neutral[800],
            ),
          ),
          backgroundColor: CommonColors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            child: Container(
              color: CommonColors.neutral[30],
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: CommonColors.green[300],
              ),
            );
          })),
      drawer: AppDrawer(),
      body: BlocProvider(create: (BuildContext context) {
        return ScheduleBloc();
      }, child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          return state.when(initial: () {
            BlocProvider.of<ScheduleBloc>(context).add(ScheduleEvent.load());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, loaded: (String monthYear, DateTime currDate,
              List<ScheduleItemEntity> schedules) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeaderWidget(schedule: getToday(schedules)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                    children: List.generate(
                        menu.length,
                        (index) => MenuCardWidget(
                              card: menu[index],
                            )),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: CommonColors.neutral[30]!))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: CommonColors.neutral[100],
                                  )),
                                  TextSpan(text: " ${DateTime.now()}"),
                                ],
                                style: TextStyle(
                                  color: CommonColors.neutral,
                                  fontSize: 14,
                                )),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              ClockingWidget(
                                  title: "Clock In", icon: Icons.login),
                              ClockingWidget(
                                  title: "Clock Out", icon: Icons.logout)
                            ],
                          )
                        ]),
                  ),
                )
              ],
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        },
      )),
    );
  }
}
