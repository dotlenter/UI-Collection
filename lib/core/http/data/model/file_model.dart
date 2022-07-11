import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';

@freezed
class FileModel with _$FileModel {
  factory FileModel({
    required File file,
    required String key,
  }) = _FileModel;
}
