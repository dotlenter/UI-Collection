import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_card_entity.freezed.dart';

@freezed
class HomeCardEntity with _$HomeCardEntity {
  factory HomeCardEntity({
    required IconData menuIcon,
    required String title,
  }) = _HomeCardEntity;
}
