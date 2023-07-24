import '../../presentation/model/course_details_data_attribute_model.dart';
import '../entity/course_details_data_attributes_entity.dart';
import 'package:act_hub_project/core/extentions/extentions.dart';


extension CourseDetailsDataAttributeMapper on CourseDetailsDataAttributeEntity {
  CourseDetailsDataAttributeModel toDomain() {
    return CourseDetailsDataAttributeModel(
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
