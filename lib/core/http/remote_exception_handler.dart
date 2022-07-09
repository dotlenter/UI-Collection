import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/network_exception/network_exception.dart';
import '../exceptions/remote_exception/remote_exception.dart';
import '../exceptions/time_out_exception/time_out_exception.dart';
import '../exceptions/unknown_exception/unknown_exception.dart';

@injectable
class RemoteExceptionHandler {
  Response<dynamic> assureRemoteException(dynamic error) {
    if (error is DioError && error.type == DioErrorType.connectTimeout) {
      throw TimeoutException();
    }

    if (error.type == DioErrorType.other &&
        error.error != null &&
        error.error is SocketException) {
      throw NetworkException();
    }

    if (error.response == null) {
      throw UnknownException();
    }

    Response response = error.response;

    if (response.data == null || response.data == '') {
      throw RemoteException();
    }

    throw RemoteException();
  }
}
