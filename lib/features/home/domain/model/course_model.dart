import 'attribute_course_model.dart';

class CourseModel {
  int? id;
  bool? isRated;
  double? userRate;
  AttributeCourseModel? attributes;

  CourseModel({
    this.id,
    this.isRated,
    this.userRate,
    this.attributes,
  });
}
