import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';
import '../extentions/extentions.dart';

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
      onPressed: onPressed.onNull(),
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ManagerRadius.r12,
            ),
          ),
      color: color.onNull(),
      minWidth: minWidth.onNull(),
      height: height.onNull(),
      elevation: elevation.onNull(),
      child: child);
}
