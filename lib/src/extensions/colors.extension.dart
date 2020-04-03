import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension DisneyColors on Colors {
  static final disneyGradient = [
    HexColor.fromHex("#130e31"),
    HexColor.fromHex("#3b1c4b"),
    HexColor.fromHex("#332763"),
    HexColor.fromHex("#181d5e")
  ];

  static final Color darkBg = HexColor.fromHex("#040712");
  static final Color bg = HexColor.fromHex("#191C28");
}