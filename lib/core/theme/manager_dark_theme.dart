import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark()
      .copyWith(useMaterial3: true, primaryColor: ManagerColors.primaryColor);
}
