import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart' show TextStyle;

import '../../colours.dart';
import 'text_styles.dart';

class TabletTextStyles implements TextStyles {
  static const _font = "Poppins";
  static const _textColor = Colours.colorTextPrimary;
  static const _secondaryTextColor = Colours.colorTextSecondary;

  @override
  final TextStyle textHeadings1 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 42.0,
      color: _textColor);
  @override
  final TextStyle textHeadings2 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 32.0,
      color: _textColor);
  @override
  final TextStyle textHeadings3 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
      color: _textColor);
  @override
  final TextStyle textHeadings4 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 28.0,
      color: _textColor);
  @override
  final TextStyle textHeadings5 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 28.0,
      color: _textColor);

  @override
  final TextStyle textHeadings6 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 25.0,
      color: _textColor);
  @override
  final TextStyle textHeadings7 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      color: _textColor);

  @override
  final TextStyle textHeadings8 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
      color: _textColor);

  @override
  final TextStyle textBody1 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
      color: _textColor);


  @override
  final TextStyle textBody2 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      color: _textColor);
  @override
  final TextStyle textBody3 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
      color: _textColor);
  @override
  final TextStyle textBody4 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      color: _textColor);
  @override
  final TextStyle textBody5 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      color: _textColor);
  @override
  final TextStyle textBody6 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: _textColor);
  @override
  final TextStyle textBody7 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: _textColor);

  @override
  final TextStyle textSecondary = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 17.5,
      color: _secondaryTextColor);
  @override
  final TextStyle textSecondary1 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: _secondaryTextColor);
  @override
  final TextStyle textSecondary2 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      color: _secondaryTextColor);
  @override
  final TextStyle textSecondary3 = const TextStyle(
      fontFamily: _font,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: _secondaryTextColor);

}
