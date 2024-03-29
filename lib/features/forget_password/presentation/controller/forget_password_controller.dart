import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';
import '../../domain/use_case/forget_password_use_case.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordUseCase _useCase = instance<ForgetPasswordUseCase>();
  late TextEditingController email;
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  void forgetPassword(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _useCase.execute(
      ForgetPasswordInput(
        email: email.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.sorryFailed,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      if (r.status!) {
        dialogRender(
            context: context,
            message: ManagerStrings.sendOtpSuccess,
            title: '',
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();
              Get.offNamed(
                Routes.resetPassword,
              );
            });
      } else {
        dialogRender(
          context: context,
          message: ManagerStrings.sorryFailed,
          title: ManagerStrings.error,
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Get.back();
          },
        );
      }
    });
  }
}
