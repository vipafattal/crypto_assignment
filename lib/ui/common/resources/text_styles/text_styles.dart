import 'package:flutter/material.dart';

import '../../colours.dart';

class TextStyles {
  static const _defaultStyle = const TextStyle();
  static const _font = "Poppins";

  final TextStyle textHeadings1 = _defaultStyle;
  final TextStyle textHeadings2 = _defaultStyle;
  final TextStyle textHeadings3 = _defaultStyle;
  final TextStyle textHeadings4 = _defaultStyle;
  final TextStyle textHeadings5 = _defaultStyle;
  final TextStyle textHeadings6 = _defaultStyle;
  final TextStyle textHeadings7 = _defaultStyle;
  final TextStyle textHeadings8 = _defaultStyle;

  final TextStyle textBody1 = _defaultStyle;
  final TextStyle textBody2 = _defaultStyle;
  final TextStyle textBody3 = _defaultStyle;
  final TextStyle textBody4 = _defaultStyle;
  final TextStyle textBody5 = _defaultStyle;
  final TextStyle textBody6 = _defaultStyle;
  final TextStyle textBody7 = _defaultStyle;

  final TextStyle textSecondary = _defaultStyle;
  final TextStyle textSecondary1 = _defaultStyle;
  final TextStyle textSecondary2 = _defaultStyle;
  final TextStyle textSecondary3 = _defaultStyle;

  static buildCustom({
    Color color = Colours.colorTextPrimary,
    required double fontSize,
    required FontWeight fontWeight,
  }) =>
      TextStyle(
          fontFamily: _font,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color);

  static buildAppBar() =>
      TextStyles.buildCustom(fontSize: 20, fontWeight: FontWeight.w600);
}
