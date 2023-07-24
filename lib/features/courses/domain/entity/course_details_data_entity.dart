import 'course_details_data_attributes_entity.dart';

class CourseDetailsDataEntity {
  int? id;
  bool? isRate;
  int? userRate;
  CourseDetailsDataAttributeEntity? courseDetailsDataAttributeEntity;

  CourseDetailsDataEntity({
   required this.id,
   required this.isRate,
   required this.userRate,
   required this.courseDetailsDataAttributeEntity,
  });
}