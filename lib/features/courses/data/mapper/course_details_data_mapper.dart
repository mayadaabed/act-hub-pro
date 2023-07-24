import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/entity/course_details_data_entity.dart';
import '../response/course_details_data_response.dart';
import 'course_details_data_attribute_mapper.dart';

extension CourseDetailsDataMapper on CourseDetailsDataResponse {
  CourseDetailsDataEntity toDomain() {
    return CourseDetailsDataEntity(
      id: id.onNull(),
      isRate: isRate.onNull(),
      userRate: userRate.onNull(),
      courseDetailsDataAttributeEntity:
          courseDetailsDataAttributeResponse?.toDomain(),
    );
  }
}
