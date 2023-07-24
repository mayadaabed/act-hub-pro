import '../../domain/entity/course_details_entity.dart';
import '../response/course_details_reponse.dart';
import 'course_details_data_mapper.dart';

extension CourseDetailsMapper on CourseDetailsResponse {
  CourseDetailsEntity toDomain() {
    return CourseDetailsEntity(
      courseDetailsDataEntity: courseDetailsDataResponse?.toDomain(),
    );
  }
}
