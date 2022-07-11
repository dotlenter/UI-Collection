import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../widget/colors/common_color.dart';

@injectable
class ThemeHelper {
  ThemeHelper() {
    _defaultTheme = _buildDefaultTheme();
  }

  late ThemeData _defaultTheme;
  final ThemeData _baseTheme = ThemeData(
    fontFamily: 'Rubik',
    primarySwatch: CommonColors.green,
  );

  ThemeData get defaultTheme {
    return _defaultTheme;
  }

  ThemeData _buildDefaultTheme() {
    return _baseTheme.copyWith(
      primaryColor: CommonColors.green,
      inputDecorationTheme: _buildInputDecorationTheme(),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: CommonColors.transparent,
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        color: CommonColors.neutral[200],
        fontSize: 16,
        fontFamily: 'Rubik',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: CommonColors.neutral[60]!),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CommonColors.green),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CommonColors.red),
      ),
    );
  }
}
