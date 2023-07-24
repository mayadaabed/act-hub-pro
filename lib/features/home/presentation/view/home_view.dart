import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_banner.dart';
import '../widgets/custom_category.dart';
import '../widgets/custom_course.dart';
import '../widgets/custom_text.dart';
import '../widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: Scaffold(
        appBar: homeAppBar(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                await controller.home();
              },
              child: ListView(
                children: [
                  SizedBox(height: ManagerHeight.h20),
                  const CustomBanner(),
                  CustomText(
                    name: ManagerStrings.categories,
                    nameButton: ManagerStrings.seeAll,
                    buttonColor: ManagerColors.black.withOpacity(
                      ManagerOpacity.op0_5,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: ManagerHeight.h48,
                    child: ListView.builder(
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCategory(
                          name: controller
                              .categories[index].attributeCategoryModel!.title
                              .toString(),
                          imagePath: controller
                              .categories[index].attributeCategoryModel!.image
                              .toString(),
                          index: index,
                        );
                      },
                    ),
                  ),
                  CustomText(
                    name: ManagerStrings.popularCourses,
                    nameButton: ManagerStrings.viewAll,
                    buttonColor: ManagerColors.primaryColor,
                  ),
                  SizedBox(
                    height: ManagerHeight.h500,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.popularCourses.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CustomCourse(
                              index: index,
                              controller: controller,
                              onTap: () =>
                                  controller.performCategoryDetails(index),
                            ),
                            Divider(
                              indent: ManagerWidth.w14,
                              endIndent: ManagerWidth.w14,
                              color: ManagerColors.greyLight,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
