import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../widget/routes/empty_page_route_arguments.dart';
import '../../../../widget/routes/page_route.dart';

part 'home_item_entity.freezed.dart';

@freezed
class HomeItemEntity with _$HomeItemEntity {
  factory HomeItemEntity({
    required String title,
    required String description,
    required DateTime dateAdded,
    required String createdBy,
    required String imageUrl,
    required IPageRoute<EmptyPageRouteArguments> route,
  }) = _HomeItemEntity;
}
