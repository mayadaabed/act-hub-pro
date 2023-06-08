import 'package:act_hub_project/config/dependency_injection.dart';
import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:act_hub_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../../../routes/routes.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  bool rememberMe = false;

  changeRememberMe(bool status) {
    rememberMe = status;
    update();
  }

  void performLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

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
              child: dialogButton(
                onPressed: () {
                  Get.back();
                },
                message: ManagerStrings.ok,
              )));
    }, (r) {
      if (rememberMe) {
        _appSettingsSharedPreferences.setEmail(email.text);
        _appSettingsSharedPreferences.setPassword(password.text);
        _appSettingsSharedPreferences.setLoggedIn();
      }
      _appSettingsSharedPreferences.setToken(r.token.onNull());
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
            child: dialogButton(
                message: ManagerStrings.ok,
                onPressed: () {
                  Get.back();
                })),
        retryAction: () {},
      );
      Future.delayed(const Duration(seconds: Constants.loginTimer), () {
        Get.offAllNamed(Routes.mainView);
      });
    });
  }
}
