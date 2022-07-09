import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_leave_details_entity.freezed.dart';

@freezed
class UserLeaveDetailsEntity with _$UserLeaveDetailsEntity {
  factory UserLeaveDetailsEntity({
    required String type,
    required double paid,
    required bool isWhole,
    bool? isFirstHalf,
  }) = _UserLeaveDetailsEntity;
}
