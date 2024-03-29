import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,

    // MAIN COLORs APP
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorDark,

    // disabled button colors
    disabledColor: ManagerColors.disabledColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

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
        buttonColor: ManagerColors.buttonColorDarK),
    textTheme: ManagerTextThemeLight(),
  );
}
