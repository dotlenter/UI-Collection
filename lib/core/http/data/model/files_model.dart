import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_model.dart';

part 'files_model.freezed.dart';

@freezed
class FilesModel with _$FilesModel {
  factory FilesModel({
    required List<FileModel> files,
  }) = _FilesModel;
}
