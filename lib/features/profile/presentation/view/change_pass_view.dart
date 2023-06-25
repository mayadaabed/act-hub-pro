import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_feild.dart';
import '../../../../core/widgets/main_button.dart';
import '../controller/profile_controller.dart';

class ChangePassView extends StatelessWidget {
  ChangePassView({super.key});

  final FailedValidator _validator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ManagerHeight.h206,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    ManagerRadius.r20,
                  ),
                  bottomRight: Radius.circular(
                    ManagerRadius.r20,
                  ),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.symmetric(
                vertical: ManagerHeight.h44,
                horizontal: ManagerWidth.w20,
              ),
              child: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: ManagerColors.white,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ManagerHeight.h100),
              child: Container(
                width: double.infinity,
                height: ManagerHeight.h300,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w30, vertical: ManagerHeight.h30),
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r20),
                    color: ManagerColors.backgroundForm,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ]),
                child: GetBuilder<ProfileController>(
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Text(
                            ManagerStrings.changePassword,
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s20,
                                color: ManagerColors.primaryColor),
                          ),
                          SizedBox(
                            height: ManagerHeight.h8,
                          ),
                          Text(
                            'resetPasswordMessage',
                            textAlign: TextAlign.center,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          baseTextFormField(
                            hintText: 'newPassword',
                            controller: controller.newPassController,
                            obscureText: true,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: ManagerHeight.h30,
                          ),
                          baseTextFormField(
                            hintText: ManagerStrings.confirmPass,
                            controller: controller.confirmPassController,
                            obscureText: true,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          SizedBox(
                            height: ManagerHeight.h40,
                            child: mainButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.changePassword();
                                }
                              },
                              minWidth: double.infinity, child:  Text(ManagerStrings.confirm),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
