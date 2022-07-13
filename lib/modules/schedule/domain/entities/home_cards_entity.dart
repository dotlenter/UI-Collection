import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ui_collection/modules/schedule/domain/entities/home_card_entity.dart';

import 'home_card_entity.dart';

part 'home_cards_entity.freezed.dart';

@freezed
class HomeCardsEntity with _$HomeCardsEntity {
  factory HomeCardsEntity({
    required List<HomeCardEntity> itemList,
  }) = _HomeCardsEntity;
}
