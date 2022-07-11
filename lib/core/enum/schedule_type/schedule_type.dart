import 'package:freezed_annotation/freezed_annotation.dart';

enum ScheduleType {
  @JsonValue(null)
  unkown,
  @JsonValue('FlexiPerDay')
  flexiPerDay,
  @JsonValue('FlexiPerWeek')
  flexiPerWeek,
  @JsonValue('NormalShift')
  normalShift,
  @JsonValue('Exempted')
  exempted,
  @JsonValue('ShiftBased')
  shiftBased,
  @JsonValue('SupervisorShift')
  supervisorShift,
  @JsonValue('SingleLogin')
  singleLogin,
}
