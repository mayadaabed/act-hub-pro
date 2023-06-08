import 'package:act_hub_project/config/dependency_injection.dart';
import 'package:act_hub_project/features/auth/domain/use_case/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../../../routes/routes.dart';

class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();

  bool isAgreementPolicy = false;

  changePolicyStatus(bool status) {
    isAgreementPolicy = status;
    update();
  }

  void performRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (isAgreementPolicy) {
        register(context);
      } else {
        dialogRender(
            context: context,
            message: ManagerStrings.shouldAgreePolicy,
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
      }
    }
  }

  Future<void> register(BuildContext context) async {
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      retryAction: null,
      stateRenderType: StateRenderType.popUpLoadingState,
      title: '',
    );
    (await _registerUseCase.execute(RegisterUseCaseInput(
            name: fullName.text,
            email: email.text,
            password: password.text,
            confirmationPassword: confirmPassword.text,
            phone: phone.text)))
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
