import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enum/schedule_type/schedule_type.dart';
import 'user_schedule_entity.dart';

part 'user_schedule_details_entity.freezed.dart';

@freezed
class UserScheduleDetailsEntity with _$UserScheduleDetailsEntity {
  const UserScheduleDetailsEntity._();

  const factory UserScheduleDetailsEntity({
    required ScheduleType scheduleType,
    required List<UserScheduleEntity> schedulesEntityList,
  }) = _UserScheduleDetailsEntity;

  UserScheduleEntity get todaySchedule {
    return schedulesEntityList.firstWhere(
      (schedule) => schedule.weekday == DateTime.now().weekday,
    );
  }
}
