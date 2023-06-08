import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_icons.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/service/icon_service.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../routes/routes.dart';

Widget arrowBackButton({Color? color}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      top: ManagerHeight.h12,
    ),
    child: mainButton(
      onPressed: () {
        Get.offAllNamed(Routes.loginView);
      },
      child: IconService().getIcon(
        icon: ManagerIcons.arrow_back_ios,
        color: color ?? ManagerColors.white,
        iconSize: ManagerIconSize.s24,
      ),
      color: ManagerColors.transparent,
      elevation: Constants.arrowBackButtonElevation,
    ),
  );
}
