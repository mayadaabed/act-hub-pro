import '../../presentation/model/course_details_model.dart';
import '../entity/course_details_entity.dart';
import './course_details_data_mapper.dart';

extension CourseDetailsMapper on CourseDetailsEntity {
  CourseDetailsModel toDomain() {
    return CourseDetailsModel(
      courseDetailsDataModel: courseDetailsDataEntity?.toDomain(),
    );
  }
}
