import 'package:act_hub_project/core/extentions/extentions.dart';
import '../../domain/entity/course_rating_entity.dart';
import '../response/course_rating_response.dart';

extension CourseRatingMapper on CourseRatingResponse {
  CourseRatingEntity toDomain() => CourseRatingEntity(
        status: status.onNull(),
      );
}