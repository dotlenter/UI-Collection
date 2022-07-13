import 'package:flutter_test/flutter_test.dart';
import 'package:ui_collection/modules/schedule/domain/entities/schedule_item_entity.dart';

void main(List<String> args) {
  test('Schedule entity should be of type ScheduleItemEntity', () {
    final ScheduleItemEntity schedule = ScheduleItemEntity(
        status: "Regular Shift",
        shiftStart: "9:00 AM",
        shiftEnd: "6:00 PM",
        dateTime: DateTime(2022, 7, 4));

    expect(schedule.status, "Regular Shift");
  });
}
