import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../enum/content_type/content_type.dart';
import 'json_http_request_interceptor.dart';
import 'multipart_http_request_interceptor.dart';

@injectable
class HttpClient {
  final Dio _baseHttpClient;
  final JsonHttpRequestInterceptor _jsonHttpRequestInterceptor;
  final MultipartHttpRequestInterceptor _multipartHttpRequestInterceptor;

  HttpClient({
    required JsonHttpRequestInterceptor jsonHttpRequestInterceptor,
    required MultipartHttpRequestInterceptor multipartHttpRequestInterceptor,
  })  : _jsonHttpRequestInterceptor = jsonHttpRequestInterceptor,
        _multipartHttpRequestInterceptor = multipartHttpRequestInterceptor,
        _baseHttpClient = Dio(
          BaseOptions(baseUrl: 'https://mocki.io/v1/'),
        );

  Dio initializeHttpClient({
    required bool shouldRetry,
    required ResponseType responseType,
    ContentType? contentType,
  }) {
    final httpClient = _baseHttpClient;
    httpClient.options.contentType = _getContentType(contentType);
    httpClient.options.responseType = responseType;

    if (shouldRetry) {
      const timeOutInMilliseconds = 1000 * 30;
      httpClient.options.connectTimeout = timeOutInMilliseconds;
      httpClient.options.sendTimeout = timeOutInMilliseconds;
      httpClient.options.receiveTimeout = timeOutInMilliseconds;
    }

    if (contentType == ContentType.json) {
      httpClient.interceptors.add(_jsonHttpRequestInterceptor);
    }

    if (contentType == ContentType.multipart) {
      httpClient.interceptors.add(_multipartHttpRequestInterceptor);
    }

    return httpClient;
  }

  String _getContentType(ContentType? contentType) {
    if (contentType == ContentType.multipart) return 'multipart/form-data';

    return 'application/json';
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
    bool authorizedRequest = true,
  }) async {
    final httpClient = initializeHttpClient(
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
    bool authorizedRequest = true,
  }) async {
    final httpClient = initializeHttpClient(
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.post(
      path,
      data: data,
    );
  }

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
    bool authorizedRequest = true,
  }) async {
    final httpClient = initializeHttpClient(
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.delete(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
    bool authorizedRequest = true,
  }) async {
    final httpClient = initializeHttpClient(
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
