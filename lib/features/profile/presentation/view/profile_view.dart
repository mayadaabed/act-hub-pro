import 'package:act_hub_project/features/profile/presentation/view/widget/custom_photo.dart';
import 'package:act_hub_project/features/profile/presentation/view/widget/custom_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../routes/routes.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ManagerColors.primaryColor,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black),
                ))
          ],
          title: Text(
            'profile',
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.white),
          ),
        ),
        body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return ListView(
              children: [
                CustomPhoto(visible: false),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ManagerColors.backgroundForm,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    boxShadow: [
                      BoxShadow(
                        color: ManagerColors.greyLight,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h16),
                  child: Column(
                    children: [
                      const CustomProfile(
                        imagePath: ManagerAssets.profile,
                        textName: 'editProfile',
                      ),
                      const Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.setting,
                        textName: 'setting',
                        onTap: () => Get.toNamed(Routes.setting),
                      ),
                      Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.send,
                          textName: 'share'),
                      Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.stars,
                          textName: 'rates'),
                      Divider(),
                      CustomProfile(
                          imagePath: ManagerAssets.document,
                          textName: 'document'),
                      Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.logout,
                        textName: 'logout',
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}