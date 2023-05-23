import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:act_hub_project/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';

import 'manager_styles.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get headlineMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get titleMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.textColorLight,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorLight,
      );
}
