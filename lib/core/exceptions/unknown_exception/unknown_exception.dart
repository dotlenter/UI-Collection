import 'package:freezed_annotation/freezed_annotation.dart';

part 'unknown_exception.freezed.dart';

@freezed
class UnknownException with _$UnknownException implements Exception {
  factory UnknownException() = _UnknownException;
}
