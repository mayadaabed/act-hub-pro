import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_sizes.dart';

Widget customCheckBox({
  required bool state,
  required void Function(bool?) onChanged,
}) {
  return Checkbox(
    value: state,
    onChanged: onChanged,
    activeColor: ManagerColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r4,
      ),
    ),
  );
}
