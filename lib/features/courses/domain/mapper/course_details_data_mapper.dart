import '../../presentation/model/course_details_data_model.dart';
import '../entity/course_details_data_entity.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';
import 'course_details_data_attribute_mapper.dart';

extension CourseDetailsDataMapper on CourseDetailsDataEntity {
  CourseDetailsDataModel toDomain() {
    return CourseDetailsDataModel(
      id: id.onNull(),
      isRate: isRate.onNull(),
      userRate: userRate.onNull(),
      courseDetailsDataAttributeModel:
          courseDetailsDataAttributeEntity?.toDomain(),
    );
  }
}
