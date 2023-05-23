import 'package:act_hub_project/core/resources/manager_assets.dart';
import 'package:act_hub_project/core/resources/manager_fonts.dart';
import 'package:act_hub_project/core/resources/manager_sizes.dart';
import 'package:act_hub_project/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/main_button.dart';
import 'widget/slider_indicator.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w16,
            vertical: ManagerHeight.h20,
          ),
          child: Column(
            children: [
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: mainButton(
                    child: Text(
                      ManagerStrings.skip,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.textColor),
                    ),
                  )),
              SizedBox(
                height: ManagerHeight.h86,
              ),
              SvgPicture.asset(
                ManagerAssets.outBoardingImage1,
                width: double.infinity,
                height: ManagerHeight.h206,
              ),
              SizedBox(
                height: ManagerHeight.h50,
              ),
              const SilderIndicator(),
              SizedBox(
                height: ManagerHeight.h50,
              ),
              Text(
                ManagerStrings.outBoardingTitle1,
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s34,
                    color: ManagerColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Text(
                ManagerStrings.outBoardingSubTitle1,
                style: getTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.textColorLight,
                    weight: ManagerFontWeight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: mainButton(
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
        ),
      ),
    );
  }
}
