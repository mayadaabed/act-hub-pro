import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../../../routes/routes.dart';
import '../../domain/use_case/send_otp_use_case.dart';
import '../../domain/use_case/verification_use_case.dart';

class VerificationController extends GetxController {
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  FailedValidator validator = FailedValidator();
  var formKey = GlobalKey<FormState>();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;
  final VerificationUseCase _verificationUseCase =
      instance<VerificationUseCase>();

  final SendOtpUseCase _sendOtpUseCase = instance<SendOtpUseCase>();

  void verifyEmail(BuildContext context) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _verificationUseCase.execute(
      VerificationUseCaseInput(
        email: email,
        otp: otp(),
      ),
    ))
        .fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.error,
          stateRenderType: StateRenderType.popUpErrorState,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w65,
            ),
            child: dialogButton(
              message: ManagerStrings.ok,
              onPressed: () {
                Get.back();
              },
            ),
          ),
        );
      },
      (r) {
        Get.back();
        dialogRender(
          context: context,
          message: ManagerStrings.verificationSuccess,
          title: ManagerStrings.thanks,
          stateRenderType: StateRenderType.popUpSuccessState,
          child: dialogButton(
            message: ManagerStrings.ok,
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.loginView);
            },
          ),
        );
      },
    );
  }

  otp() {
    return "${firstCodeTextController.text}${secondCodeTextController.text}${thirdCodeTextController.text}${fourthCodeTextController.text}${fifthCodeTextController.text}${sixthCodeTextController.text}";
  }

  sendOtp({
    required BuildContext context,
    String? route,
  }) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _sendOtpUseCase.execute(SendOtpInput(email: email))).fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.error,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: ManagerStrings.sendOtpSuccess,
          title: '',
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
            if (route.onNull() != '') {
              Get.offAllNamed(route!);
            }
          });
    });
  }

  @override
  void onInit() {
    super.onInit();
    firstCodeTextController = TextEditingController();
    secondCodeTextController = TextEditingController();
    thirdCodeTextController = TextEditingController();
    fourthCodeTextController = TextEditingController();
    fifthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    firstCodeTextController.dispose();
    secondCodeTextController.dispose();
    thirdCodeTextController.dispose();
    fourthCodeTextController.dispose();
    fifthCodeTextController.dispose();
    sixthFocusNode.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    formKey.currentState!.dispose();
  }
}
