import 'package:flutter/material.dart';

class ColorHelpers {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
    catch(e) {
      return Colors.blueAccent;
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  static String toHex(Color color, {bool leadingHashSign = true, bool hasFf = false}) => '${leadingHashSign ? '#' : ''}'
      '${hasFf ? color.alpha.toRadixString(16).padLeft(2, '0') : ''}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}
