import 'package:act_hub_project/core/widgets/will_pop_scope.dart';
import 'package:flutter/material.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';

Widget scaffoldWithBackgroundImage(
    {required Widget child,
    Color backgroundColor = ManagerColors.primaryColor,
    String image = ManagerAssets.background}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: child,
      ),
    ),
  );
}
