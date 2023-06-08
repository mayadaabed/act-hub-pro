import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../domain/model/category_model.dart';
import '../../domain/model/course_model.dart';
import '../../domain/model/slider_model.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;

  List<SliderModel> sliders = [];

  List<CourseModel> popularCourses = [];

  List<CategoryModel> categories = [];

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

  Future<void> home() async {}

  courseHoursFormat(int index) {
    return "${popularCourses[index].attributes!.hours.toString()} hour";
  }
}
