import 'package:flutter/material.dart';

class AppColor {
  static Color yellow1 = hexToColor('#FFD700');
  static Color yellow2 = hexToColor('#FFEB80');

  static Color blue1 = hexToColor('#007BFF');
  static Color blue2 = hexToColor('#6610F2');
  static Color blue3 = hexToColor('#6F42C1');
  
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color transparent = Colors.transparent;
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
