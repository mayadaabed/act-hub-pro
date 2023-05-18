import 'package:flutter/material.dart';
import 'manager_fonts.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color color, TextDecoration decoration) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration);
}

// Regular TextStyle
TextStyle getTextStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration=TextDecoration.none}) {
  return _getTextStyle(fontSize, ManagerFontFamily.fontFamily,
      ManagerFontWeight.regular, color, decoration);
}

// Medium TextStyle
TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration=TextDecoration.none}) {
  return _getTextStyle(fontSize, ManagerFontFamily.fontFamily,
      ManagerFontWeight.medium, color, decoration);
}

// Bold TextStyle
TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration=TextDecoration.none}) {
  return _getTextStyle(fontSize, ManagerFontFamily.fontFamily,
      ManagerFontWeight.bold, color, decoration);
}
