import 'package:freezed_annotation/freezed_annotation.dart';

import 'home_item_entity.dart';

part 'home_items_entity.freezed.dart';

@freezed
class HomeItemsEntity with _$HomeItemsEntity {
  factory HomeItemsEntity({
    required List<HomeItemEntity> itemList,
  }) = _HomeItemsEntity;
}
