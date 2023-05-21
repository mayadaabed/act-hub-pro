import 'package:act_hub_project/config/constants.dart';
import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:act_hub_project/core/resources/manager_fonts.dart';
import 'package:act_hub_project/core/resources/manager_styles.dart';
import 'package:act_hub_project/core/resources/manager_text_theme_light.dart';
import 'package:flutter/material.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
      useMaterial3: true,

      // MAIN COLORs APP
      primaryColor: ManagerColors.primaryColor,
      primaryColorLight: ManagerColors.primaryColorLight,

      // disabled button colors
      disabledColor: ManagerColors.textColor,
      splashColor: ManagerColors.greyLight,
      scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorLight,

      // APP BAR THEME
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ManagerColors.greyLight,
        elevation: Constants.elevationAppBar,
        titleTextStyle: getBoldTextStyle(
          fontSize: ManagerFontSize.s14,
          color: ManagerColors.primaryColor,
        ),
      ),

      // BUTTON THEME
      buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(),
          disabledColor: ManagerColors.greyLight,
          buttonColor: ManagerColors.buttonColorLight),
      textTheme: ManagerTextThemeLight());
}
