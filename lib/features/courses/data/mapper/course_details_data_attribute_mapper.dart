import '../../domain/entity/course_details_data_attributes_entity.dart';
import '../response/course_details_data_attributes_response.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';

extension CourseDetailsDataAttributeMapper
    on CourseDetailsDataAttributeResponse {
  CourseDetailsDataAttributeEntity toDomain() {
    return CourseDetailsDataAttributeEntity(
      name: name.onNull(),
      description: description.onNull(),
      active: active.onNull(),
      resourceId: resourceId.onNull(),
      hours: hours.onNull(),
      price: price.onNull(),
      rate: rate.onNull(),
      avatar: avatar.onNull(),
    );
  }
}
