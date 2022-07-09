import 'package:flutter/material.dart';

class CommonColors {
  CommonColors._();

  static const int _transparent = 0x00000000;
  static const MaterialColor transparent = MaterialColor(
    _transparent,
    <int, Color>{
      500: Color(_transparent),
    },
  );

  static const int _greenPrimary = 0xFF17AD49;
  static const MaterialColor green = MaterialColor(
    _greenPrimary,
    <int, Color>{
      50: Color(0xFFE6FFEE),
      75: Color(0xFFA8F5C2),
      100: Color(0xFF6FE697),
      200: Color(0xFF33DA6A),
      300: Color(_greenPrimary),
      400: Color(0xFF009030),
      500: Color(0xFF046422),
      600: Color(0xFFE6FFEE),
      700: Color(0xFFA8F5C2),
      800: Color(0xFF009030),
      900: Color(0xFF33DA6A),
    },
  );

  static const int _bluePrimary = 0xFF0F6EEB;
  static const MaterialColor blue = MaterialColor(
    _bluePrimary,
    <int, Color>{
      50: Color(0xFFE6EFFF),
      75: Color(0xFFB2D3FF),
      100: Color(0xFF66A7FF),
      200: Color(0xFF3089FF),
      300: Color(_bluePrimary),
      400: Color(0xFF004FB7),
      500: Color(0xFF003883),
    },
  );

  static const int _redPrimary = 0xFFDA2F38;
  static const MaterialColor red = MaterialColor(
    _redPrimary,
    <int, Color>{
      50: Color(0xFFFFE3E4),
      75: Color(0xFFFFA6AA),
      100: Color(0xFFFF636B),
      200: Color(0xFFFC353F),
      300: Color(_redPrimary),
      400: Color(0xFFAA232A),
      500: Color(0xFF7A181C),
    },
  );

  static const int _orangePrimary = 0xFFFF7F00;
  static const MaterialColor orange = MaterialColor(
    _orangePrimary,
    <int, Color>{
      50: Color(0xFFFFF2E6),
      75: Color(0xFFFFD5AD),
      100: Color(0xFFFFB973),
      200: Color(0xFFFFA54D),
      300: Color(_orangePrimary),
      400: Color(0xFFC66300),
      500: Color(0xFF8D4600),
    },
  );

  static const int _purplePrimary = 0xFF8952F6;
  static const MaterialColor purple = MaterialColor(
    _purplePrimary,
    <int, Color>{
      50: Color(0xFFEEE5FF),
      75: Color(0xFFD5C0FD),
      100: Color(0xFFBC9CFB),
      200: Color(0xFFA277F8),
      300: Color(_purplePrimary),
      400: Color(0xFF693EBF),
      500: Color(0xFF492988),
    },
  );

  static const int _yellowPrimary = 0xFFFFBF00;
  static const MaterialColor yellow = MaterialColor(
    _yellowPrimary,
    <int, Color>{
      50: Color(0xFFFFF9E6),
      75: Color(0xFFFFEBAD),
      100: Color(0xFFFFDC73),
      200: Color(0xFFFFCE3A),
      300: Color(_yellowPrimary),
      400: Color(0xFFC69400),
      500: Color(0xFF8D5200)
    },
  );

  static const int _tealPrimary = 0xFF02AFCE;
  static const MaterialColor teal = MaterialColor(
    _tealPrimary,
    <int, Color>{
      50: Color(0xFFD9F7FF),
      75: Color(0xFFA6F0FF),
      100: Color(0xFF24DEFF),
      200: Color(0xFF4FCDE3),
      300: Color(_tealPrimary),
      400: Color(0xFF00849C),
      500: Color(0xFF006C80),
    },
  );

  static const int _neutralPrimary = 0xFF00291B;
  static const MaterialColor neutral = MaterialColor(
    _neutralPrimary,
    <int, Color>{
      0: Color(0xFFFFFFFF),
      10: Color(0xFFF0F2F2),
      20: Color(0xFFE1E6E4),
      30: Color(0xFFD2D9D7),
      40: Color(0xFFC3CDC9),
      50: Color(0xFFB4C0BC),
      60: Color(0xFFA5B3AF),
      70: Color(0xFF96A7A1),
      80: Color(0xFF879A94),
      90: Color(0xFF788E86),
      100: Color(0xFF698179),
      200: Color(0xFF5A756B),
      300: Color(0xFF4B685E),
      400: Color(0xFF3C5B51),
      500: Color(0xFF2D4F43),
      600: Color(0xFF1E4236),
      700: Color(0xFF0F3628),
      800: Color(_neutralPrimary),
      900: Color(0xFF00120C),
    },
  );
}
