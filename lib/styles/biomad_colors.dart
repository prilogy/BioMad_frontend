import 'package:flutter/material.dart';

/// Библиотека цветов BioMad
class BioMadColors {
  static const MaterialColor base = MaterialColor(0xFF15162B, {
    100: Color(0xFFFFFFFF), //white actually
    200: Color(0xFFDCDDE0),
    300: Color(0xFFB4B5B8),
    400: Color(0xFF8F9199),
    500: Color(0xFF4D515B)
  });

  static const MaterialColor primary = MaterialColor(0xFF1554F6, {
    500: Color(0xFF1554F6)
  });

  static const MaterialColor secondary = MaterialColor(0xFFFF1D53, {
    500: Color(0xFFFF1D53)
  });

  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF2994A);
  static const Color error = Color(0xFFEB5757);
}