import 'package:act_hub_project/features/courses/presentation/view/widget/custom_bottom.dart';
import 'package:act_hub_project/features/courses/presentation/view/widget/custom_image.dart';
import 'package:act_hub_project/features/courses/presentation/view/widget/customized.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/course_details_controller.dart';
import '../controller/stepper_controller.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
     return willPopScope(
      onWillPop: () async {
        Get.delete<CourseDetailsController>();
        Get.delete<StepperController>();
        return true;
      },
      child: GetBuilder<CourseDetailsController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: Constants.elevation,
              backgroundColor: ManagerColors.transparent,
              iconTheme: IconThemeData(
                color: const Color.fromARGB(255, 50, 36, 36),
                size: ManagerIconSize.s36,
              ),
            ),
            extendBodyBehindAppBar: true,
            body: RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                await controller.readCourseDetails();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: ManagerHeight.h812,
                  child: Stack(
                    children: [
                      CustomImage(
                          controller: controller,
                          ),
                      CustomDescription(
                        name: controller.courseName,
                        description: controller.courseDescription,
                        hourTraining: controller.courseHourTraining,
                        rate: controller.courseRate.toString(),
                        initialRating: controller.courseRate,
                        isRated: controller.courseIsRated,
                        onRatingUpdate: (rating) {
                         controller.courseRating(
                            context: context,
                            value: rating,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottom(
              price: controller.price,
              onPressed: () {
                controller.paymentSelection(context);
              },
            ),
          );
        },
      ),
    );
  }
}