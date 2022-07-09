import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_history.freezed.dart';

@freezed
class NavigationHistory with _$NavigationHistory {
  factory NavigationHistory({
    required BuildContext context,
    required String name,
    Future<String>? Function(BuildContext)? onBackPressed,
  }) = _NavigationHistory;
}
