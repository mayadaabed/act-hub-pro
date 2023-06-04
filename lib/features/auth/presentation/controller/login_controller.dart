import 'package:act_hub_project/config/dependency_injection.dart';
import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:act_hub_project/core/resources/manager_fonts.dart';
import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:act_hub_project/core/resources/manager_styles.dart';
import 'package:act_hub_project/core/widgets/main_button.dart';
import 'package:act_hub_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_strings.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      retryAction: null,
      stateRenderType: StateRenderType.popUpLoadingState,
      title: '',
    );
    (await _loginUseCase.execute(
      LoginBaseUseCaseInput(email: email.text, password: password.text),
    ))
        .fold((l) {
      dialogRender(
          context: context,
          message: l.message,
          retryAction: null,
          stateRenderType: StateRenderType.popUpErrorState,
          title: '',
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w65),
            child: mainButton(
                height: ManagerHeight.h40,
                color: ManagerColors.primaryColor,
                child: Text(
                  ManagerStrings.ok,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.white,
                  ),
                ),
                onPressed: () {
                  Get.back();
                }),
          ));
      print('failed');
    }, (r) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.thanks,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: mainButton(
            child: Text(
              ManagerStrings.ok,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );
      print('success');
    });
  }
}
