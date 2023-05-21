import 'package:flutter/material.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';

Widget scaffoldWithBackgroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String image = ManagerAssets.background
}) {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: child,),
  );
}
