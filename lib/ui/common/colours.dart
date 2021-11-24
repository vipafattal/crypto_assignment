import 'package:flutter/material.dart';

class Colours {
  static const colorBackground = Color(0xffffffff);
  static const colorPrimaryDark = Color(0xff0D47A1);
  static const colorPrimaryLight = Color(0xffe4f4f5);
  static const colorPrimary = Color(0xff32a6e5);
  static const colorSecondary =Color(0xffD5EFF6);

  static const colorItemSecondary =Color(0xfff3eeee);
  static const colorTextPrimary = Colors.black;
  static const colorTextSecondary = Color(0xff85858A);
  static const colorAlert = Color(0xffe21d1d);

  static Color fromString(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static Color getForegroundColor([bool isSelected= true]) =>
      isSelected ? Colours.colorPrimary : Colours.colorTextPrimary.withOpacity(0.7);

  static Color getBackgroundColor([bool isSelected= true]) =>
      isSelected ? Colours.colorSecondary : Colors.transparent;
}