import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_holiday_details_entity.freezed.dart';

@freezed
class UserHolidayDetailsEntity with _$UserHolidayDetailsEntity {
  factory UserHolidayDetailsEntity({
    required String name,
    required String type,
    required String definition,
    bool? isNonWorking,
  }) = _UserHolidayDetailsEntity;
}
