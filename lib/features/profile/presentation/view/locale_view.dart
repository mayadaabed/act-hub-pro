import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../controller/locale_notifier_controller.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerStrings.localePage,
      ),
      body: GetBuilder<LocaleNotifierController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
          ),
          child: SizedBox(
            height: ManagerHeight.h100,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language,
                      size: ManagerIconSize.s24,
                    ),
                    const Spacer(),
                    Text(
                      ManagerStrings.language,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      controller.languageList[controller.currentLanguage]
                          .onNull(),
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: ManagerIconSize.s24,
                    ),
                  ],
                ),
                items: controller.languageList.values.map((value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: getTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.black,
                          weight: FontWeight.bold,
                        ),
                      ));
                }).toList(),
                isExpanded: true,
                value: controller.languageList[controller.currentLanguage],
                onChanged: (value) {
                  for (var entry in controller.languageList.entries) {
                    if (entry.value == value) {
                      controller.changeLanguage(
                        context: context,
                        langCode: entry.key,
                      );
                    }
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
