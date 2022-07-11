import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class JsonHttpRequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is! String) {
      options.data = jsonEncode(options.data);
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      response.data = jsonDecode(response.data);
      return handler.next(response);
    } catch (error) {
      return handler.next(response);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response == null) return handler.next(err);

    var data = err.response!.data;

    if (data is Uint8List) {
      data = String.fromCharCodes(data);
    }

    try {
      err.response?.data = jsonDecode(data);
      return handler.next(err);
    } catch (error) {
      return handler.next(err);
    }
  }
}
