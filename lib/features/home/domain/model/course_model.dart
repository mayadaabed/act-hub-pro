import 'attribute_course_model.dart';

class CourseModel {
  int? id;
  bool? isRated;
  double? userRate;
  List<AttributeCourseModel>? attributes;

  CourseModel({
    this.id,
    this.isRated,
    this.userRate,
    this.attributes,
  });
}
