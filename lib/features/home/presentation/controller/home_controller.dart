import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';

import '../../../../config/dependency_injection.dart';
import '../../domain/model/category_model.dart';
import '../../domain/model/course_model.dart';
import '../../domain/model/slider_model.dart';
import '../../domain/use_case/home_use_case.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;

  List<SliderModel> sliders = [];

  List<CourseModel> popularCourses = [];

  List<CategoryModel> categories = [];

  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }

  void change(int index) {
    current = index;
    update();
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  Future<void> home() async {
    BuildContext context = Get.context!;
    (await _homeUseCase.execute()).fold((l) {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
      );
    }, (r) {
      sliders = r.sliders!;
      categories = r.categories!;
      popularCourses = r.courses!;
      update();
    });
  }

  courseHoursFormat(int index) {
    return "${popularCourses[index].attributes!.hours.toString()} hour";
  }
}
