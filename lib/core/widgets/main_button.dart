import 'package:act_hub_project/config/constants.dart';
import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';

Widget mainButton({
  required Widget child,
  void Function()? onPressed,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
}) {
  return MaterialButton(
      onPressed: onPressed ?? () {},
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ManagerRadius.r12,
            ),
          ),
      color: color ?? ManagerColors.transparent,
      minWidth: minWidth ?? ManagerWidth.w16,
      height: height ?? ManagerHeight.h16,
      elevation: elevation ?? Constants.elevationButton,
      child: child);
}
