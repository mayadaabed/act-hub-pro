import 'package:flutter/material.dart';
import 'manager_colors.dart';
import 'manager_fonts.dart';
import 'manager_styles.dart';

class ManagerTextThemeDark extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
      fontSize: ManagerFontSize.s20, color: ManagerColors.textColor);

  @override
  TextStyle get displaySmall => getBoldStyle(
      fontSize: ManagerFontSize.s16, color: ManagerColors.textColor);

  @override
  TextStyle get headlineMedium => getMediumStyle(
      fontSize: ManagerFontSize.s16, color: ManagerColors.textColor);

  @override
  TextStyle get headlineSmall => getTextStyle(
      fontSize: ManagerFontSize.s16, color: ManagerColors.textColor);

  @override
  TextStyle get titleMedium => getMediumStyle(
      fontSize: ManagerFontSize.s14, color: ManagerColors.textColor);
}