import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import 'data/model/files_model.dart';

@injectable
class MultipartHttpRequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = getRequestFormData(options.data);
    options.data = data;

    return handler.next(options);
  }

  FormData getRequestFormData(dynamic data) {
    if (data is FormData) return data;

    var formData =
        data is! FilesModel ? FormData.fromMap(data.toJson()) : FormData();

    final fileModel = getFilesModel(data);

    if (fileModel != null) {
      fileModel.files.forEach((row) async {
        final contentType = getContentType(row.file).split('/');
        final file = await MultipartFile.fromFile(
          row.file.path,
          contentType: MediaType(contentType.first, contentType.last),
        );

        final entry = MapEntry(row.key, file);
        formData.files.add(entry);
      });
    }

    return formData;
  }

  FilesModel? getFilesModel(dynamic data) {
    if (data is FilesModel) return data;

    try {
      return data.files;
    } catch (error) {
      return null;
    }
  }

  String getContentType(File file) {
    final ext = file.path.split('.').last;

    switch (ext) {
      case 'png':
        return 'image/png';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'pdf':
        return 'application/pdf';
      default:
        return 'image/jpeg';
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response == null) return handler.next(err);

    if (err.response!.data is Map) return handler.next(err);

    try {
      err.response?.data = jsonDecode(err.response?.data);
      return handler.next(err);
    } on FormatException {
      return handler.next(err);
    }
  }
}
