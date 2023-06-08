import 'package:act_hub_project/core/extentions/extentions.dart';
import 'package:act_hub_project/features/home/data/response/course_response.dart';
import 'package:act_hub_project/features/home/domain/model/course_model.dart';
import 'attribute_course_mapper.dart';

extension CourseMapper on CourseResponse {
  CourseModel toDomain() {
    return CourseModel(
      id: id.onNull(),
      isRated: isRated.onNull(),
      userRate: userRate.onNull(),
      attributes: attributes?.toDomain(),
    );
  }
}
