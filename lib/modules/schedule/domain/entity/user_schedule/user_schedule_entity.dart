import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_holiday_details_entity.dart';
import 'user_leave_details_entity.dart';

part 'user_schedule_entity.freezed.dart';

@freezed
class UserScheduleEntity with _$UserScheduleEntity {
  const UserScheduleEntity._();

  const factory UserScheduleEntity({
    required int dayOfWeek,
    required bool isRestDay,
    required bool isHoliday,
    required bool isOnLeave,
    required bool hasScheduleAdjustment,
    required String shiftStart,
    required String shiftEnd,
    required String breakStart,
    required String breakEnd,
    required String shift,
    required List<UserHolidayDetailsEntity> holidayDetails,
    required List<UserLeaveDetailsEntity> leaveDetails,
  }) = _UserScheduleEntity;

  int get weekday {
    return dayOfWeek == 0 ? 7 : dayOfWeek;
  }
}
