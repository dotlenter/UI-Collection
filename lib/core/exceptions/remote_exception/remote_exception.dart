import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_exception.freezed.dart';

@freezed
class RemoteException with _$RemoteException implements Exception {
  factory RemoteException() = _RemoteException;
}
