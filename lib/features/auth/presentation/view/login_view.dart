import 'package:act_hub_project/core/resources/manager_colors.dart';
import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:act_hub_project/core/resources/manager_styles.dart';
import 'package:act_hub_project/core/widgets/custome_check_box.dart';
import 'package:act_hub_project/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_feild.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../routes/routes.dart';
import '../widget/auth_view.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return authView(
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  ManagerStrings.login,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.black,
                  ),
                ),
                SizedBox(height: ManagerHeight.h30),
                baseTextFormField(
                  controller: controller.email,
                  hintText: ManagerStrings.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => _failedValidator.validateEmail(
                    value,
                  ),
                ),
                SizedBox(height: ManagerHeight.h16),
                baseTextFormField(
                  controller: controller.password,
                  hintText: ManagerStrings.password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) => _failedValidator.validatePassword(
                    value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        customCheckBox(
                          state: controller.rememberMe,
                          onChanged: (status) {
                            controller.changeRememberMe(status!);
                          },
                        ),
                        Text(
                          ManagerStrings.rememberMe,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                mainButton(
                    child: Text(
                      ManagerStrings.forgetPassword,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.primaryColor),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.forgetPassword);
                    }),
                SizedBox(height: ManagerHeight.h100),
                mainButton(
                  child: Text(
                    ManagerStrings.login,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.white,
                    ),
                  ),
                  minWidth: double.infinity,
                  color: ManagerColors.primaryColor,
                  height: ManagerHeight.h40,
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login(context);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.haveNotAccount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black),
                    ),
                    mainButton(
                        child: Text(
                          ManagerStrings.signUp,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(Routes.registerView);
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
