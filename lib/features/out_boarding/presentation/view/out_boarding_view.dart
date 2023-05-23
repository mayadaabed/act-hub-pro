import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:act_hub_project/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/widgets/main_button.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w16,
            vertical: ManagerHeight.h20,
          ),
          child: GetBuilder<OutBoardingController>(builder: (controller) {
            return Column(
              children: [
                Visibility(
                  visible: controller.isLastPage(),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: mainButton(
                        onPressed: () {
                          controller.skipPage();
                        },
                        child: Text(
                          ManagerStrings.skip,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.textColor),
                        ),
                      )),
                ),
                SizedBox(
                  height: ManagerHeight.h86,
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [...controller.pageViewItems],
                    onPageChanged: (index) {
                      controller.setCurrentPage(index);
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isLastPage(),
                  replacement: mainButton(
                      color: ManagerColors.primaryColor,
                      minWidth: double.infinity,
                      height: ManagerHeight.h40,
                      child: Text(
                        ManagerStrings.getStartedButton,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.white),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: controller.showBackButton(),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: mainButton(
                              onPressed: () {
                                controller.nextPage();
                              },
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                color: ManagerColors.iconColor,
                              ),
                              shapeBorder: const CircleBorder(),
                              minWidth: ManagerWidth.w50,
                              height: ManagerHeight.h50,
                              color: ManagerColors.primaryColor),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: mainButton(
                            onPressed: () {
                              controller.nextPage();
                            },
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: ManagerColors.iconColor,
                            ),
                            shapeBorder: const CircleBorder(),
                            minWidth: ManagerWidth.w50,
                            height: ManagerHeight.h50,
                            color: ManagerColors.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
