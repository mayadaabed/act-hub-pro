import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/widgets/main_button.dart';

Widget circleButton({
  required Function() onPressed,
  required IconData iconData,
}) {
  return mainButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: ManagerColors.iconColor,
      ),
      shapeBorder: const CircleBorder(),
      minWidth: ManagerWidth.w50,
      height: ManagerHeight.h50,
      color: ManagerColors.primaryColor);
}
